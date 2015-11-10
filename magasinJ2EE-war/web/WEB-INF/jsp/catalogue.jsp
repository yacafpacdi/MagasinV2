<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>Catalogue</h1>
<div>
    <table border="1" >
        <thead>
            <tr>
                <th>Reference</th>
                <th>label</th>
                <th>Prix Ht/u</th>
                <th>Stock</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${produits}" var="p">
                <tr>
                    <td>${p.reference}</td>
                    <td>${p.label}</td>
                    <td><fmt:formatNumber 
                            value="${p.prixHT}"
                            minIntegerDigits="2" 
                            minFractionDigits="2" 
                            maxFractionDigits="2"  /> €</td>
                    <td>${p.qte}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

