<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
<title>CHAT</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet" />

<!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>


<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


<style>
body {
	font-size: 12px;
}

.top-buffer-10 {
	margin-top: 10px;
}

.top-buffer {
	margin-top: 20px;
}

.bottom-buffer {
	margin-bottom: 20px;
}

.no-padding {
	padding: 0px;
}

.top-padding-10 {
	padding-top: 10px;
	margin: auto;
}

.top-bottom-nopadding {
	padding-top: 0px;
	padding-bottom: 0px;
}

.fill {
	/*min-height: 75px;
            box-shadow: 0px 0px 1px #888888;*/
	border-top: 1px solid #bce8f1;
}

.group-chat {
	color: #fff;
	/*background: linear-gradient(to bottom, #99DAFF 5%, #008080 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='@success-color', endColorstr='darken(@success-color, 5%)', GradientType=0);
            background-color: #99DAFF;
            height: 75px;*/
	text-shadow: 0 2px #008080;
}

.chat {
	/*color: #fff;*/
	/*text-shadow: 0 2px #0a7d35;*/
	/*background: linear-gradient(to bottom, #c1fa7f 5%, #0a7d35 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='@success-color', endColorstr='darken(@success-color, 5%)', GradientType=0);
            background-color: #c1fa7f;
            /*bder: 1px solid #0a7d35;
            height: 75px;*/
	
}

.private-room {
	color: #fff;
	/*background: linear-gradient(to bottom, #f7e382 5%, #f7a746 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='@success-color', endColorstr='darken(@success-color, 5%)', GradientType=0);
            background-color: #f7e382;
            border: 1px solid #f7a746;
            height: 75px;*/
	text-shadow: 0 2px #f7a746;
}

.content-box-title {
	/*line-height: 50px;*/
	text-align: center;
}

.tab-height {
	height: 315px;
}

.panel-footer ul li {
	/*height: 24px;*/
	border-right: 1px solid #c4c3c1;
	float: left;
	background: linear-gradient(to bottom, #307ecc 5%, #307ecc 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='@success-color',
		endColorstr='darken(@success-color, 5%)', GradientType=0);
	background-color: #307ecc;
	color: #fff;
	border: 1px solid;
}

.media {
	margin-top: 0px;
	height: 40px;
}

.media-body {
	padding: 5px;
}

#chat-left {
	border-right: 1px solid #bce8f1;
	height: auto;
}

#chat-left ul li:hover,#chat-left ul li:hover a {
	background-color: #307ecc;
	color: #fff;
	text-decoration: none;
}

#chat-right,#content {
	height: auto;
}

.name-list {
	overflow-x: auto;
	height: auto;
	min-height: 390px;
}

.media-object {
	max-height: 27px;
	box-shadow: 2px 2px 2px #888888;
}

::-webkit-scrollbar {
	-webkit-appearance: none;
	width: 12px;
	_background-color: #f0f0f0;
}

::-webkit-scrollbar-thumb {
	border-radius: 12px;
	border: 4px solid rgba(255, 255, 255, 0);
	background-clip: content-box;
	_background-color: #bfbfbf;
	background-color: #A0A0A0;
}

::-webkit-scrollbar-corner {
	background-color: #e6e6e6;
}

.online-green {
	/* border: 2px solid green; */
	width: 10px;
	height: 10px;
	background: #008000 none repeat scroll 0% 0%;
	position: relative;
	left: 22px;
	top: -8px;
	border: 1px solid #FFF;
}

}
.online-red{
	/* border: 2px solid red; */
	width: 10px;
	height: 10px;
	background: #F00 none repeat scroll 0% 0%;
	position: relative;
	left: 22px;
	top: -8px;
	border: 1px solid #FFF;
}

.online-orange {
	/* border: 2px solid orange; */
	width: 10px;
	height: 10px;
	background: #FFA500 none repeat scroll 0% 0%;
	position: relative;
	left: 22px;
	top: -8px;
	border: 1px solid #FFF;
}

.tab-close {
	position: absolute;
	right: 4px;
	top: 0px;
	font-size: 14px;
}

.tab-content {
	height: 100%;
	min-height: 330px;
}

.add_new_group_chat {
	position: absolute;
	z-index: 1;
	top: 15px;
	left: 2px;
	color: #726E73;
	font-weight: bold;
	font-size: 12px;
}

