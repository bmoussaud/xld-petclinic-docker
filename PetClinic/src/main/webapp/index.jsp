<%@ page language="java" import="java.util.ResourceBundle" %>
<%
    String title;
    try {
        ResourceBundle resource = ResourceBundle.getBundle("petclinic");
        title = resource.getString("title");
    } catch (Exception e) {
        title = "NOT FOUND IN RESOURCE BUNDLE";
    }

    String hostname;
    try {
        hostname = System.getenv("HOSTNAME");
    } catch (Exception e) {
        hostname = "docker_host_not_found";
    }

    String petVersion;
    try {
        petVersion = System.getenv("MY_PET_VERSION");
    } catch (Exception e) {
        petVersion = "X.Y.Z";
    }

    String provider;
    try {
        ResourceBundle resource = ResourceBundle.getBundle("petclinic");
        provider = "/petclinic/images/"+resource.getString("provider");
    } catch (Exception e) {
        provider = "/petclinic/images/dummy.png";
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="styles/petclinic.css" type="text/css"/>
    <title>PetPortal with Containers</title>
</head>

<body>

<div id="main">
    <img src="<%=provider%>" align="right" style="position:relative;right:30px;">

    <p>&nbsp;</p>

    <p>-- Welcome [<%=title%>] !-- </p>

    <ul>
        <li><a href="/petclinic/findOwners.jsp">Find owner</a></li>
        <li><a href="/petclinic/vets.jsp">Display all whales</a></li>
        <li><a href="/petclinic/petclinic.html">Tutorial</a></li>
    </ul>
    <p>&nbsp;</p>

    <table class="footer">
        <tr>
            <td><a href="http://www.docker.com">Home</a></td>
            <td>[Hostname:<%=hostname%>]</td>
            <td>[Version:<%=petVersion%>]</td>
        </tr>
    </table>

</div>
</body>

</html>

