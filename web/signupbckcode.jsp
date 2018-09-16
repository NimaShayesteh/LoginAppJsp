<%-- 
    Document   : signupbckcode
    Created on : Sep 15, 2018, 4:13:09 PM
    Author     : Nima Shayesteh
--%>

<%@page import="java.sql.*"%>

<%  

    try{
        String email = request.getParameter("email");
String pass = request.getParameter("pass");
String Active = request.getParameter("Active");


Class.forName("com.mysql.jdbc.Driver"); // MySql database connection  ---- driver lazem jahate etesal be database MySql
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginappdatabase?" + "user=root&password=");   //  sakhtane connection string va etesal be db

//baraye inke db be moshkel nakhore id ro bayad auto number konid dar db ke felan be in kaar ehtiaji nist
PreparedStatement pst = con.prepareStatement("insert INTO person(id,username,password,active) VALUES(3,?,?,?)"); // gereftan dade az db ke aya in fard dar db hast ya na?
    pst.setString(1, email);
    pst.setString(2, pass);
    pst.setString(3, Active);
    int result = pst.executeUpdate();
    out.println("user was added!!!");

    }
    catch(Exception e)
    {
     out.println("you have an Error : "+e.getMessage());   
    }
    
    


%>