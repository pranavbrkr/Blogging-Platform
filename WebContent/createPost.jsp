<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Blogging Platform</title>
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<!--  <script src="index.js"></script>-->
</head>

<body>
	<section class = "site-main">
		<section id ="mainbar" class = "headnav bs">	
			<header>
				<svg height="60" width="150">
					<a xlink:href="index.jsp">
						<text fill="black" font-size="30" x="4" y="40">Blogging</text>
					</a>
				Sorry, your browser does not support inline SVG.
				</svg>
				<section class = "head">
				<!--<form id="sf">
						<input type="search" placeholder="Search">
					</form>-->
					<%
                		String username = (String) session.getAttribute("user");
						String name = (String) session.getAttribute("name");
         			%>
            		<p style="margin-right:10px;">Hi, <%=name %></p> 
            		<form action=Logout>
            		<input type="submit" value="Logout" class="btn-design"/>
            		</form>
				</section>
			</header>
		</section>
		
		<div id="myModal" class="modal">
		    <div class="form-box">
		    	<div class="close"></div>
		    	<div class ="tab">
		    	   <button class="tablinks" onclick="opentab(event, 'Login',0)" id="defaultOpen">Login</button>
  				   <button class="tablinks" onclick="opentab(event, 'Register',0)">Register</button>
				</div>
			    <div id="Login" class="tabcontent">	
				      <form action="LoginController" id="login-form" method="post">
				      	<c:if test="${not empty errorMessage}">
			    			<script type="text/javascript">
			     				var modal = document.getElementById('myModal');
			     				modal.style.display = "block";
			     			</script>
			    			<p class = "error-msg"><c:out value="${errorMessage}"/></p>
			    		</c:if>
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Email</span>
				            </label>
				            <input type="email" name="email" class="form-control" />
				          </div>
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Password</span>
				            </label> 
				            <input type="password" name="password" class="form-control" />
				          </div>
				          <input type="submit" value="Login" class="btn" />
				          <p class="text-p">Don't have an account? <a onclick="opentab(event, 'Register',1)" style="cursor: pointer;">Sign up</a> </p>
				      </form>
			     </div>
			     
			     <div id="Register" class="tabcontent">
				      <form action="RegisterController" id="register-form" method="post">
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Name</span>
				            </label>
				            <input type="text" name="name" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Email</span>
				            </label>
				            <input type="email" name="email" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Password</span>
				            </label> 
				            <input id = "password" type="password" name="password" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Confirm Password</span>
				            </label> 
				            <input type="password" name="confirm_password" class="form-control" />
				          </div>

				          <input type="submit" value="Register" class="btn" />
				      </form>
			     </div>
			     
			     <script>
					function opentab(evt, tabName, action) 
					{
					  var tabcontent, tablinks;
					  tabcontent = document.getElementsByClassName("tabcontent");
					  tabcontent[0].style.display = "none";
					  tabcontent[1].style.display = "none";
					  
					  tablinks = document.getElementsByClassName("tablinks"); 
					  tablinks[0].className = tablinks[0].className.replace(" active", "");
					  tablinks[1].className = tablinks[1].className.replace(" active", "");
					  
					  document.getElementById(tabName).style.display = "block";
					  if(action == 0)
					  	evt.currentTarget.className += " active";
					  else
					  	tablinks[1].className += " active";
					}
					// Get the element with id="defaultOpen" and click on it
					document.getElementById("defaultOpen").click();
					</script>
		    </div>
		    </div>	   
		    <script type="text/javascript">
		      $(window).on('load',function(){
		        $('.form-group input').on('focus blur', function (e) {
		            $(this).parents('.form-group').toggleClass('active', (e.type === 'focus' || this.value.length > 0));
		        }).trigger('blur');
		      });

		      $(document).ready(function () {
		          $('#login-form').validate({
		              rules: {
		                  email: {
		                      required: true,
		                      email: true
		                  },
		                  password: {
		                      required: true
		                  }
		              }
		              // submitHandler: function(form) {
		              //   alert('valid form submitted');  
		              // }
		          });
		      });

		      jQuery.validator.addMethod("accept", function(value, element, param) {
  					return value.match(new RegExp("^" + param + "$"));
				});
		      $(document).ready(function () {
		          $('#register-form').validate({
		              rules: {
		              	  name: {
		              	  	required:true,
		              	  	accept: "[a-zA-Z]+"
		              	  },
		                  email: {
		                      required: true,
		                      email: true
		                  },
		                  password: {
		                      required: true,
		                      minlength: 6
		                  },
		                  confirm_password: {
		                  	required: true,
		                  	equalTo: "#password"
		                  }
		              },
		              messages: {
		              	name : {
		              		accept: "Enter a valid name"
		              	},
		              	password: {
		              		minlength : "At least 6 characters long"
		              	},
		              	confirm_password: {
		              		equalTo: "Password doesn't match"
		              	}
		              }
		          });
		      });
		      
		      var modal = document.getElementById('myModal');
				var btn = document.getElementById("topbutton");
				var span = document.getElementsByClassName("close")[0];
				var error_msg = document.getElementsByClassName("error-msg")[0];
				
				if(btn != null)
				{
					btn.onclick = function() {
						  modal.style.display = "block";
					}
				}
				

				span.onclick = function() {
				  modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				  if (event.target == modal) {
				    modal.style.display = "none";
				    error_msg.innerHTML = "";
				  }
				}
		    </script>
		    
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<h3 align="center">Create a Post</h3>  
			<form action="Addpost" method="post" enctype="multipart/form-data" style="margin: 0 auto;width:650px;margin-bottom:110px;">
				<span class="label-text">Post-Title</span>
				<input class="inputPostForm" type="text" name="title" placeholder="Enter title of the post" required/>
				<span class="label-text">Author-Name</span>
				<input class="inputPostForm" type="text" name="authorname" placeholder="Enter author of the post" required/>
				<span class="label-text">Post-Content</span>
    			<textarea class="inputPostForm" name="content" placeholder="Post Content.." style="height:200px;" required></textarea>
    			<span class="label-text" style="margin-right:25px;" >Post-Category</span>
    			<select name="category">
				    <option disabled selected value> -- select an option -- </option>
				    <option>CULTURE</option>
				    <option>TECH</option>
				    <option>STARTUPS</option>
				    <option>POLITICS</option>
				    <option>DESIGN</option>
				    <option>HEALTH</option>
				    <option>SCIENCE</option>
				    <option>MEMBERS</option>
				    <option>EDITOR</option>
				    <option>POPULAR</option>
				</select><br><br>
    			<span class="label-text" style="margin-right:25px;">Post-Image</span>
    			<input type="file" name="image" required/><br>
    			<input type="submit" value="Publish" class="btn-design" style="margin:0px;margin-top:20px;float:left;"/>
    			<input type="reset" value="Reset" class="btn-design" style="margin:0px;margin-top:20px;float:right;"/>
			</form>
		</div>
	</section>
</body>
</html>