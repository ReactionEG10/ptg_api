<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** set header **/
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Headers: origin, content-type, accept');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');

require(APPPATH.'libraries/RestController.php');
require(APPPATH.'libraries/Format.php');

use chriskacerguis\RestServer\RestController;

class ProductDetail extends RestController {

	public function __construct()
    {
        parent::__construct();
        $this->load->model('productdetailmodel');
    }
   

    public function productDetail_get()
    {
        $p_id = $this->get('p_id');
       
        if(isset($p_id)){
            $result = $this->productdetailmodel->getProductDetailOne($p_id);
        }else{
            $result = $this->productdetailmodel->getProductDetail();
        }

        $this->response($result, 200);
        
    }

    public function productDetail_post()
    {
        $p_id = $this->post('p_id');
        $p_size =  $this->post('p_size');
        $p_color = $this->post('p_color');
        $size_qty = $this->post('size_qty');
       

        $data = array(
            "p_id" => $p_id,
            "p_size" => $p_size,
            "p_color" => $p_color,
            "size_qty" => $size_qty,
           
            
        );

        $product_detail_id = $this->productdetailmodel->insert($data);

        if($product_detail_id > 0){
            $res = array(
                "status" => "success"
            ) ;
        }else{
            $res = array(
                "status" => "error"
            ) ;
        }
        
        $this->response($res, 200);
    }
    


}