.invite_friend {
	padding-top: 5px;
	position: absolute;
	z-index: 1;
	background: #fff;
}

.tooltip-inner {
	white-space: pre;
	max-width: none;
}

.my-chat {
	padding: 0px;
}
</style>
<script id="demo" type="text/javascript">
var i=0;
$('.tab-close').click(function(){
    alert("Test");
     var tab_val = $(this).closest('li').find('a').attr('href');
     //alert(tab_val);
     if($(this).closest('li').prev().find('a').html() != null) {
         $(this).closest('li').prev().addClass('active');
         $(tab_val).prev().addClass("active");
         $('.invite_friend').removeClass("show");
         $('.invite_friend').addClass("hide");
     } else {
         $(this).closest('li').next().addClass('active');
         $(tab_val).next().addClass("active");
         $('.invite_friend').removeClass("show");
         $('.invite_friend').addClass("hide");
     }

     $($(this).closest('li')).remove();
     $( tab_val ).remove();

 });
        $(document).ready(function() {


//            $('span').click(function(){
//                var target = "#" + $(this).data("toggle");
//                $(".group-chat-list").addClass("show");
//                $(".group-chat-list").removeClass("hide");
//                $(".online-chat-list").addClass("hide");
//                //alert(target);
//            });

            $('.tab-close').click(function(){
               alert("Test");
                var tab_val = $(this).closest('li').find('a').attr('href');
                //alert(tab_val);
                if($(this).closest('li').prev().find('a').html() != null) {
                    $(this).closest('li').prev().addClass('active');
                    $(tab_val).prev().addClass("active");
                    $('.invite_friend').removeClass("show");
                    $('.invite_friend').addClass("hide");
                } else {
                    $(this).closest('li').next().addClass('active');
                    $(tab_val).next().addClass("active");
                    $('.invite_friend').removeClass("show");
                    $('.invite_friend').addClass("hide");
                }

                $($(this).closest('li')).remove();
                $( tab_val ).remove();

            });

            $('.add_new_group_chat').click(function(){
                $('.invite_friend').removeClass("hide");
                $('.invite_friend').addClass("show");
            });

            //$('.example').tooltip();
            $('[rel="tooltip"]').tooltip();

	         /*  $('.open-tab').click(function() { // bind click event to link
             $('li').addClass('active');
              var tab = $(this).attr('href');
                alert(tab);
               $('#tabs').tabs('select', tab);
                //$('#tabs').tabs({active: tab});
           }); */

        });

        $(document).ready(function() {
            $('#tabs').tabs();

            /*$('#my-text-link1').click(function() {
                //$('#tabs').tabs('select', '#one');
                $(this).find('a[href]').tab('show');
                //$('#myTab a[href="#profile"]').tab('show') // Select tab by name
            })*/

            $('.open-tab').click(function() {
                var link = $(this).attr('href');
                $('#tabs a[href="'+link+'"]').tab('show'); // Select tab by name
            });
        });
    </script>
