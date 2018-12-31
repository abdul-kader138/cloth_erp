<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Accounting extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->admin_load('sales', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('sales_model');
    }

    public function report_607($warehouse_id = null)
    {
    $this->sma->checkPermissions();
    $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
    if ($this->Owner || $this->Admin || !$this->session->userdata('warehouse_id')) {
        $this->data['warehouses'] = $this->site->getAllWarehouses();
        $this->data['warehouse_id'] = $warehouse_id;
        $this->data['warehouse'] = $warehouse_id ? $this->site->getWarehouseByID($warehouse_id) : null;
    } else {
        $this->data['warehouses'] = null;
        $this->data['warehouse_id'] = $this->session->userdata('warehouse_id');
        $this->data['warehouse'] = $this->session->userdata('warehouse_id') ? $this->site->getWarehouseByID($this->session->userdata('warehouse_id')) : null;
    }

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('accounting/report_607'), 'page' => lang('accounting')), array('link' => '#', 'page' => lang('report_607')));
        $meta = array('page_title' => lang('accounting'), 'bc' => $bc);
        $this->page_construct('accounting/report_607', $meta, $this->data);
    }

    public function getSales($warehouse_id = null, $customer_id = null)
    {
        $this->sma->checkPermissions();

        if ((!$this->Owner || !$this->Admin) && !$warehouse_id) {
            $user = $this->site->getUser();
            $warehouse_id = $user->warehouse_id;
        }
            $this->load->library('datatables');
            if ($warehouse_id) {
                $this->datatables
                    ->select("{$this->db->dbprefix('sales')}.id as id, DATE_FORMAT({$this->db->dbprefix('sales')}.date, '%Y-%m-%d %T') as date, companies.vat_no, tax_sl,tax_type, biller, {$this->db->dbprefix('sales')}.customer, round(total_tax,2), grand_total,  payment_status")
                    ->from('sales')
                    ->join('companies','sales.customer_id=companies.id','inner')
                    ->where('warehouse_id', $warehouse_id);
            } else {
                $this->datatables
                    ->select("{$this->db->dbprefix('sales')}.id as id, DATE_FORMAT({$this->db->dbprefix('sales')}.date, '%Y-%m-%d %T') as date, companies.vat_no, tax_sl,tax_type, biller, {$this->db->dbprefix('sales')}.customer, round(total_tax,2), grand_total,  payment_status")
                    ->from('sales')
                    ->join('companies','sales.customer_id=companies.id','inner');
            }

            //     $this->datatables->add_column("Actions", $action, "id");
            echo $this->datatables->generate();

    }

    public function accounting_actions()
    {
        if (!$this->Owner && !$this->GP['bulk_actions']) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        $this->form_validation->set_rules('form_action', lang("form_action"), 'required');

        if ($this->form_validation->run() == true) {

            if (!empty($_POST['val'])) {
              if ($this->input->post('form_action') == 'combine') {

                    $html = $this->combine_pdf($_POST['val']);

                } elseif ($this->input->post('form_action') == 'export_excel') {

                    $this->load->library('excel');
                    $this->excel->setActiveSheetIndex(0);
                    $this->excel->getActiveSheet()->setTitle(lang('sales'));
                    $this->excel->getActiveSheet()->SetCellValue('A1', lang('date'));
                    $this->excel->getActiveSheet()->SetCellValue('B1', lang('vat_number'));
                    $this->excel->getActiveSheet()->SetCellValue('C1', lang('fiscal_proof'));
                    $this->excel->getActiveSheet()->SetCellValue('D1', lang('biller_type'));
                    $this->excel->getActiveSheet()->SetCellValue('E1', lang('biller'));
                    $this->excel->getActiveSheet()->SetCellValue('F1', lang('customer'));
                    $this->excel->getActiveSheet()->SetCellValue('G1', lang('total_tax_amount'));
                    $this->excel->getActiveSheet()->SetCellValue('H1', lang('grand_total'));
                    $this->excel->getActiveSheet()->SetCellValue('I1', lang('payment_status'));

                    $row = 2;
                    foreach ($_POST['val'] as $id) {
                        $sale = $this->sales_model->getAllSalesDetails($id);
                        $this->excel->getActiveSheet()->SetCellValue('A' . $row, $this->sma->hrld($sale->date));
                        $this->excel->getActiveSheet()->SetCellValue('B' . $row, $sale->vat_no);
                        $this->excel->getActiveSheet()->SetCellValue('C' . $row, $sale->tax_sl);
                        $this->excel->getActiveSheet()->SetCellValue('D' . $row, $sale->tax_type);
                        $this->excel->getActiveSheet()->SetCellValue('E' . $row, $sale->biller);
                        $this->excel->getActiveSheet()->SetCellValue('F' . $row, $sale->customer);
                        $this->excel->getActiveSheet()->SetCellValue('G' . $row, $sale->total_tax);
                        $this->excel->getActiveSheet()->SetCellValue('H' . $row, $sale->grand_total);
                        $this->excel->getActiveSheet()->SetCellValue('I' . $row, lang($sale->payment_status));
                        $row++;
                    }

                    $this->excel->getActiveSheet()->getColumnDimension('A')->setWidth(20);
                    $this->excel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
                    $this->excel->getDefaultStyle()->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $filename = 'sales_fiscal_proof_' . date('Y_m_d_H_i_s');
                    $this->load->helper('excel');
                    create_excel($this->excel, $filename);
                }
            } else {
                $this->session->set_flashdata('error', lang("no_sale_selected"));
                redirect($_SERVER["HTTP_REFERER"]);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect($_SERVER["HTTP_REFERER"]);
        }
    }

    public function combine_pdf($sales_id)
    {
        $this->sma->checkPermissions('pdf');

        foreach ($sales_id as $id) {

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $inv = $this->sales_model->getInvoiceByID($id);
            if (!$this->session->userdata('view_right')) {
                $this->sma->view_rights($inv->created_by);
            }
            $this->data['barcode'] = "<img src='" . admin_url('products/gen_barcode/' . $inv->reference_no) . "' alt='" . $inv->reference_no . "' class='pull-left' />";
            $this->data['customer'] = $this->site->getCompanyByID($inv->customer_id);
            $this->data['payments'] = $this->sales_model->getPaymentsForSale($id);
            $this->data['biller'] = $this->site->getCompanyByID($inv->biller_id);
            $this->data['user'] = $this->site->getUser($inv->created_by);
            $this->data['warehouse'] = $this->site->getWarehouseByID($inv->warehouse_id);
            $this->data['inv'] = $inv;
            $this->data['rows'] = $this->sales_model->getAllInvoiceItems($id);
            $this->data['return_sale'] = $inv->return_id ? $this->sales_model->getInvoiceByID($inv->return_id) : NULL;
            $this->data['return_rows'] = $inv->return_id ? $this->sales_model->getAllInvoiceItems($inv->return_id) : NULL;
            $html_data = $this->load->view($this->theme . 'sales/pdf', $this->data, true);
            if (! $this->Settings->barcode_img) {
                $html_data = preg_replace("'\<\?xml(.*)\?\>'", '', $html_data);
            }

            $html[] = array(
                'content' => $html_data,
                'footer' => $this->data['biller']->invoice_footer,
            );
        }

        $name = lang("sales") . ".pdf";
        $this->sma->generate_pdf($html, $name);

    }


} 