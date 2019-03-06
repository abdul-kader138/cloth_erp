<?php defined('BASEPATH') OR exit('No direct script access allowed');
ini_set('memory_limit', '-1');
// set max execution time 2 hours / mostly used for exporting PDF
ini_set('max_execution_time', 3600);

/**
 * Created by PhpStorm.
 * User: a.kader
 * Date: 12-Nov-18
 * Time: 9:55 AM
 */
class Document extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        $this->permission_details = $this->site->checkPermissions();
        $this->lang->admin_load('document', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('document_model');
        $this->allowed_file_size_new = '20';
    }


    public function file_manager()
    {
        if (!$this->Owner && !$this->Admin) {
            $get_permission = $this->permission_details[0];
            if ((!$get_permission['document-file_manager'])) {
                $this->session->set_flashdata('warning', lang('access_denied'));
                die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . (isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : site_url('welcome')) . "'; }, 10);</script>");
                redirect($_SERVER["HTTP_REFERER"]);
            }
        }
        $data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('file_manager')));
        $meta = array('page_title' => lang('file_manager'), 'bc' => $bc);
        $this->page_construct('filemanager/filemanager', $meta, $this->data);
    }

    public function elfinder_init()
    {
        if (!$this->Owner && !$this->Admin) {
            $get_permission = $this->permission_details[0];
            if ((!$get_permission['document-file_manager'])) {
                $this->session->set_flashdata('warning', lang('access_denied'));
                die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . (isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : site_url('welcome')) . "'; }, 10);</script>");
                redirect($_SERVER["HTTP_REFERER"]);
            }
        }
        $this->load->helper('path');
        if ($this->Owner || $this->Admin) {
            $root_options = array(
                'driver' => 'LocalFileSystem',
                'path' => set_realpath('assets/uploads/documents'),
                'URL' => admin_url('assets/uploads/documents/'),
                'uploadMaxSize' => $this->allowed_file_size_new . 'M',
                'accessControl' => 'access',
                'uploadAllow' => array('application/pdf',
                    'application/force-download',
                    'application/x-download',
                    'application/docs',
                    'application/xls',
                    'image/png',
                    'image/jpg',
                    'binary/octet-stream'),
                'uploadOrder' => array(
                    'allow',
                    'deny'
                ),
                'attributes' => array(
                    array(
                        'pattern' => '/.tmb/',
                        'hidden' => true
                    ),
                    array(
                        'pattern' => '/.quarantine/',
                        'hidden' => true
                    ),
                    array(
                        'read' => true,
                        'write' => true,
                    )
                )
            );

        } else {
            $disabled = array();

            $upload = array('');
            if (!($get_permission['document-upload'])) array_push($upload, "all");
            $get_permission = $this->permission_details[0];
            if (!($get_permission['document-folder_download'])) array_push($disabled, "zipdl");
            if (!($get_permission['document-folder_create'])) array_push($disabled, 'extract', 'archive', 'mkdir');
            if (!($get_permission['document-file_delete'])) array_push($disabled, 'rename', 'rm', 'cut');

            $root_options = array(
                'driver' => 'LocalFileSystem',
                'path' => set_realpath('assets/uploads/documents'),
                'URL' => admin_url('assets/uploads/documents/'),
                'uploadMaxSize' => $this->allowed_file_size_new . 'M',
                'accessControl' => 'access',
                'uploadAllow' => array('application/pdf',
                    'application/force-download',
                    'application/x-download',
                    'application/docs',
                    'application/xls',
                    'image/png',
                    'image/jpg',
                    'binary/octet-stream'),
                'disabled' => $disabled,
                'uploadDeny' => $upload,
                'uploadOrder' => array(
                    'allow',
                    'deny'
                ),
                'attributes' => array(
                    array(
                        'pattern' => '/.tmb/',
                        'hidden' => true
                    ),
                    array(
                        'pattern' => '/.quarantine/',
                        'hidden' => true
                    ),
                    array(
//                    'pattern' => '/^\/TEST$/',
                        'read' => true,
                        'write' => true,
//                    'locked'  => true
                    )
                )
            );
        }
        $opts = array(
            'roots' => array(
                $root_options
            )
        );
        $this->load->library('elfinder_lib', $opts);
    }

}