</head>
<body style="font-family: Verdana">
	<div class="container" style="padding-top: 40px;">
		<div class="row ">
			<div class="col-sm-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						Chat
					</div>

					<div class="panel-body top-bottom-nopadding">
						<div class="row">
							<div id="chat-left" class="col-sm-4 no-padding">
								<div id="search" class="top-buffer-10">
									<div class="input-group" style="padding: 2px;">
										<input type="text" class="form-control" placeholder="Enter Name" id="search_user">
									</div>
								</div>

								<div class="name-list">
									<div class="online-chat-list">
										<ul class="media-list">
											<c:forEach var="user" items="${users}" varStatus="i">
												<li class="media">
													<div class="media-body">
														<div class="media">
															<c:choose>
																<c:when test="${user.status=='Online'}">
																<a class="pull-left" href="#"> <img class="media-object img-circle" src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
																<div class="online-green"></div>
															</a>
    															</c:when>
																<c:when test="${user.status=='Away'}">
																<a class="pull-left" href="#"> <img class="media-object img-circle " src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
																<div class="online-orange"></div>
															</a>
    															</c:when>
    															<c:when test="${user.status=='unavailable'}">
    															<a class="pull-left" href="#"> <img class="media-object img-circle " src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
																<div class="online-red"></div>
																</a>
    															</c:when>
																<c:otherwise>
    															<a class="pull-left" href="#"> <img class="media-object img-circle " src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
																<div class="online-red"></div>
																</a>
																</c:otherwise>
															</c:choose>
															<%-- <c:if test="${user.status=='Online'}">
															<a class="pull-left" href="#"> <img class="media-object img-circle online-green" src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
															</a>
															</c:if>
															 <c:if test="${user.status=='Online'}">
															<a class="pull-left" href="#"> <img class="media-object img-circle online-green" src="${pageContext.request.contextPath}/resources/assets/img/user.gif"> <!--<div class="online-red"></div>-->
															</a>
															</c:if> --%>
															

															<div class="media-body">
															 <a href="#${user.name}" class="open-tab" id="my-text-link2" onclick="addTab('${user.name}',${i.index},'${user.userName}')">${user.name}</a> <small class="text-muted"></small>
															 </div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>

								</div>
							</div>

							<div id="chat-right" class="col-sm-8 no-padding direct-chat-warning ">
								<!-------->
								<div id="content" class="top-buffer-10">
									<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
										<li class="active" id="tabNo0">
											<!--<div class="add_new">+</div>-->
											<button type="button" class="close add_new_group_chat" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">+</span>
											</button> <a href="#tabs-0" data-toggle="tab"> <span rel="tooltip" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" data-html="true" data-title="One<br>Two<br>Three">
													Group Chat </span>
										</a>
											<button type="button" class="close tab-close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</li>
									</ul>
									<div id="my-tab-content" class="tab-content">
										<div class="tab-pane active" id="tabs-0">
											<div class="input-group invite_friend hide">
												<input type="text" class="form-control" placeholder="Add friends to this chat" style="width: 80%; margin-left: 5px;"> <input class='form-control' id='message_body_reply'
													name='message[body]' placeholder='reply...' type='hidden'> <span class="input-group-btn">
													<button class="btn btn-info" type="button">Done</button>
												</span>
											</div>
											<div class="box-body chat chat-fixed" style="padding: 0px; height: auto;">
												<!-- Conversations are loaded here -->
												<div class='scrollable' data-scrollable-height='350' data-scrollable-start='bottom'>
													<div class="direct-chat-messages">
														<!-- Message. Default to the left -->
														<ul class="my-chat">
															<li class='message'>
																<div class="direct-chat-msg">
																	<div class='direct-chat-info clearfix'>
																		<span class='direct-chat-name pull-left'>Alexander Pierce</span> <span class='direct-chat-timestamp pull-right'>23 Jan 2:00 pm</span>
																	</div>
																	<!-- /.direct-chat-info -->
																	<img class="direct-chat-img" src="${pageContext.request.contextPath}/resources/bootstrap/img/user1-128x128.jpg" alt="message user image" />
																	<!-- /.direct-chat-img -->
																	<div class="direct-chat-text">
																		<div class="text_width">Is this template really for free? That's unbelievable!</div>
																	</div>
																	<!-- /.direct-chat-text -->
																</div> <!-- /.direct-chat-msg -->
															</li>
															<!-- Message to the right -->
															<li class='message'>
																<div class="direct-chat-msg right">
																	<div class='direct-chat-info clearfix'>
																		<span class='direct-chat-name pull-right'>Sarah Bullock</span> <span class='direct-chat-timestamp pull-left'>23 Jan 2:05 pm</span>
																	</div>
																	<!-- /.direct-chat-info -->
																	<img class="direct-chat-img" src="${pageContext.request.contextPath}/resources/bootstrap/img/user3-128x128.jpg" alt="message user image" />
																	<!-- /.direct-chat-img -->
																	<div class="direct-chat-text">
																		<div class="text_width">You better believe it!</div>
																	</div>
																	<!-- /.direct-chat-text -->
																</div> <!-- /.direct-chat-msg -->
															</li>
														</ul>
													</div>
												</div>
												<!--/.direct-chat-messages-->
												<!-- Contacts are loaded here -->
											</div>
											<!-- /.box-body -->
										</div>
									</div>
								</div>
								<div class="col-sm-12" style="height: 40px; padding: 0px 5px 0px 5px; bottom: 0px !important;">
									<div class="input-group">
										<input type="text" id="message_body" class="form-control" placeholder="Enter Message"> <span class="input-group-btn">
											<button class="btn btn-info" type="button" id="chat_submit" onclick="start()">Send</button>
										</span>
										<button class='btn btn-success hide' type='button' id="chat_reply_submit">sender</button>
									</div>
								</div>

							</div>
							<!-- container -->
						</div>
					</div>


					<div class="panel-footer no-padding" style="height: 20px;">
						<ul class="list-unstyled">


						</ul>

					</div>

				</div>
			</div>
		</div>
	</div>


	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jQuery-2.1.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-ui.min.js" type="text/javascript"></script>
	<!-- / jquery mobile (for touch events) -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.mobile.custom.min.js" type="text/javascript"></script>
	<!-- / jquery migrate (for compatibility with new jquery) [required] -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-migrate.min.js" type="text/javascript"></script>
	<!-- / jquery ui -->
	<!-- / jQuery UI Touch Punch -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
	<!-- / modernizr -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/theme.js" type="text/javascript"></script>
	<!-- / demo file [not required!] -->
	<!-- / START - page related files and scripts [optional] -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script>
	var a ={};
