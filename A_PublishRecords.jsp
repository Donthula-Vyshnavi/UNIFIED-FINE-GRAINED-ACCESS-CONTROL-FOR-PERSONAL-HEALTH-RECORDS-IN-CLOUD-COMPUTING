<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="connect.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.style94 {
	color: #0033FF;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
<head>
<title>Publishing Patient's Records..</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style3 {
	color: #999900;
	font-size: 15px;
}
.style11 {
	font-size: 25px;
	color: #00CC00;
}
.style27 {color: #FFCC00}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style56 {color: #FF0000}
.style85 {color: #0000FF; font-weight: bold; }
.style89 {font-size: 12px}
.style90 {color: #FF00FF; font-weight: bold; }
.style93 {color: #006600}
-->
</style>
</head>
<body>
<!-- START PAGE SOURCE -->
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo style3">
        <p align="center" class="style11 style27">Unified Fine-grained Access Control for Personal Health Records in Cloud Computing</p>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><strong>Home</strong></a></li>
          <li><a href="DO_Login.jsp"><strong>Patients</strong></a></li>
          <li class="active"><a href="AdminLogin.jsp"><strong>Cloud Server </strong></a></li>
          <li><a href="UserLogin.jsp"><strong>Medicval Staff </strong></a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="hbg">&nbsp;</div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2 class="style93">Publishing Patient's Records in ABE Format.. </h2>
          <div class="clr"></div>
          <table width="881" border="1" align="center"  cellpadding="0" cellspacing="0">
            <tr>
              <td  width="44" height="34"  valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">PID</div></td>
              <td  width="136" height="34" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Patient Name</div></td>
              <td  width="123" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Blood Group</div></td>
              <td  width="109" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Disease</div></td>
              <td  width="103" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Age</div></td>
              <td  width="96" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Gender</div></td>
              <td  width="140" height="34" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Address</div></td>
              <td  width="112" valign="middle" style="color: #2c83b0;">&nbsp;</td>
            </tr>
            <%
					  
						String s1,s2,s3,s4,s5,s6,s7;
						int i=0;
						try 
						{
						   	String query="select * from patients"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(3);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								s6=rs.getString(8);
								s7=rs.getString(9);
						String  s8=rs.getString(10);
						String	s9=rs.getString(11);
						String	s10=rs.getString(12);
						String	s11=rs.getString(13);
						String	s12=rs.getString(14);
						String  s13=rs.getString(15);
						String  s14=rs.getString(2);

			
			
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue,"AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.ENCRYPT_MODE,key);
						String keyy = String.valueOf(keyValue);
						
						String name1 = new String(Base64.encode(s1.getBytes()));
						String email1 = new String(Base64.encode(s8.getBytes()));
			
							String query12="select * from publish where patientname='"+name1+"' and email='"+email1+"'"; 
							Statement st12=connection.createStatement();
							ResultSet rs12=st12.executeQuery(query12);
							if ( rs12.next()==true )
							{
								//s1=rs12.getString(3);
								s2=rs12.getString(4);
								s3=rs12.getString(5);
								s4=rs12.getString(6);
								s6=rs12.getString(8);
								s10=rs12.getString(12);
							
							 }
						 
					%>
					
            <tr>
              <td height="52" align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                  <%out.println(i);%>
              </div></td>
              <td width="136" rowspan="1" align="center" valign="middle" bgcolor="#FFFFFF" ><div align="center" class="style90 style56">
                
                <%out.println(s1);%>
              </div></td>
              <td align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                <%out.println(s2);%>
              </div></td>
              <td align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                <%out.println(s3);%>
              </div></td>
              <td align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                <%out.println(s4);%>
              </div></td>
              <td align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                <%out.println(s6);%>
              </div></td>
              <td height="52" align="center"  valign="middle" bgcolor="#FFFFFF"><div align="center" class="style90 style56">
                  <%out.println(s10);%>
              </div></td>
			  
			
              <td align="center"  valign="middle">
			  <%String query1="select * from publish where patientname='"+name1+"' and email='"+email1+"'"; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
				if ( rs1.next()==true )
				{
				%>
				
				 <span class="style94">
                <%out.println("Published");%>
                </span>
			  <%}
			  else
			  {
			  %>
              <form action="A_PublishRecords1.jsp" method="post">
			 	  <input type="hidden" value="<%=i%>" name="pid"/>
                  <input type="submit" name="Submit" value="Publish" style="width:90px;height:30px;background-color:green;border-radius:50%;" />
			 	</form>
			  <%		  
			  }%></td>
            </tr>
			
            <%
						}
						
					
				
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
          </table>
          <p align="center"><a href="AdminMain.jsp" class="style85"></a></p>
          <table width="472" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="455"><div align="right"><a href="AdminMain.jsp" class="style85">Back</a></div></td>
            </tr>
          </table>
        <a href="AdminMain.jsp" class="style85"></a></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize">
      <div class="clr"></div>
    </div>
  </div>
</div>
<!-- END PAGE SOURCE -->
<div align=center></div>
</body>
</html>
