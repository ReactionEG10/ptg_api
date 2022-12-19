<?php
defined('BASEPATH') or exit('No direct script access allowed');
/** set header **/
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header('Access-Control-Allow-Headers: origin, content-type, accept');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');

require(APPPATH . 'libraries/RestController.php');
require(APPPATH . 'libraries/Format.php');

use chriskacerguis\RestServer\RestController;

class User extends RestController
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }



    public function user_get()
    {
        $userID = $this->get("userID");
        $status = $this->get('status');
        $user_fname = $this->get("user_fname");
        $user_lname = $this->get("user_lname");

        if ($status == "one") {
            $where = "user_fname = '$user_fname' AND user_lname = '$user_lname'";
            $result = $this->user_model->getUserOne($where);
        } else {
            $result = $this->user_model->getUserAll();
        }



        $this->response($result, 200);
    }
    public function register_post()
    {
        $userName = $this->post("userName");
        $password = $this->post("password");
        $fname = $this->post("user_fname");
        $lname = $this->post("user_lname");
        $email = $this->post("email");
        $phone = $this->post("user_tel");

        $data = array(
            "user_fname" => $fname,
            "user_lname" => $lname,
            "userName" =>  $userName,
            "password" => $password,
            "email" => $email,
            "user_tel" => $phone
        );
        $userID = $this->user_model->insertUser($data);
        if ($userID > 0) {
            $res = array(
                "status" => "success",
                "detail" =>  $userID

            );
            $this->response($res, 200);
        } else {
            $res = array(
                "status" => "error not creat user"
            );
            $this->response($res, 400);
        }
    }


    public function login_get()
    {
        $userName = $this->get("userName");
        $password = $this->get("password");

        $result = $this->user_model->login($userName, $password);

        if ($result == null) {
            $result = array(
                'status'    => 'error',
                'detail'    => "username or password incorrect"
            );
            $this->response($result, 400);
        } else {
            $res = array(
                'detail'    => "login success",
                "data" => $result
            );
            $this->response($res, 200);
        }
    }

    public function editprofail_put()
    {
        $userID = $this->put("userID");
        $user_fanme = $this->put("user_fname");
        $user_lanme = $this->put("user_lname");
        $email = $this->put("email");
        $user_tel = $this->put("user_tel");

        $data = array(
            "user_fname" => $user_fanme,
            "user_lname" => $user_lanme,
            "email" => $email,
            "user_tel" => $user_tel
        );
        $this->user_model->edit($data, $userID);
        $this->response(200);
    }

    public function resetpassword_put()
    {
        $userID = $this->put("userID");
        $password = $this->put("password");


        $data = array(
            "password" => $password
        );
        $this->user_model->edit($data, $userID);
        $this->response(200);
    }
}