function addTab(e,index,userName){
	  // alert(e);
	  
	   var count = ++i;
	  // var name=userName.split("@");
	   if (!$("."+e)[0]){
		   
	   $('#tabs').append('<li id=tabNo'+count+'><a href="#'+e+'" data-toggle="tab">'+userName+'</a><button type="button" class="close tab-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></li>');
	   $('#my-tab-content').append('<div class="tab-pane '+e+' " id='+e+'><div class="box-body chat chat-fixed" style="padding: 0px; height: auto;"><div class="scrollable" data-scrollable-height="350" data-scrollable-start="bottom"> <div class="direct-chat-messages"><ul class="my-chat"><li class="message"></li></ul><input type="hidden" id="user'+count+'" value="'+userName+'" </div>');
	   
	  
      }
   }
   
var receive_url = 'ws://10.5.3.148:8080/ChatWebApp/chatRoom';
var websocketreceive = new WebSocket(receive_url);
websocketreceive.onerror = function(event) {
	onError(event);
};

websocketreceive.onopen = function(event) {
	onOpenReceive(event);
};

websocketreceive.onmessage = function(event) {
	onMessage(event);
};

function onOpenReceive(event) {
	//document.getElementById('messages').innerHTML = 'New Connection established';
	//websocketreceive.send();
}
   
  //var webSocket; 
   //function websocketTest(user){
	 //  var url = 'ws://10.5.3.148:8080/ChatWebApp/chatRoom/'+user;
	   // webSocket = new WebSocket(url);
	//alert("inside");
	 /*  function websocketTest(webSocket){
			webSocket.onerror = function(event) {
				onError(event);
			};

			webSocket.onopen = function(event) {
				onOpen(event);
			};

			webSocket.onmessage = function(event) {
				onMessage(event);
			};
   } */

			function onMessage(event) {
				//alert(event.data);
				$('#message_body_reply').val(event.data);
				
				$("#chat_reply_submit").click();
				/* document.getElementById('message_body').innerHTML += '<br />'
						+ event.data; */
				console.log(event.data);
			}

			function onOpen(event) {
				//document.getElementById('messages').innerHTML = 'New Connection established';
				//start();
			}

			function onError(event) {
				//alert(event.data);
			}

			function start() {
				var activeClass = $('#tabs').find('li.active a').html();
			    
				
				var text = document.getElementById("message_body").value;
				console.log(text);

				//a[activeClass].send(text);	
				
				var textToSend = activeClass+"##"+text;
				websocketreceive.send(textToSend);
				return false;
			}
	  
    function Chat_reply(e) {
    	var activeClass = $('.tab-pane.active').find('.my-chat');
        var chat, date, li, message, reply, scrollable, scroll_height, sender;
        chat = $(this).parents(".chat");
        li = chat.find("li.message");
        message = $("#message_body").val();
        var currentdate = new Date(); 
        var datetime =  currentdate.getDate() + "/"
                        + (currentdate.getMonth()+1)  + "/" 
                        + currentdate.getFullYear() + " @ "  
                        + currentdate.getHours() + ":"  
                        + currentdate.getMinutes();
                       
                        
        $("#message_body").val("");
        if (message.length !== 0) {
            my_reply = '<li class="message check"><div class="direct-chat-msg"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-left"><%= session.getAttribute("userName") %></span><span class="direct-chat-timestamp pull-right">'+datetime+'</span>' +
                    '</div><img class="direct-chat-img" src="${pageContext.request.contextPath}/resources/bootstrap/img/user1-128x128.jpg" alt="message user image" />' +
                    '<div class="direct-chat-text"><div class="text_width">' + message + '</div></div></div></li>';
            $(activeClass).find(".message").last().parent().append(my_reply);
            scrollable = li.parents(".scrollable");
            scroll_height = $(".scrollable").height();
            $(".scrollable").animate({scrollTop: $('.scrollable')[0].scrollHeight}, 500);
        }
    }
    function Chat_Sender(e) {
    	 var currentdate = new Date(); 
         var datetime =  currentdate.getDate() + "/"
                         + (currentdate.getMonth()+1)  + "/" 
                         + currentdate.getFullYear() + " @ "  
                         + currentdate.getHours() + ":"  
                         + currentdate.getMinutes();
        var chat, date, li, message, reply, scrollable, scroll_height, sender;
        chat = $(this).parents(".chat");
        message_reply = $("#message_body_reply").val();
        $("#message_body_reply").val("");
        var content = message_reply.split('##');
        var user = content[0];
      //  alert(user);
        var name = user.split('@');
        var text = content[1];
        var activeClass = "";
        if ($("."+name[0])[0]){
        	 activeClass = $('.'+name[0]).find('.my-chat');
        }else{
        	var count = ++i;
        	 $('#tabs').append('<li id=tabNo'+count+'><a href="#'+name[0]+'" data-toggle="tab">'+user+'</a><button type="button" class="close tab-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></li>');
      	   $('#my-tab-content').append('<div class="tab-pane '+name[0]+' " id='+name[0]+'> <div class="box-body chat chat-fixed" style="padding: 0px; height: auto;"><div class="scrollable" data-scrollable-height="350" data-scrollable-start="bottom"><div class="direct-chat-messages"><ul class="my-chat"><li class="message"></li></ul><input type="hidden" id="user'+count+'" value="'+user+'" </div>');
      	       	
        	//$('#tabs').append('<li id=tabNo'+count+'><a href="#tabs-'+count+'" data-toggle="tab">'+user+'</a><button type="button" class="close tab-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></li>');
     	   	//$('#my-tab-content').append('<div class="tab-pane '+name[0]+' " id="tabs-'+count+'"> <div class="direct-chat-messages"><ul class="my-chat"><li class="message"></li></ul><input type="hidden" id="user'+count+'" value="'+user+'" </div>');
        	activeClass = $("."+name[0]).find('.my-chat');
            }
       /*  if(activeClass = ""){
				alert("No user opened");
            } */
        if (message_reply.length !== 0) {
            sender = '<li class="message "><div class="direct-chat-msg right"><div class="direct-chat-info clearfix">' +
                    '<span class="direct-chat-name pull-right">'+name[0]+'</span><span class="direct-chat-timestamp pull-left">'+datetime+'</span>'+
                    '</div><img class="direct-chat-img" src="${pageContext.request.contextPath}/resources/bootstrap/img/user3-128x128.jpg" alt="message user image" />' +
                    '<div class="direct-chat-text"><div class="text_width">' + text + '</div></div></div></li>';
            $(activeClass).find(".message").last().parent().append(sender);
            li = chat.find("li.message");
            scrollable = li.parents(".scrollable");
            scroll_height = $(".scrollable").height();
            $(".scrollable").animate({scrollTop: $('.scrollable')[0].scrollHeight}, 500);
        }
            $('#tabs a[href="#'+name[0]+'"]').tab('show');
           
    }
    /* $('#message_body').keyup(function(e) {
        if (e.keyCode == 13)
        {
            Chat_reply(e);
        }
    }); */
    $("#chat_submit").on('click', function(e) {
        Chat_reply(e);
    });
    $("#chat_reply_submit").on('click', function(e) {
        Chat_Sender(e);
    });
    $('#message_body_reply').keyup(function(e) {
        if (e.keyCode == 13)
        {
            Chat_Sender(e);
        }
    });
    $('#search_user').keyup(function(e){
    	 if (e.keyCode == 13)
         {
             $.ajax({
            	 url: "search_user",
            	 data:{"searchString":$('#search_user').val()},
            	  success: function(result){
                    alert(result);
                 }
             });
    		 alert($('#search_user').val());
         }
         
        });
</script>


</body>
</html>
