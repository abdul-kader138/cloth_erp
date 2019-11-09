<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Approval extends MY_Controller
{

    function __construct()
    {

        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            admin_redirect('login');
        }


        $this->lang->admin_load('sales', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('approval_model');
        $this->permission_details = $this->site->checkPermissions();

    }


    function approval_list($ids = null)
    {
        if (!$this->Owner && !$this->Admin) {
            $get_permission = $this->permission_details[0];
            if ((!$get_permission['approval_sales_status_approve'])) {
                $this->session->set_flashdata('warning', lang('access_denied'));
                die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . (isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : site_url('welcome')) . "'; }, 10);</script>");
                admin_redirect($_SERVER["HTTP_REFERER"]);
            }
        }

        if ($this->input->post('id')) {
            $ids = $this->input->post('id');
        }

        $data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['id'] = "Type Approval";
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('Approval')));
        $meta = array('page_title' => lang("Type_Approval"), 'bc' => $bc);
        $this->page_construct('approval/approval_list', $meta, $this->data);
    }

    function getApproval($ids = null)
    {
        if (!$this->Owner && !$this->Admin) {
            $get_permission = $this->permission_details[0];
            if ((!$get_permission['approval_sales_status_approve'])) {
                $this->session->set_flashdata('warning', lang('access_denied'));
                die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . (isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : site_url('welcome')) . "'; }, 10);</script>");
                admin_redirect($_SERVER["HTTP_REFERER"]);
            }
        }

        if ($this->input->post('id')) {
            $ids = $this->input->post('id');
        }

        $approve_link = "";
        if ($get_permission['approval_sales_status_approve'] || $this->Owner || $this->Admin)
            $approve_link = '<div class="row_approve_status" id="$2">&nbsp;&nbsp;<i class="fa fa-edit"></i> Approve</div>';
        $action = '<div class="text-center"><div class="btn-group text-left">'
            . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
            . lang('actions') . ' <span class="caret"></span></button>
        <ul class="dropdown-menu pull-right" role="menu">
            <li>' . $approve_link . '</li>
        </ul>
    </div></div>';
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->load->library('datatables');
        $this->datatables
            ->select($this->db->dbprefix('approve_details') . ".application_id as id, " . $this->db->dbprefix('sales') . ".biller as bnam," . $this->db->dbprefix('sales') . ".reference_no," . $this->db->dbprefix('sales') . ".delivery_date," . $this->db->dbprefix('approve_details') . ".approver_seq_name as ref,"
                . $this->db->dbprefix('order_types') . ".name as oname," . $this->db->dbprefix('approve_details') . ".id as approves_id," . $this->db->dbprefix('approve_details') . ".approve_status as nam," . $this->db->dbprefix('approve_details') . ".created_date")
            ->from("approve_details")
            ->join('order_types', 'order_types.id=approve_details.category_id', 'left')
            ->join('sales', 'approve_details.application_id=sales.id', 'left')
            ->where('approve_status', 0)
            ->where('aprrover_id', $this->session->userdata('user_id'))
            ->group_by('approve_details.id')
            ->add_column("Actions", $action, "id,approves_id")
            ->unset_column('approves_id');
        echo $this->datatables->generate();
    }


    public function update_status($id = null)
    {

        $this->form_validation->set_rules('status', lang("status"), 'trim|required');
        $this->form_validation->set_rules('note', lang("note"), 'trim');
        if ($this->input->post('id')) {
            $ids = $this->input->post('id');
        }
        $info = $this->approval_model->getApproval($id);

        if (!$this->Owner && !$this->Admin) {
            if ($info->aprrover_id != $this->session->userdata('user_id')) {
                $this->session->set_flashdata('error', 'Unauthorized Access');
                admin_redirect('welcome');
            }
        }
        if ($this->form_validation->run() == true) {
            $status = $this->input->post('status');
            $note = $this->sma->clear_tags($this->input->post('note'));
        } elseif ($this->input->post('update')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome');
        }

        if ($this->form_validation->run() == true) {
            $approve_details_previous = null;

            if ($this->input->post('status') == 'Completed') {
                //        if ($this->form_validation->run() == true && $this->sales_model->updateStatus($id, $status, $note)) {
                // update current approval details
                $previous_approve_data = array(
                    'approve_status' => 'Completed',
                    'updated_by' => $this->session->userdata('user_id'),
                    'comments' => $note,
                    'status' => '1',
                    'updated_date' => date("Y-m-d H:i:s")
                );
                // update requisition
                $approve_details_previous = $previous_approve_data;        // update
            }

            if ($this->input->post('status') == 'Processing') {
                //        if ($this->form_validation->run() == true && $this->sales_model->updateStatus($id, $status, $note)) {
                // update current approval details
                $previous_approve_data = array(
                    'approve_status' => 'Processing',
                    'updated_by' => $this->session->userdata('user_id'),
                    'comments' => $note,
                    'status' => '0',
                    'updated_date' => date("Y-m-d H:i:s")
                );
                // update requisition

            }

            if ($this->input->post('status') == 'Jump Over') {
                $previous_approve_data = array(
                    'approve_status' => 'Jump Over',
                    'updated_by' => $this->session->userdata('user_id'),
                    'status' => '0',
                    'comments' => $note,
                    'updated_date' => date("Y-m-d H:i:s")
                );

            }
            if ($this->input->post('status') == 'Has Not Started') {
                $previous_approve_data = array(
                    'approve_status' => 'Has Not Started',
                    'comments' => $note,
                    'updated_by' => $this->session->userdata('user_id'),
                    'status' => '0',
                    'updated_date' => date("Y-m-d H:i:s")
                );

            }

            $approve_details_previous = $previous_approve_data;        // update
        }

//        if ($this->input->post('status') == 'Completed') {
        if ($this->form_validation->run() == true && $this->approval_model->updateStatus($approve_details_previous, $id, $info->application_id)) {
            $this->session->set_flashdata('message', lang('status_updated'));
            admin_redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'approval/approval_list/');
        } else {
            $this->data['approve'] = $info;
            $this->data['id'] = $id;
            $this->data['inv'] = $this->site->getInvoiceByID($info->application_id);
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'approval/update_status', $this->data);

        }
