<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{

  public function index()
  {
    $data['status'] = 'Admin';
    $data['title'] = 'kirene';
    $data['user'] = $this->db->get_where('tb_user', ['email' => $this->session->userdata('email')])->row_array();
    // echo 'Welcome User ' . $data['user']['name'];
    $this->load->view('user/template/header', $data);
    $this->load->view('user/template/sidebar', $data);
    $this->load->view('user/template/topbar', $data);
    $this->load->view('user/index', $data);
    $this->load->view('user/template/footer', $data);
    // 
  }

}


/* End of file Admin.php */
/* Location: ./application/controllers/Admin.php */
