<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
  }
  public function index()
  {
    $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
    $this->form_validation->set_rules('password', 'Password', 'trim|required');

    if ($this->form_validation->run() == false) {
      $data['title'] = 'Halaman Login';
      $this->load->view('template/auth_header', $data);
      $this->load->view('auth/login');
      $this->load->view('template/auth_footer');
    } else {

      $this->_login();
    }
  }

  public function registration()
  {
    $this->form_validation->set_rules('name', 'Name', 'required|trim');
    $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[tb_user.email]');
    $this->form_validation->set_rules(
      'password1',
      'Password',
      'required|trim|min_length[8]|matches[password2]',
      ['matches' => 'Kata Sandi Tidak Cocok', 'min_length' => 'Password minimal 8 karakter!']
    );
    $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

    if ($this->form_validation->run() == false) {
      $data['title'] = 'Registrasi pengguna';
      $this->load->view('template/auth_header', $data);
      $this->load->view('auth/registration');
      $this->load->view('template/auth_footer');
    } else {
      // echo 'Data Berhasil Ditambahkan !';
      $data = [
        'name' => $this->input->post('name'),
        'email' => $this->input->post('email'),
        'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
        'role_id' => 2,
        'image' => 'default.jpg',
        'is_active' => 1,
        'date_create' => time()
      ];
      $this->db->insert('tb_user', $data);
      $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Selamat ! Akunmu Telah Dibuat </div>');
      redirect('auth');
    }
  }
  public function _login()
  {
    $email = $this->input->post('email');
    $password = $this->input->post('password');

    $user = $this->db->get_where('tb_user', ['email' => $email])->row_array();
    // var_dump($user);
    //die;
    //jika user ada

    if ($user) {
      if ($user['is_active'] == 1) {
        //cek password
        if (password_verify($password, $user['password'])) {
          $data = [
            'email' => $user['email'],
            'role_id' => $user['role_id'],
          ];
          $this->session->set_userdata($data);
          //controller page berdasarkan role_id
          if ($user['role_id'] == 1) {
            redirect('admin');
            # code...
          } else {
            redirect('user');
            # code...
          }
        } else {
          $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Kata Sandi Salah!!! </div>');
          redirect('auth');
        }
      } else {
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Email Ini Belom Diaktifkan ! </div>');
        redirect('auth');
      }
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Email ini Belom Diregistrasi ! </div>');
      redirect('auth');
    }
  }

  public function logout()
  {
    $this->session->sess_destroy();
    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Selamat ! Akunmu Berhasil Dikeluarkan </div>');
    redirect('auth');
    # code...
  }
}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */
