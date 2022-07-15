<?php
defined('BASEPATH') or exit('No direct script access allowed');
class User_model extends CI_Model
{
	public function cek_user($email, $password)
	{
		return $this->db->select('*')
			->where('email', $email)
			->where('password', $password)
			->get('admin');
	}
}
