<%@ page language="java" contentType="text/html; charset=ISO-8859-1"                                                                        
    pageEncoding="ISO-8859-1"%>                                                                                                             
<!DOCTYPE html>                                    
<%@page import="java.util.Properties"%>                                                                                                     
<%@page import="javax.mail.Session"%>                                                                                                       
<%@page import="javax.mail.Authenticator"%>                                                                                                 
<%@page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@page import="javax.mail.Message"%>                                                                                                       
<%@page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@page import="javax.mail.Transport"%>                                                                                                     
<html>                                                                                                                                      
<head>                                                                                                                                      
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">                                                                    
<title>User Registration</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'/>
<meta content='all-language' http-equiv='Content-Language'/>
<meta content='Global' name='Distribution'/>
<meta content='India' name='geo.country'/>
<meta content='Solapur' name='geo.placename'/>
<meta content='Shubham Shah' name='author'/>
<meta content='document' name='resource-type'/>
<meta content='en' name='language'/>
<meta content='IN' name='country'/>
<meta content='all' name='audience'/>
<meta content='index,follow,snipet' name='googlebot'/>
<style>
.xx1 
{
font-family: 'Helvetica Neue',Helvetica, sans-serif;

color: #FFCC80;
font-weight:bold;
font-size: 75px;
text-shadow:0px 0px 0 rgb(223,223,223),-1px 1px 0 rgb(202,202,202),-2px 2px 0 rgb(180,180,180),-3px 3px 0 rgb(158,158,158), -4px 4px 0 rgb(136,136,136),-5px 5px 4px rgba(0,0,0,0.15),-5px 5px 1px rgba(0,0,0,0.5),0px 0px 4px rgba(0,0,0,.2);
margin-left:16%;

}
.header
{
margin-top:100px;
margin-left: 40%;
/*margin-right: 55%;*/
color : #DF0101;
font-weight:bold;
font-family: 'PT Sans', sans-serif;
font-size: 35px;
}
#header {
height: 16%;
display: table;
width: 100%;
box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.49);
background: #E6E6E6;
}
.img_head
{
margin-top:-50px;
margin-right: 95%
}
.buttonStyle
{
width: 70px;
font-size:12px;
font-family:Verdana;
font-weight:bold;
color:white;/*#44A4D3;*/
height:26px;
background-color:#808080;

background-repeat:repeat-x;
border:none;
text-transform:capitilize;
}
.buttonStyle:hover
{
width: 70px;
font-size:12px;
font-family:Verdana;
font-weight:bold;
color:Black;
height:26px;
background-color:#cccccc;
background-image:none;
border:none;
text-transform: capitilize;
}
.buttonStyle:active
{
width: 70px;
font-size:12px;
font-family:Verdana;
font-weight:bold;
color:Black;
height:26px;
background-color:#f2f2f2;
background-image:none;
border:none;
text-transform: capitilize;
} 
</style>   
<script>
function validate()
{

var str=document.getElementById("p_mobile").value;
var email=document.getElementById("p_email").value;
//alert("email"+email);
  

    if(document.getElementById("p_company").value == '' || document.getElementById("p_company").value == null)
    {
        alert("Please enter Company ");
        return false;
    }
    else if(document.getElementById("p_fname").value == '' || document.getElementById("p_fname").value == null)
    {
        alert("Please enter First Name ");
        return false;
    }
    else if(document.getElementById("p_lname").value == '' || document.getElementById("p_lname").value == null)
    {
        alert("Please enter Last Name ");
        return false;
    }
    else if(document.getElementById("p_dept").value == '' || document.getElementById("p_dept").value == null)
    {
        alert("Please enter Department ");
        return false;
    }
    else if(document.getElementById("p_address").value == '' || document.getElementById("p_address").value == null)
    {
        alert("Please enter Address ");
        return false;
    }
    else if(document.getElementById("p_city").value == '' || document.getElementById("p_city").value == null)
    {
        alert("Please enter City ");
        return false;
    }
    else if(document.getElementById("p_email").value == '' || document.getElementById("p_email").value == null)
    {
        alert("Please enter Email ");
        return false;
    }
    
    else if(str.length <10 && email!= '' )
    {
        alert("Please enter valid Mobile No.");
        return false;
    }
    else
    {
        return true;
    }
}
</script>                                                                                                               
</head>                                                                                                                                     
<body>                                                                                                                                      
<%                                                                                                                                          
String smtpServer = null;                                                                                                                   
String smtpPort = null;                                                                                                                     
final String authAddress = "from@send.com"; //Sender Email ID
final String authPassword = "P@SSW0RD";     //Sender Password                                                                
String subject = null;                                                                                                                      
String email = null;                                                                                                                        
String v_company=request.getParameter("p_company");
String v_fname =request.getParameter("p_fname");
String v_mname =request.getParameter("p_mname");
String v_lname =request.getParameter("p_lname");
String v_dept =request.getParameter("p_dept");
String v_address =request.getParameter("p_address");
String v_city =request.getParameter("p_city");
String v_zipcode =request.getParameter("p_zipcode");
String v_email =request.getParameter("p_email");
String v_phone=request.getParameter("p_phone");
String v_extension=request.getParameter("p_extension");
String v_mobile = request.getParameter("p_mobile");
String message = null;


