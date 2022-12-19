<?php 

/**
 * 
 */
class ProductModel extends CI_model
{

    public function getProduct()
    {
       
		$query = $this->db->select("*")
                     ->from("tbl_product")
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    public function getProductOne($p_id)
    {
        $where = "tbl_product.p_id = '".$p_id."'";
		$query = $this->db->select("*")
                     ->from("tbl_product")
                     ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    public function insert($data)
    {
        $this->db->insert("tbl_product",$data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
    }
    

    public function getProductType($p_type)
    {
        $where = "tbl_product.p_type = '".$p_type."'";
		$query = $this->db->select("*")
                     ->from("tbl_product")
                     ->join('tbl_product_detail','tbl_product_detail.p_id = tbl_product.p_id')
                     ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

}