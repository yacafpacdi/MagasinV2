<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
        <link href="css/monstyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <c:import url="/WEB-INF/jsp/marges/banniere.jsp" />

        <h1>completez :</h1>
        <div>
            <span class="erreur">${msgERR}</span>
            <c:url value="Controleur" var="url" />
            <form method="POST"
                  action="${url}"
                  accept-charset="UTF-8"
                  >
                <input type="hidden" name="section" value="produit" />
                <input type="hidden" name="action" value="creer" />
                <label for="ref">reference :</label><br />
                <input type="text" id="ref" name="ref" placeholder="expl: ARV-REF-00000"  />
                <br />
                <span class="erreur">${errReference}</span>
                <br />
                <label for="label">label produit :</label><br />
                <input type="text" id="label" name="label" />
                <br />
                <label for="prix">prix :</label><br />
                <input type="text" id="prix" name="prix"  />
                <br />
                <span class="erreur">${errPrix}</span>
                <br />
                <label for="qte">stock :</label><br />
                <input type="text" id="qte" name="qte"  /><br />
                <span class="erreur">${errQte}</span>
                <br />
                <input type="submit" value="Valider" />

            </form>
        </div>
        <hr />
        <div>
            <c:url value="Controleur?section=catalogue&action=voir" var="url01" />
            <c:import url="${url01}" />
        </div>
        <c:import url="/WEB-INF/jsp/marges/footer.jsp" />
    </body>
</html>
