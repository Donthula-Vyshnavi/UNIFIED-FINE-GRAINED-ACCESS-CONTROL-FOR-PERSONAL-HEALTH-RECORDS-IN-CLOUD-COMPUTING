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
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style56 {color: #FF0000}
.style85 {color: #0000FF; font-weight: bold; }
.style89 {font-size: 12px}
.style90 {color: #FF00FF; font-weight: bold; }
.style93 {color: #009900}
.style95 {color: #FF00FF; font-size: 24px; }
.style96 {
	color: #000000;
	font-size: 13px;
}
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
          <table width="802" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td><span class="style95">Related  Patient Details Found for Keyword <span class="style93"><%=request.getParameter("keyword")%></span> ..</span></td>
            </tr>
          </table>
          <h2>&nbsp;</h2>
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
						
						
						
						
						
							String keys = "ef50a0ef2c3e3a5f";
							byte[] keyValue = keys.getBytes();
							Key key = new SecretKeySpec(keyValue,"AES");
							Cipher c = Cipher.getInstance("AES");
							c.init(Cipher.ENCRYPT_MODE,key);
							String keyy = String.valueOf(keyValue);
											
										
										
							String keyword=request.getParameter("keyword");
							
							String query1="select distinct(patientfound),patientemail from searchfound where keyword='"+keyword+"' order by id DESC"; 
						   	Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(query1);
							while ( rs1.next() )
							{
										String	patient2=rs1.getString(1);
										String	email2=rs1.getString(2);
										
										
										String patient1 = new String(Base64.encode(patient2.getBytes()));
										String email1 = new String(Base64.encode(email2.getBytes()));


										
									String query="select * from publish where patientname='"+patient1+"' and email='"+email1+"'"; 
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
										
							
			
						
						String name = new String(Base64.decode(s1.getBytes()));
						String blood = new String(Base64.decode(s2.getBytes()));
						String disease = new String(Base64.decode(s3.getBytes()));
						String age = new String(Base64.decode(s4.getBytes()));
						String dob = new String(Base64.decode(s5.getBytes()));
						String gender = new String(Base64.decode(s6.getBytes()));
						String mobile = new String(Base64.decode(s7.getBytes()));
						String email = new String(Base64.decode(s8.getBytes()));
						String city = new String(Base64.decode(s9.getBytes()));
						String address = new String(Base64.decode(s10.getBytes()));
						String code = new String(Base64.decode(s11.getBytes()));
						String fname = new String(Base64.decode(s12.getBytes()));
						String textarea = new String(Base64.decode(s13.getBytes()));
						String owner = new String(Base64.decode(s14.getBytes()));
						String digital_sign = new String(Base64.decode(s15.getBytes()));
						
						
								
					%>
            <tr>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(i);%>
              </div></td>
              <td width="81" rowspan="1" align="center" valign="middle" ><div align="center">
                <a href="A_KeywordMatch2.jsp?patient=<%=patient2%>&amp;email=<%=email2%>&amp;keyword=<%=keyword%>" class="style85">
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
                <%out.println(email);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(city);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(address);%>
              </div></td>
            </tr>
            <%
						}
						}
						
					%>
          </table>
		  
		   <p>&nbsp;</p>
		   <table width="802" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td><span class="style95">Related Patient Details Found for Keyword <span class="style93"><%=request.getParameter("keyword")%></span> ..</span></td>
            </tr>
          </table>
		  
		       

		   <p>&nbsp;</p>
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
            </tr>
            <%
					  
						
										
										
							
							String query12="select distinct(patientfound),patientemail from unmatched where keyword='"+keyword+"'"; 
						   	Statement st12=connection.createStatement();
							ResultSet rs12=st12.executeQuery(query12);
							while ( rs12.next() )
							{
										String	patient22=rs12.getString(1);
										String	email22=rs12.getString(2);
										
										
										String patient12 = new String(Base64.encode(patient22.getBytes()));
										String email12 = new String(Base64.encode(email22.getBytes()));


										
									String query2="select * from publish where patientname='"+patient12+"' and email='"+email12+"'"; 
									Statement st2=connection.createStatement();
									ResultSet rs2=st2.executeQuery(query2);
									while ( rs2.next() )
									{
										int	i2=rs2.getInt(1);
										String	s12=rs2.getString(3);
										String	s22=rs2.getString(4);
										String	s32=rs2.getString(5);
										String	s42=rs2.getString(6);
										String	s52=rs2.getString(7);
										String	s62=rs2.getString(8);
										String	s72=rs2.getString(9);
										String  s82=rs2.getString(10);
										String	s92=rs2.getString(11);
										String	s102=rs2.getString(12);
										String	s112=rs2.getString(13);
										String	s122=rs2.getString(14);
										String  s132=rs2.getString(15);
										String  s142=rs2.getString(2);
										String  s152=rs2.getString(16);
										
							
			
						
						String name2 = new String(Base64.decode(s12.getBytes()));
						String blood2 = new String(Base64.decode(s22.getBytes()));
						String disease2 = new String(Base64.decode(s32.getBytes()));
						String age2 = new String(Base64.decode(s42.getBytes()));
						String dob2 = new String(Base64.decode(s52.getBytes()));
						String gender2 = new String(Base64.decode(s62.getBytes()));
						String mobile2 = new String(Base64.decode(s72.getBytes()));
						String email2 = new String(Base64.decode(s82.getBytes()));
						String city2 = new String(Base64.decode(s92.getBytes()));
						String address2 = new String(Base64.decode(s102.getBytes()));
						String code2 = new String(Base64.decode(s112.getBytes()));
						String fname2 = new String(Base64.decode(s122.getBytes()));
						String textarea2 = new String(Base64.decode(s132.getBytes()));
						String owner2 = new String(Base64.decode(s142.getBytes()));
						String digital_sign2 = new String(Base64.decode(s152.getBytes()));
						
						
								
					%>
            <tr>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(i2);%>
              </div></td>
              <td width="81" rowspan="1" align="center" valign="middle" ><div align="center">
                <a href="A_KeywordMatch2.jsp?patient=<%=patient22%>&amp;email=<%=email22%>&amp;keyword=<%=keyword%>" class="style85">
                <%out.println(name2);%>
              </a></div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(blood2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(disease2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(age2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(dob2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(gender2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(mobile2);%>
              </div></td>
              <td align="center"  valign="middle"><div align="center" class="style90">
                <%out.println(email2);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(city2);%>
              </div></td>
              <td height="52" align="center"  valign="middle"><div align="center" class="style90">
                  <%out.println(address2);%>
              </div></td>
            </tr>
            <%
						}
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
          <p>&nbsp;</p>
          <table width="472" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="455"><div align="right"><a href="A_KeywordMatch.jsp" class="style85 style96">Back</a></div></td>
            </tr>
          </table>
       </div>
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
