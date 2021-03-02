<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
  public function index()
  {
    $data['status'] = 'Anggota';
    $data['title'] = 'Profil Saya';
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


/* End of file User.php */
/* Location: ./application/controllers/User.php */