<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
        <div>
            <h1>Change your Entry</h1>
            <a href="/books">Back to the Shelves</a>
        </div>
    
    <form:form action="/books/${book.id}" method="post" modelAttribute="book">
    <input type="hidden" name="_method" value="put">
        <div class="form-group">
            <label>Title:</label>
            <form:input path="title" class="form-control" />
            <form:errors path="title" class="text-danger" />
        </div>
        <div class="form-group">
            <label>Author:</label>
            <form:input path="author" class="form-control" />
            <form:errors path="author" class="text-danger" />
        </div>
        <div class="form-group">
            <label>My thoughts:</label>
            <form:textarea path="thoughts" class="form-control" />
            <form:errors path="thoughts" class="text-danger" />
        </div>
        <form:hidden path="user" value="${book.user.id}"/>
        <input type="submit" value="edit" class="btn btn-primary" />
    </form:form>
    </div>

</body>
</html>