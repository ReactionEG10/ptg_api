<?php

class User_model extends CI_model
{
	public function getUserOne($where)
	{

		$query = $this->db->select("*")
			->from("tbl_user")
			->where($where)
			->get();
		$result = $query->result();
		return $result;
	}

	public function getUserAll()
	{
		$query = $this->db->select("*")
			->from("tbl_user")
			->get();
		$result = $query->result();
		return $result;
	}

	public function insertUser($data)
	{
		$this->db->insert('tbl_user', $data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function login($username, $password)
	{
		$where = "userName = '$username' AND password = '$password' ";
		$query = $this->db->select("*")
			->from("tbl_user")
			->where($where)
			->get();
		$result = $query->result();
		return $result;
	}

	public function edit($data, $userID)
	{
		$where = "userID = '$userID'";
		$this->db->update('tbl_user', $data,$where);

	}
}
