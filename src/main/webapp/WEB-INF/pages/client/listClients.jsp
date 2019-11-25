<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><spring:message code="client.list.titre"></spring:message></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<div>
			<a href="?lang=fr">français</a>&nbsp;<a href="?lang=en">anglais</a>
		</div>

		<h1>
			<spring:message code="client.list.titre"></spring:message>
		</h1>

		<div>
			<a href="addClientEI" class="btn btn-link"><spring:message code="bouton.addCEI"></spring:message></a> 
			<a href="addClientMoral" class="btn btn-link"><spring:message code="bouton.addCM"></spring:message></a>
			<a href="addClientPhysique" class="btn btn-link"><spring:message code="bouton.addCP"></spring:message></a>
		</div>

		<table class="table">
		
		
			<thead>
				<tr>
					<th><spring:message code="client.categorie"></spring:message></th>
					<th><spring:message code="client.id"></spring:message></th>
					<th><spring:message code="client.titre"></spring:message></th>				
					<th><spring:message code="client.prenom"></spring:message></th>
					<th><spring:message code="client.nom"></spring:message></th>
					
					<th><spring:message code="client.tel"></spring:message></th>
					<th><spring:message code="client.fax"></spring:message></th>
					<th><spring:message code="client.email"></spring:message></th>
					
					<th><spring:message code="adresse.adresse"></spring:message></th>
					<th><spring:message code="adresse.codePostal"></spring:message></th>
					<th><spring:message code="adresse.ville"></spring:message></th>
					<th><spring:message code="adresse.pays"></spring:message></th>
					
					<th><spring:message code="client.siret"></spring:message></th>
				</tr>
			</thead>
			
			
			<tbody>
				<c:forEach var="c" items="${clients}">
					<tr>
						<td>${c.getClass().simpleName}</td>
						<td>${c.id}</td>				
						<td>${c.titre}</td>						
						<td><c:if test="${c.getClass().simpleName=='ClientPhysique' || c.getClass().simpleName=='ClientEI'}">
								${c.prenom}</c:if></td> 
						<td>${c.nom}</td>
						
						<td>${c.numeroTel}</td>
						<td>${c.numeroFax}</td>
						<td>${c.email}</td>

						<td>${c.adresse.adresse}</td>
						<td>${c.adresse.codePostal}</td>
						<td>${c.adresse.ville}</td>
						<td>${c.adresse.pays}</td>
						
						
						<td><c:if test="${c.getClass().simpleName=='ClientMoral'}">${c.siret}</c:if></td>
  
						
											
						<c:url var="editClients" value="editClients">
							<c:param name="id" value="${c.id}" />
						</c:url>
						<td><a href="${editClients}" class="btn btn-outline-primary"><spring:message code="bouton.editClient"></spring:message></a></td>

						<c:url value="deleteClients" var="deleteClients">
							<c:param name="id" value="${c.id}"></c:param>
						</c:url>
						<td><a href="${deleteClients}" class="btn btn-outline-danger"><spring:message code="bouton.deleteClient"></spring:message></a></td>
					
					
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>