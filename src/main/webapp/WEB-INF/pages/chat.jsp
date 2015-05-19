<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chat</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Bootstrap 3.3.2 -->
        <link href="/ChatWebApp/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="/ChatWebApp/resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
         <script src="/ChatWebApp/resources/bootstrap/js/jQuery-2.1.3.min.js" type="text/javascript"></script>
        <script src="/ChatWebApp/resources/bootstrap/js/jquery-ui.min.js" type="text/javascript"></script>
        <!-- / jquery mobile (for touch events) -->
        <script src="/ChatWebApp/resources/bootstrap/js/jquery.mobile.custom.min.js" type="text/javascript"></script>
        <!-- / jquery migrate (for compatibility with new jquery) [required] -->
        <script src="/ChatWebApp/resources/bootstrap/js/jquery-migrate.min.js" type="text/javascript"></script>
        <!-- / jquery ui -->
        <!-- / jQuery UI Touch Punch -->
        <script src="/ChatWebApp/resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <!-- / modernizr -->
        <script src="/ChatWebApp/resources/bootstrap/js/theme.js" type="text/javascript"></script>
        <!-- / demo file [not required!] -->
        <!-- / START - page related files and scripts [optional] -->
        <script src="/ChatWebApp/resources/bootstrap/js/jquery.slimscroll.min.js" type="text/javascript"></script>
        
      
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        Theme style
        <link href="../bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />  -->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
<script type="text/javascript">
	   var chatTo= "${toAddress}";
	   //alert(chatTo);
	   var url = 'ws://10.5.3.148:8080/ChatWebApp/chatRoom/'+chatTo;
	 //  alert(url); 
		var webSocket = new WebSocket(url);
        //alert(webSocket);
		webSocket.onerror = function(event) {
			onError(event);
		};

		webSocket.onopen = function(event) {
			onOpen(event);
		};

		webSocket.onmessage = function(event) {
			onMessage(event);
		};

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
			start();
		}

		function onError(event) {
			alert(event.data);
		}

		function start() {
			var text = document.getElementById("message_body").value;
			console.log(text);

			webSocket.send(text);
			return false;
		}
	</script>

    <style type="text/css">
        .text_width{width:100%; }
        .my-chat{padding:0px; }
    </style>
    <body class="skin-blue">
  ${user}
        <div class="wrapper">
            <!-- Left side column. contains the logo and sidebar -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <!-- Main content -->
                <input type="hidden" id="chat-to" value="${toAddress}">
                <section class="content">
                    <!-- Direct Chat -->
                    <div class="row">
                        <div class="col-md-3">
                            <!-- DIRECT CHAT WARNING -->
                            <div class="box box-warning direct-chat direct-chat-warning">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Direct Chat</h3>
                                    <div class="box-tools pull-right">
                                        <span data-toggle="tooltip" title="3 New Messages" class='badge bg-yellow'>3</span>
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="glyphicon glyphicon-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="glyphicon glyphicon-remove"></i></button>

                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body chat chat-fixed">
                                    <!-- Conversations are loaded here -->
                                    <div class='scrollable' data-scrollable-height='300' data-scrollable-start='bottom'>
                                        <div class="direct-chat-messages">
                                            <!-- Message. Default to the left -->
                                            <ul class="my-chat">
                                                <li class='message'>
                                                    <div class="direct-chat-msg">
                                                        <div class='direct-chat-info clearfix'>
                                                            <span class='direct-chat-name pull-left'><%= session.getAttribute("userName") %> </span>
                                                            <span class='direct-chat-timestamp pull-right'>23 Jan 2:00 pm</span>
                                                        </div>
                                                        <!-- /.direct-chat-info -->
                                                        <div class ='profile'></div>
                                                        <img class="direct-chat-img" src="http://www.lcfc.com/images/common/bg_player_profile_default_big.png" alt="message user image" /><!-- /.direct-chat-img -->
                                                        <div class="direct-chat-text">
                                                            <div class="text_width">Is this template really for free? That's unbelievable!</div>
                                                        </div>
                                                        <!-- /.direct-chat-text -->
                                                    </div>
                                                    <!-- /.direct-chat-msg -->

                                                </li>
                                                <!-- Message to the right -->
                                                <li class='message'>
                                                    <div class="direct-chat-msg right">
                                                        <div class='direct-chat-info clearfix'>
                                                            <span class='direct-chat-name pull-right'>${toAddress}</span>
                                                            <span class='direct-chat-timestamp pull-left'>23 Jan 2:05 pm</span>
                                                        </div>
                                                        <!-- /.direct-chat-info -->
                                                        <img class="direct-chat-img" src="http://tayloravemarketing.com/images/female-profile.png" alt="message user image" /><!-- /.direct-chat-img -->
                                                        <div class="direct-chat-text">
                                                            <div class="text_width">You better believe it!</div>
                                                        </div>
                                                        <!-- /.direct-chat-text -->

                                                    </div>
                                                    <!-- /.direct-chat-msg -->        
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--/.direct-chat-messages-->

                                    <!-- Contacts are loaded here -->

                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <form class="new-message" method="post" action="#" accept-charset="UTF-8">
                                        <input name="authenticity_token" type="hidden" />
                                        <div class="input-group">
                                            <input class='form-control' id='message_body' placeholder='Type your message here...' type='text'>
                                            <span class="input-group-btn">
                                                <button class='btn btn-success' type='button' id="chat_submit" onclick="start()">Send</button>
                                            </span>
                                        </div>
                                        <br/>
                                       <!--  <div class="input-group">
   <input type="text" name="message" id="msgText" placeholder="Type Message ..." class="form-control"/>-->
                                            <input class='form-control' id='message_body_reply' name='message[body]' placeholder='reply...' type='hidden'>
                                            <span class="input-group-btn">