String send = request.getParameter("send");                                                                                                 
String siteName=request.getServerName();                                                                                                    
siteName=siteName.replaceAll("www.","");                                                                                                    

if(send!=null){
        smtpServer = "smtp.yourdomain.com"; //Your SMTP Address
        smtpPort = "PORT";    //Your SMTP PORT
        subject = "New User Registration" ;//Subject       
        email = "to@receive.com";   //Recepient Address
       
        message = "\n Company      :"+v_company +"\n First Name   :"+v_fname +"\n Middle Name  :"+v_mname +"\n Last Name    :"+v_lname+"\n Department   : "+v_dept+"\n Address      :"+v_address +"\n City         :"+v_city+"\n Zip Code     :"+v_zipcode + "\n Email Id     :"+v_email +"\n Phone No     :"+v_phone +"\n Extension    :"+v_extension + "\n Mobile No    :"+v_mobile ; 
  
        //request.getParameter("message");  //Mail Body     
        try{                                             
                Properties props = new Properties();     
                props.put("mail.smtp.host", smtpServer);
                props.put("mail.smtp.port", smtpPort);   
            props.put("mail.smtp.auth", "true");         
                                                         
            // create some properties and get the default Session
            Session sessionMail = Session.getInstance(props, new Authenticator() {
                 public PasswordAuthentication getPasswordAuthentication() {     
                         return new PasswordAuthentication(authAddress, authPassword);
                 }                                                                   
                });                                                                  
                                                                                     
            sessionMail.setDebug(true);

            // create a message
            Message msg = new MimeMessage(sessionMail);

            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);

            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(email);
            msg.setRecipients(Message.RecipientType.TO, addressTo);


            // Optional : You can also set your custom headers in the Email if you Want
            msg.addHeader("site", siteName);

            // Setting the Subject and Content Type
            msg.setSubject(subject);
            msg.setContent(message, "text/html");
            Transport.send(msg);
        }catch(Exception e){
                e.printStackTrace(response.getWriter());
        }
}
%>
<form name="emailForm" action="sendEmails.jsp" method="post">
       
        <div id="header">
            <div class="img_head">
                <p align="left" class="xx1"></p>
            </div>
            <div class ="header" >
            User Registration
            </div>
        </div>
        <br/>
        

        <p><b>Note :</b> <font color="red">Fields marked with * are mandatory</font></p>
        <div id="p_input">
        
        <fieldset>
            <legend>Form</legend>
        <table>

        <tr>
        <td>Company <font color="red">*</font></td>
        <td><input type="text" id="p_company" name="p_company" required/></td>
        </tr>

        <tr>
        <td>First Name <font color="red">*</font><br></td>
        <td><input type="text" id="p_fname" name="p_fname" required/></td>
        </tr>

        <tr>
        <td>Middle Name  <br></td>
        <td><input type="text" id="p_mname" name="p_mname" /></td>
        </tr>

        <tr>
        <td>Last Name <font color="red">*</font><br></td>
        <td><input type="text" id="p_lname" name="p_lname" required /></td>
        </tr>

        <tr>
        <td>Department <font color="red">*</font></td>
        <td><input type="text" id="p_dept" name="p_dept" required /></td>
        </tr>

        <tr>
        <td>Address <font color="red">*</font></td>
        <td><input type="text" id="p_address" name="p_address" required /></td>
        </tr>

        <tr>
        <td>City <font color="red">*</font></td>
        <td><input type="text" id="p_city" name="p_city" required/></td>
        </tr>

        <tr>
        <td>Zip code</td>
        <td><input type="number" id="p_zipcode" name="p_zipcode" /></td>
        </tr>

        <tr>
        <td>Email Id <font color="red">*</font></td>
        <td><input type="email" id="p_email" name="p_email" required/></td>
        </tr>

        <tr>
        <td>Phone No.<br></td>
        <td><input type="number" id="p_phone" name="p_phone" /></td>
        </tr>

        <tr>
        <td>Extension</td>
        <td><input type="text" id="p_extension" name="p_extension" /></td>
        </tr>

        <tr>
        <td>Mobile No. <font color="red">*</font><br></td>
        <td><input type="text" id="p_mobile" name="p_mobile" required maxlength="10" min="10"/></td>
        </tr>

        </table>
        </fieldset>
        <center><input class="buttonStyle" type="submit" name="send" value="Submit" onClick="javascript:validate(); ">&nbsp;
        <input class="buttonStyle" type="Reset" name="reset" value="Cancel"><br></center>
        </div>
</form>
</body>
</html> 
