<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p>
<c:url value="Controleur?section=afficherCatalogue" var="url01" />
<a href="${url01}">voir catalogue </a> |
<c:url value="Controleur?section=produit&action=versFormulaire" 
       var="url02" />
<a href="${url02}" >creer produit</a> |
<c:url value="Controleur?section=produit&action=creerDonnees" 
       var="url03" />
<a href="${url03}" >creer le jeux de test</a> |
<c:url value="Controleur?section=client&action=versinscription" 
       var="url04" />
<a href="${url04}" >s'inscrire</a> |
<c:url value="Controleur?section=client&action=versconnexion" 
       var="url05" />
<a href="${url05}" >se connecter</a> |
<c:url value="Controleur?section=client&action=deconnexion" 
       var="url06" />
<a href="${url06}" >se deconnecter</a> |
<c:url value="Controleur?section=client&action=voirCompte" 
       var="url07" />
<a href="${url07}" >mon compte</a> |
<hr />
<c:if test="${not empty msg}" >
<p>message : ${msg}</p>
</c:if>
</p>