<!--<button type="button" id="send" class="btn btn-warning btn-flat">Send</button> -->
                     <!--  </span> -->

                                                <button class='btn btn-success hide' type='button'  id="chat_reply_submit">sender</button>
                                            
                                        </div>
                                    </form>
                                </div>
                                <!-- /.box-footer-->
                            </div>
                            <!--/.direct-chat -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- ./wrapper -->
        <!-- / jquery [required] -->
        
        <script>
            function Chat_reply(e) {
                var chat, date, li, message, reply, scrollable, scroll_height, sender;
                chat = $(this).parents(".chat");
                li = chat.find("li.message");
                message = $("#message_body").val();
                $("#message_body").val("");
                if (message.length !== 0) {
                    my_reply = '<li class="message check"><div class="direct-chat-msg"><div class="direct-chat-info clearfix">' +
                            '<span class="direct-chat-name pull-left"><%= session.getAttribute("userName") %></span><span class="direct-chat-timestamp pull-right"><c:set var="now" value="<%=new java.util.Date()%>" /><fmt:formatDate type="both" 
            dateStyle="medium" timeStyle="medium" 
            value="${now}" />  </span>' +
                            '</div><img class="direct-chat-img" src="http://www.lcfc.com/images/common/bg_player_profile_default_big.png" alt="message user image" />' +
                            '<div class="direct-chat-text"><div class="text_width">' + message + '</div></div></div></li>';
                    $('.my-chat').find(".message").last().parent().append(my_reply);
                    scrollable = li.parents(".scrollable");
                    scroll_height = $(".scrollable").height();
                    $(".scrollable").animate({scrollTop: $('.scrollable')[0].scrollHeight}, 500);
                }
            }
            function Chat_Sender(e) {
              
                var chat, date, li, message, reply, scrollable, scroll_height, sender;
                chat = $(this).parents(".chat");
                message_reply = $("#message_body_reply").val();
            //    alert(message_reply+"in chat sender");
                $("#message_body_reply").val("");
                if (message_reply.length !== 0) {
                    sender = '<li class="message "><div class="direct-chat-msg right"><div class="direct-chat-info clearfix">' +
                            '<span class="direct-chat-name pull-right">${toAddress}</span><span class="direct-chat-timestamp pull-left"><c:set var="now" value="<%=new java.util.Date()%>" /><fmt:formatDate type="both" 
            dateStyle="medium" timeStyle="medium" 
            value="${now}" /></span>' +
                            '</div><img class="direct-chat-img" src="http://tayloravemarketing.com/images/female-profile.png" alt="message user image" />' +
                            '<div class="direct-chat-text"><div class="text_width">' + message_reply + '</div></div></div></li>';
                    $('.my-chat').find(".message").last().parent().append(sender);
                    li = chat.find("li.message");
                    scrollable = li.parents(".scrollable");
                    scroll_height = $(".scrollable").height();
                    $(".scrollable").animate({scrollTop: $('.scrollable')[0].scrollHeight}, 500);
                }

            }
            $('#message_body').keyup(function(e) {
                if (e.keyCode == 13)
                {
                    Chat_reply(e);
                }
            });
            $("#chat_submit").on('click', function(e) {
                Chat_reply(e)
            });
            $("#chat_reply_submit").on('click', function(e) {
                Chat_Sender(e)
            });
            $('#message_body_reply').keyup(function(e) {
                if (e.keyCode == 13)
                {
                    Chat_Sender(e)
                }
            });
        </script>
    </body>
</html>