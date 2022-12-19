วิธีการเรียกใช้งาน api
1.api login
    GET    http://localhost/warehouse-management/api/login?username={username}&password={password}
2.api shop all
    GET http://localhost/warehouse-management/api/shop
3.api shop one
    GET http://localhost/warehouse-management/api/shop/shopID={shopID}
4.api branch all
    GET http://localhost/warehouse-management/api/branch?shopID={shopID}
5.api shop one
    GET http://localhost/warehouse-management/api/branch/branchID={branchID}&shopID={shopID}
6. api register
    POST http://localhost/warehouse-management/api/member/register
        request parameter
            username    (request)
            password    (request)
            fname       (request)
            lname       (request)
            email       (request)
        
        response
            {
                "status": "", // success,error
                "detail": ""
            }
7. api check username
    GET http://localhost/warehouse-management/api/member/checkusername?username=admin
        request parameter 
            username    (request)
        response
            [
                {
                    "username": ""
                }
            ]
8.api get user info //เรียกดูข้อมูลของ user
    GET http://localhost/warehouse-management/api/member/info?memberID={memberID}
    response
        [
            {
                "username": "",
                "fname": "",
                "lname": "",
                "email": "",
                "ruleName": ""  //admin,superadmin,user
            }
        ]
9.api insert order and order detail // เพิ่มรายการซื้อของ
    POST http://localhost/warehouse-management/api/orders/orders
    request parameter
        {
            "orderDate":"2021-01-30",
            "address":"test test",
            "tel":"0990539172",
            "shopID":1,
            "userID":1,
            "ordersDetail":[
                {
                    "productID":1,
                    "qty":50
                }
            ]
        }
    response
        {
            "status": "",// success, error
            "detail": "",
            "orderID": "" // order ID
        }

10.api get order one
    GET http://localhost/warehouse-management/api/orders/orders?orderID={orderID}&memberID={userID}
    response
    [
        {
            "orderID": "6",
            "orderDate": "2021-01-30",
            "address": "2021-01-30",
            "tel": "0990539172",
            "shopID": "1",
            "userID": "1"
        }
    ]

11.api get order all
    GET http://localhost/warehouse-management/api/orders/orders?memberID={userID}
    response
    [
        {
            "orderID": "6",
            "orderDate": "2021-01-30",
            "address": "2021-01-30",
            "tel": "0990539172",
            "shopID": "1",
            "userID": "1"
        }
    ]

