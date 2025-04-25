<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Patients Details After Publishing..</title>
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
.style12 {color: #0000FF}
.style18 {color: #FF00FF}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style56 {color: #FF0000}
.style85 {color: #0000FF; font-weight: bold; }
.style89 {font-size: 12px}
.style90 {color: #FF00FF; font-weight: bold; }
.style92 {font-size: 25px; color: #009900; }
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
          <li><a href="UserLogin.jsp"><strong>Medical Staff </strong></a></li>
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
          <h2><span class="style18"><span class="style12"><span class="style92">Patients Details After Publishing..</span></span></span></h2>
          <div class="clr"></div>
          <table width="926" border="1" align="center"  cellpadding="0" cellspacing="0"  ">
            <tr>
              <td  width="26"  valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">PID</div></td>
              <td  width="81" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Patient Name</div></td>
              <td  width="87" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Blood Group</div></td>
              <td  width="62" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Disease</div></td>
              <td  width="56" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Age</div></td>
              <td  width="64" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">DOB</div></td>
              <td  width="56" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Gender</div></td>
              <td  width="71" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Mobile</div></td>
              <td  width="66" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Email</div></td>
              <td  width="55" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">City</div></td>
              <td  width="79" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Address</div></td>
              <td  width="197" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style89">Digital Sign </div></td>
            </tr>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>
            <%
					  
						try 
						{
						   	String query="select * from publish"; 
						   	Statement st=connection.createStatement();
							ResultSet rs=st.executeQuery(query);
							while ( rs.next() )
							{
								int	i=rs.getInt(1);
								String	s1=rs.getString(3);
								String	s2=rs.getString(4);
								String	s3=rs.getString(5);
								String	s4=rs.getString(6);
								String	s5=rs.getString(7);
								String	s6=rs.getString(8);
								String	s7=rs.getString(9);
								String  s8=rs.getString(10);
								String	s9=rs.getString(11);
								String	s10=rs.getString(12);
								String	s11=rs.getString(13);
								String	s12=rs.getString(14);
								String  s13=rs.getString(15);
								String  s14=rs.getString(2);
								String  s15=rs.getString(16);
								
							
			
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue,"AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.ENCRYPT_MODE,key);
						String keyy = String.valueOf(keyValue);
						
						String name = new String(Base64.decode(s1.getBytes()));
						String blood =s2;// new String(Base64.decode(s2.getBytes()));
						String disease =s3;// new String(Base64.decode(s3.getBytes()));
						String age =s4;// new String(Base64.decode(s4.getBytes()));
						String dob =s5;// new String(Base64.decode(s5.getBytes()));
						String gender =s6;// new String(Base64.decode(s6.getBytes()));
						String mobile =s7;// new String(Base64.decode(s7.getBytes()));
						String email = new String(Base64.decode(s8.getBytes()));
						String city =s9;// new String(Base64.decode(s9.getBytes()));
						String address =s10;// new String(Base64.decode(s10.getBytes()));
						String code =s11;// new String(Base64.decode(s11.getBytes()));
						String fname =s12;// new String(Base64.decode(s12.getBytes()));
						String textarea =s13;// new String(Base64.decode(s13.getBytes()));
						String owner = s14;//new String(Base64.decode(s14.getBytes()));
						String digital_sign =s15; //new String(Base64.decode(s15.getBytes()));
						
						
								
					%>
            <tr>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(i);%>
              </div></td>
              <td width="81" rowspan="1" align="center" valign="middle" ><div align="center">
                <a href="A_AfterPublish1.jsp?patient=<%=name%>&amp;email=<%=email%>" class="style85">
                <%out.println(name);%>
              </a></div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(blood);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(disease);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(age);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(dob);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(gender);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(mobile);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(s8);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(city);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(address);%>
              </div></td>
              <td height="52" align="center"  valign="middle">
                <textarea name="textarea" cols="30" rows="3"><%out.println(digital_sign);%></textarea>
              <div align="center" class="style90">			</div></td>
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
          <p>&nbsp;</p>
          <table width="472" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="455"><div align="right"><a href="AdminMain.jsp" class="style85">Back</a></div></td>
            </tr>
          </table>
       </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<!-- END PAGE SOURCE -->
<div align=center></div>
</body>
</html>
