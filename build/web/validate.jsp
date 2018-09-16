<%-- 
    Document   : validate
    Created on : Sep 15, 2018, 1:39:27 PM
    Author     : Nima Shayesteh
--%>

<%@page import="java.sql.*" %>
<% 

try{
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver"); // MySql database connection  ---- driver lazem jahate etesal be database MySql
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginappdatabase?" + "user=root&password=");   //  sakhtane connection string va etesal be db
    PreparedStatement pst = con.prepareStatement("Select username,password from person where username=? and password=? and active=1"); // gereftan dade az db ke aya in fard dar db hast ya na?
    pst.setString(1, email);
    pst.setString(2, pass);
    ResultSet rs = pst.executeQuery();    //darinja query execute mishe va result bar migarde                     
        if(rs.next())           
           out.println("Valid!!!"); // bayad bareye type farsi encode safhe ro utf-8 konid ke ma inja nemikonim.        
        else
           out.println("Invalid login credentials or User is not active!"); // zamani ke taraf user pass ro ghalat bezane ya active nabashe
    
}
catch(Exception e){
    out.println("There is a problem "+ e.getMessage()); // zamani ke be har dalili be khataye code nevisi brkhord konid be in ghesmat vared mishavad
}

%>
