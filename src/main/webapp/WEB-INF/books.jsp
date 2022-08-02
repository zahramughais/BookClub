<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <div class="flex">
            <div>
                <h1>Welcome, <c:out value="${user.userName}"/></h1>
                <p>Books from everyone's Shelves:</p>
            </div>
            <div>
                <a href="/logout">logout</a>
                <a href="/books/new">+Add a book to my shelf!</a>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Title</td>
                    <td>Author Name</td>
                    <td>Posted By</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td><c:out value="${book.id}"/></td>
                        <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                        <td><c:out value="${book.author}"/></td>
                        <td><c:out value="${book.user.userName}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>