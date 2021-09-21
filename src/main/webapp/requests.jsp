
<%@page import="java.util.ArrayList"%>
<%@page import="com.contactus.dao.ContactsDao"%>
<%@page import="com.contactus.connection.ConnectionProvider"%>
<%@page import="com.contactus.entity.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Page</title>
        <style>
            body{
                margin:0;
                padding:5em;
                text-align: center;
            }
            button{
                padding:10px;
                font-size: 20px;
                margin:10px;
                color:gray;
                background-color:lightgrey; 
                border: none;
                box-shadow: 2px 5px gray;
            }
            table{
                font-size:20px;
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("session") == null) {
                response.sendRedirect("error.jsp");
            }
        %>
        <form action="ActiveAndArchive" method="post">
            <table border ="1" align="center">
                <th colspan="5">Active</th>
                <tr>
                    <td></td>
                    <td>Name</td>
                    <td>E-mail</td>
                    <td>Message</td>
                    <td>Request Time</td>
                </tr>

                <%
                    int count = 0;   // used to check if any request is archived
                    ContactsDao contactsDao = new ContactsDao(ConnectionProvider.getConnection());
                    ArrayList<Contact> contacts = contactsDao.getContacts();

                    for (Contact contact : contacts) {
                        if (!contact.isArchive()) {
                %>
                <tr>
                    <td><input type="checkbox" name="check" value="<%=contact.getEmail()%>"></td>
                    <td><%=contact.getFullName()%></td>
                    <td><%=contact.getEmail()%></td>
                    <td><%=contact.getMessage()%></td>
                    <td><%=contact.getRequestTime()%></td>
                </tr>
                <%
                            count++;
                        }
                    }
                %>
            </table>
            <button type="submit" name="button" value="archive">ARCHIVE</button>
        </form>

        <br>
        <%
            if (count < contacts.size()) {
        %>
        <form action="ActiveAndArchive" method="post">
            <table border="1" align="center">
                <th colspan="5">Archive</th>
                <tr>
                    <td></td>
                    <td>Name</td>
                    <td>E-mail</td>
                    <td>Message</td>
                    <td>Request Time</td>
                </tr>

                <%
                    for (Contact contact : contacts) {
                        if (contact.isArchive()) {
                %>
                <tr>
                    <td><input type="checkbox" name="check" value="<%=contact.getEmail()%>"></td>
                    <td><%=contact.getFullName()%></td>
                    <td><%=contact.getEmail()%></td>
                    <td><%=contact.getMessage()%></td>
                    <td><%=contact.getRequestTime()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <button type="submit" name="button" value="active">ACTIVE</button>
        </form>
        <%
            }
        %>
    </body>
</html>
