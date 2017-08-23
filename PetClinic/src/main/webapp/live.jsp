<%@ page language="java" import="java.util.ResourceBundle" %>
<%

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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="styles/petclinic.css" type="text/css"/>
    <title>LIVE</title>
</head>

<body>

<pre>[Hostname:<%=hostname%>][Version:<%=petVersion%>]</pre>
</body>

</html>

