<%@page import="com.daea.dtos.EquiDto"%>
<%@page import="com.daea.daos.EquiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    #container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 { 
        text-align: center; 
        color: #333; 
    } 

    .search-container {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 10px;
    }

    .search-container form {
        display: flex;
    }

    .search-container input[type="text"] {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-right: 8px;
    }

    .search-container button {
        padding: 8px 16px;
        background-color: #6E6E6E;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .search-container button:hover {
        background-color: #424242;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }

    th, td {
        padding: 8px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        
    }
    
   #container td a{
    	text-decoration: none;
        color: black;
    }

    th {
        background-color: #f2f2f2;
        
    }

    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    tr:nth-child(even) {
        background-color: #fff;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    form button {
        background-color: #6E6E6E;
        color: #fff;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }

    form button:hover {
        background-color: #424242;
    }

    .pagination {
        text-align: center;
        margin-top: 20px;
    }

    .pagination a {
        color: black;
        margin: 0 5px;
        text-decoration: none;
    }

    .pagination a:hover {
        text-decoration: underline;
    }

    .pagination .active {
        font-weight: bold;
        text-decoration: none;
    }

    .add-equipment {
        text-align: left;
        margin-top: 20px;
    }

    .add-equipment button {
        background-color: #6E6E6E;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
    }

    .add-equipment button:hover {
        background-color: #424242;
    }
</style>
</head>
<body>
    <div id="container">
        <h2>주전산장비사양관리대장</h2>
        <div class="search-container">
            <form action="searchData.board?pnum=1" method="get">
                <input type="text" name="keyword" id="searchInput" placeholder="검색어를 입력하세요">
                <button type="submit">검색</button>
            </form>
        </div>
        <table>
            <tr>
                <th>용도</th>
                <th>자산번호</th>
                <th>운영자</th>
                <th>제조업체</th>
                <th>IP</th>
                <th>도입일자</th>
            </tr>
            <c:set var="lists" value="${list}" />
            <c:choose>
                <c:when test="${empty lists}">
                    <tr>
                        <td colspan="7">--데이터가 없습니다.--</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${lists}" var="dto">
                        <tr>
                            <td>
                            	<a href="detailData.board?assetNumber=${dto.assetNumber}">${dto.purpose}</a>
                            </td>
                            <td>${dto.assetNumber}</td>
                            <td>${dto.operator}</td>
                            <td>${dto.manufacturer}</td>
                            <td>${dto.IP}</td>
                            <td><fmt:formatDate value="${dto.introductionDate}" pattern="yyyy년 MM월 dd일" /></td>
                            
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <tr>
                <td colspan="6" class="pagination">
                    <a href="boardList.board?pnum=${pMap.prePageNum}">◀</a>
                    <c:forEach begin="${pMap.startPage}" end="${pMap.endPage}" var="i" step="1">
                        <a ${(sessionScope.pnum == i or param.pnum == i) ? "class='active'" : ""} href="boardList.board?pnum=${i}">${i}</a>&nbsp;&nbsp;
                    </c:forEach>
                    <a href="boardList.board?pnum=${pMap.nextPageNum}">▶</a>
                </td>
            </tr>
        </table>
        <div class="add-equipment">
            <form action="insertDataForm.board" method="post">
                <button type="submit">장비 추가</button>
            </form>
        </div>
    </div>
</body>
</html>
