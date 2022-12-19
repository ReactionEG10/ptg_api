<?php 

/**
 * 
 */
class ProductDetailModel extends CI_model
{

    public function getProductDetail()
    {
       
		$query = $this->db->select("*")
                     ->from("tbl_product")
                     ->join('tbl_product_detail','tbl_product_detail.p_id = tbl_product.p_id')
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    
    public function getProductDetailOne($p_id)
    {
        $where = "tbl_product.p_id = '".$p_id."'";
		$query = $this->db->select("*")
                     ->from("tbl_product")
                     ->join('tbl_product_detail','tbl_product_detail.p_id = tbl_product.p_id')
                     ->where($where)
	                 ->get();
	    $result = $query->result();
	    return $result;
    }

    public function insert($data)
    {
        $this->db->insert("tbl_product_detail",$data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
    }
    
}