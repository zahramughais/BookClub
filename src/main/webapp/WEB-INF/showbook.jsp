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
        <div>
            <h1><c:out value="${book.title}"/></h1>
            <a href="/books">Back to the Shelves</a>
        </div>
        <c:choose>
            <c:when test="${user_id == book.user.id}">
            <p>You read <c:out value="${book.title}"/> by <c:out value="${book.author}"/></p>
            <p>Here are your thoughts:</p>
            </c:when>
            <c:otherwise>
            <p><c:out value="${book.user.userName}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/></p>
            <p>Here are <c:out value="${book.user.userName}"/> thoughts:</p>
            </c:otherwise>
        </c:choose>
        <hr>
        <c:out value="${book.thoughts}"/>
        <hr>
        <c:choose>
        <c:when test="${user_id == book.user.id}">
        <a href="/books/${book.id}/edit">edit</a>
        </c:when>
        </c:choose>
    </div>

</body>
</html>