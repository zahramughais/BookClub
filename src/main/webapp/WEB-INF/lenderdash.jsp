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
                <p>Hello, <c:out value="${user.userName}"/>. Welcome too,,</p>
                <h1>The Book Broker!</h1>
                <p>Available books to borrow</p>
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
                    <td>Owner</td>
                    <td>Actions</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <c:choose>
                    <c:when test="${book.borrower.id != user.id}">
                    <tr>
                        <td><c:out value="${book.id}"/></td>
                        <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                        <td><c:out value="${book.author}"/></td>
                        <td><c:out value="${book.user.userName}"/></td>
                        <c:choose>
                        <c:when test="${user_id == book.user.id}">
                        <td class="flex"><a href="/books/${book.id}/edit" class="btn btn-link">edit</a>
                            <form action="/books/delete/${book.id}" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="Delete" class="btn btn-link">
                            </form>
                        </td>
                        </c:when>
                        <c:otherwise>
                        <td><a href="/books/${book.id}/borrow">borrow</a></td>
                        </c:otherwise>
                        </c:choose>
                    </tr>
                    </c:when>
                    </c:choose>
                </c:forEach>
            </tbody>
        </table>

        <p>Books I'm Borrowing..</p>
        <table class="table table-striped">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Title</td>
                    <td>Author Name</td>
                    <td>Owner</td>
                    <td>Actions</td>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="book" items="${borrowedB}">
                    <tr>
                        <td><c:out value="${book.id}"/></td>
                        <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                        <td><c:out value="${book.author}"/></td>
                        <td><c:out value="${book.user.userName}"/></td>
                        <td><a href="/books/${book.id}/return" class="btn btn-link">return</a></td>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
    </div>
</body>
</html>