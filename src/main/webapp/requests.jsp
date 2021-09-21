<%-- 
    Document   : requests
    Created on : 21-Sep-2021, 10:17:41 pm
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.contactus.dao.ContactsDao"%>
<%@page import="com.contactus.connection.ConnectionProvider"%>
<%@page import="com.contactus.entity.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("session") == null) {
                response.sendRedirect("error.jsp");
            }
        %>
        <form action="ActiveAndArchive" method="post">
            <table border="1">
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
        <br>
        <%
            if (count < contacts.size()) {
        %>
        <form action="activeAndArchive" method="post">
            <table border="1">
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
