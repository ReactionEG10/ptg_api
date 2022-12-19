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

class Product extends RestController {

	public function __construct()
    {
        parent::__construct();
        $this->load->model('productmodel');
    }
    public function product_get()
    {
        $p_id = $this->get('p_id');
       
        if(isset($p_id)){
            $result = $this->productmodel->getProductOne($p_id);
        }else{
            $result = $this->productmodel->getProduct();
        }

        $this->response($result, 200);
        
    }

    public function product_post()
    {
        $p_name = $this->post('p_name');
        $p_detail =  $this->post('p_detail');
        $p_price = $this->post('p_price');
        $p_qty = $this->post('p_qty');
        $p_img = $this->post('p_img');
        $p_type = $this->post('p_type');

        $data = array(
            "p_name" => $p_name,
            "p_detail" => $p_detail,
            "p_price" => $p_price,
            "p_qty" => $p_qty,
            "p_img" => $p_img,
            "p_type" => $p_type,
            
        );

        $p_id = $this->productmodel->insert($data);

        if($p_id > 0){
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


    public function productType_get()
    {
        $p_type = $this->get('p_type');
       
        if(isset($p_type)){
            $result = $this->productmodel->getProductType($p_type);
            if($result == []){
                echo "not type";
            }else{
                $this->response($result, 200);
            }
           
        }else{
         $result = array(
                "status"    => "error",
                "detail"    => "can not insert Type"
            );
        $this->response($result, 404);
        }

        
        
    }


}