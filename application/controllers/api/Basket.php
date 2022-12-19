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

class Basket extends RestController {

	public function __construct()
    {
        parent::__construct();
        $this->load->model('basketmodel');
    }
    public function basket_get()
    {
        
        $result = $this->basketmodel->getBasket();

        $this->response($result, 200);
        
    }

    public function basket_post()
    {
        $userID = $this->post('userID');
        $p_id =  $this->post('p_id');
        $basket_qty = $this->post('basket_qty');
       
        $data = array(
            "userID" => $userID,
            "p_id" => $p_id,
            "basket_qty" => $basket_qty,
           
            
        );

        $p_id = $this->basketmodel->insert($data);

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


    public function BasketUser_get()
    {
        $userID = $this->get('userID');
       
        if(isset($userID)){
            $result = $this->basketmodel->getBasketUser($userID);
        }else{
            $result = array(
                "status"    => "error",
                "detail"    => "can not insert Type"
            );
        }

        $this->response($result, 200);
        
    }


}