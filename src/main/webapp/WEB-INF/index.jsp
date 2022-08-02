<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<title>Read Share</title>
</head>
<body>
    <div class="wrapper">
        <h1 class="purple">Book Club</h1>
        <p>A place for friends to share thoughts on books</p>
        <!-- Register Form -->
        <div class="flex">
            <form:form action="/register" method="post" modelAttribute="newUser" class="w-100">
            <div class="form-group">
                <label>User Name:</label>
                <form:input path="userName" class="form-control" />
                <form:errors path="userName" class="text-danger" />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <form:input path="email" class="form-control" />
                <form:errors path="email" class="text-danger" />
            </div>
            <div class="form-group">
                <label>Password:</label>
                <form:password path="password" class="form-control" />
                <form:errors path="password" class="text-danger" />
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <form:password path="confirm" class="form-control" />
                <form:errors path="confirm" class="text-danger" />
            </div>
            <input type="submit" value="Register" class="btn btn-primary" />
            </form:form>
            <!-- Login Form -->
            <form:form action="/login" method="post" modelAttribute="newLogin" class="w-100">
                <div class="form-group">
                    <label>Email:</label>
                    <form:input path="email" class="form-control" />
                    <form:errors path="email" class="text-danger" />
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <form:password path="password" class="form-control" />
                    <form:errors path="password" class="text-danger" />
                </div>
                <input type="submit" value="Login" class="btn btn-success" />
            </form:form>
        </div>
    </div>
</body>
</html>