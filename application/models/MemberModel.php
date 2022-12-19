<?php 

/**
 * 
 */
class MemberModel extends CI_model
{
	public function loginMember($username,$password)
	{
		$where = "userName = '$username' AND '$password' ";
		$query = $this->db->select("userID,userName,user_fname,user_lanme")
	                 ->from("tbl_user")
	                 ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
	}

	public function registerMember($data)
	{
		$this->db->insert("member",$data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function checkingUsername($username)
	{
		$where = "username = '$username'";
		$query = $this->db->select("username")
	                 ->from("member")
	                 ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
	}

	public function getMemberInfo($memberID)
	{
		$where = "userID = '$memberID'";
		$query = $this->db->select("username,fname,lname,email,ruleName")
	                 ->from("member")
	                 ->join("rule","rule.ruleID = member.ruleID")
	                 ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
	}
}