//        }
//        else {
//            if ($this->form_validation->run() == true && $this->approval_model->updateStatusReject($previous_approve_data, $info_data, $id, $info->application_id, $info->table_name)) {
//                $this->session->set_flashdata('message', lang('status_updated'));
//                redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'approval/approval_list/' . $info->table_name);
//            } else {
//                $this->data['approve'] = $info;
//                $this->data['inv'] =  $this->site->getInvoiceByID($info->application_id);
//                $this->data['id'] = $id;
//                $this->data['modal_js'] = $this->site->modal_js();
//                $this->load->view($this->theme . 'approval/update_status', $this->data);
//
//            }
//        }
    }


    function getNextApproval($next_id, $created_by, $created_date, $application_id, $category_id)
    {
        $userLists = $this->site->getAllUser();
        $info_details = $this->approval_model->getNextApprovals($next_id, $category_id);
        $user_details = $this->getApproveCustomer($userLists, $info_details->approver_id);
        $details = array();
        $approve_data = array(
            'aprrover_id' => $info_details->approver_id,
            'status' => 'Waiting For ' . $info_details->approver_seq_name . "(" . $user_details->first_name . " " . $user_details->last_name . ")",
            'approver_seq' => $info_details->approver_seq,
            'approver_seq_name' => $info_details->approver_seq_name,
            'created_by' => $created_by,
            'category_id' => $info_details->category_id,
            'type' => 'Sales',
            'next_approve_seq' => $info_details->approver_next_seq,
            'application_id' => $application_id,
            'created_date' => $created_date
        );


        if ($info_details && $user_details) {
            $details['approve_data'] = $approve_data;
            $details['status'] = 'Waiting For ' . $info_details->approver_seq_name . "(" . $user_details->first_name . " " . $user_details->last_name . ")";
            return $details;
        };
        return false;

    }

    function getApproveCustomer($userList, $approveId)
    {
        $userDetails = null;
        foreach ($userList as $user) {
            if ($approveId == $user->id) {
                $userDetails = $user;
                break;
            }
        }
        return $userDetails;
    }

    function approval_actions()
    {
        if (!$this->Owner && !$this->GP['bulk_actions']) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        $this->form_validation->set_rules('form_action', lang("form_action"), 'required');

        $approve_details_new = array();
        $approve_details_previous = array();
        if ($this->form_validation->run() == true) {
            if (!empty($_POST['val'])) {
                if ($this->input->post('form_action') == 'chuk_approval') {
                    $previous_approve_data = array();
                    $query_info_close = array();
                    foreach ($_POST['val'] as $id) {
                        $info = $this->approval_model->getApprovalBluk($id);
                        $getNextApproval = $this->getNextApproval($info->next_approve_seq, $info->table_name, $info->created_by, $info->created_date, $info->application_id, $info->category_id);

                        $previous_approve_data[] = "update " . $this->db->dbprefix('approve_details') . " set updated_by=" . $this->session->userdata('user_id') . ", updated_date='" . date("Y-m-d H:i:s") .
                            "', approve_status=1, status='approved' where id=" . (int)$info->id . "; ";

                        $approve_details_previous[] = $previous_approve_data;       // update
                        if ($getNextApproval) {
                            $approve_details_new[] = $getNextApproval['approve_data']; // insert
                            $status = $getNextApproval['status'];
                            $seq = (($approve_details_new['next_approve_seq']) ? $approve_details_new['next_approve_seq'] : 0);
                            $query_info_close[] = "update " . $this->db->dbprefix($info->table_name) . " set updated_by=" . $this->session->userdata('user_id') . ", updated_date='" . date("Y-m-d H:i:s") .
                                "', status='" . $status . "', next_approve_seq=" . $seq . " where id=" . (int)$info->application_id . "; ";

                        } else {
                            $query_info_close[] = "update " . $this->db->dbprefix($info->table_name) . " set updated_by=" . $this->session->userdata('user_id') . ", updated_date='" . date("Y-m-d H:i:s") .
                                "', approved=1, status='approved', next_approve_seq=0 where id=" . (int)$info->application_id . "; ";
                        }
                    }
                }
            } else {
                $this->session->set_flashdata('error', $this->lang->line("No_Data_Selected."));
                redirect($_SERVER["HTTP_REFERER"]);
            }
        }
        if ($this->form_validation->run() == true && $this->approval_model->updateStatusChunk($approve_details_new, $previous_approve_data, $query_info_close, $info->table_name)) {
            $this->session->set_flashdata('message', lang('status_updated'));
            redirect('approval/approval_list/' . $info->table_name);
        } else {
            $this->session->set_flashdata('error', "Error encountered, please contact with admin");
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'approval/approval_list/' . $info->table_name);

        }
    }
}