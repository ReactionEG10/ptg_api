<?php 

/**
 * 
 */
class BasketModel extends CI_model
{

    public function getBasket()
    {
       
		$query = $this->db->select("*")
                     ->from("tbl_basket")
                     ->join('tbl_product','tbl_product.p_id = tbl_basket.p_id')
                     ->join('tbl_product_detail','tbl_product_detail.p_id = tbl_basket.p_id')
                     ->join('tbl_user','tbl_user.userID = tbl_basket.userID')
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    public function getBasketUser($userID)
    {
        $where = "tbl_basket.userID = '".$userID."'";
		$query = $this->db->select("*")
                     ->from("tbl_basket")
                     ->join('tbl_product','tbl_product.p_id = tbl_basket.p_id')
                    //  ->join('tbl_product_detail','tbl_product_detail.p_id = tbl_basket.p_id')
                     ->join('tbl_user','tbl_user.userID = tbl_basket.userID')
                     ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    public function insert($data)
    {
        $this->db->insert("tbl_basket",$data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
    }
    

    

}