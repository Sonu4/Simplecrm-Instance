var hack_login = function(username,password){
	var api_url = "service/v4_1/rest.php";
	var user_name = username;    //SugarCRM username
	var password = password;    //SugarCRM password
	var params = {
    user_auth:{
        user_name:user_name,
        password:password,
        encryption:"PLAIN"
    },
    application: "SugarCRM RestAPI Example"
};
var json = JSON.stringify(params);
$.ajax({
        url: api_url,
        type: "POST",
        data: { method: "login", input_type: "JSON", response_type: "JSON", rest_data: json },
        dataType: "json",
        success: function(result) {
             if(result.id) {
                    //HERE: you will have out put from rest
                //~ alert("sucessfully LOGIN Your session ID is : " + result.id);
                location.href="http://internaldemo.simplecrmdemo.com/index.php?action=index&module=Home&record=1";
                
             }
        },
});


}
