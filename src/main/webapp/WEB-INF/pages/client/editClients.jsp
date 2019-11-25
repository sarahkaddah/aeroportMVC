<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edition client</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
	
		<div>
			<a href="?lang=fr">français</a>&nbsp;<a href="?lang=en">anglais</a>
		</div>

		<fieldset>
		
			<core:choose>
				<core:when test="${client.getClass().simpleName=='ClientEI'}">
					<core:url var="action" value="saveClientEI"></core:url>
				</core:when>
				<core:when test="${client.getClass().simpleName=='ClientMoral'}">
					<core:url var="action" value="saveClientMoral"></core:url>
				</core:when>
				<core:when test="${client.getClass().simpleName=='ClientPhysique'}">
					<core:url var="action" value="saveClientPhysique"></core:url>
				</core:when>
			</core:choose>		
		
			<form:form action="${action}" method="post" modelAttribute="client">
				<form:hidden path="version"/>
				
				<div class="form-group">
					<form:label path="id"><spring:message code="client.id"></spring:message></form:label>
					<form:input path="id" readonly="true" cssClass="form-control" />
				</div>
				
				<div>
					<form:label path="titre"><spring:message code="client.titre"></spring:message></form:label>
					<form:select path="titre" itemLabel="label" items="${titres}"
						cssClass="form-control"></form:select>
				</div>

				<div class="form-group">
					<core:choose>
						<core:when test="${client.getClass().simpleName=='ClientCEI'}">
							<core:url var="action" value="saveClientEI"></core:url>
							<div class="form-group">
								<form:label path="prenom"><spring:message code="client.prenom"></spring:message></form:label>
								<form:input path="prenom" cssClass="form-control" />
							</div>					
						</core:when>
						<core:when test="${client.getClass().simpleName=='ClientPhysique'}">
							<core:url var="action" value="saveClientPhysique"></core:url>
							<div class="form-group">
								<form:label path="prenom"><spring:message code="client.prenom"></spring:message></form:label>
								<form:input path="prenom" cssClass="form-control" />
							</div>					
						</core:when>
					</core:choose>
				</div>

				<div class="form-group">
					<form:label path="nom"><spring:message code="client.nom"></spring:message></form:label>
					<form:input path="nom" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="numeroTel"><spring:message code="client.tel"></spring:message></form:label>
					<form:input path="numeroTel" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="numeroFax"><spring:message code="client.fax"></spring:message></form:label>
					<form:input path="numeroFax" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="email"><spring:message code="client.email"></spring:message></form:label>
					<form:input path="email" cssClass="form-control" />
				</div>

				<div class="form-group">
					<form:label path="adresse.adresse"><spring:message code="adresse.adresse"></spring:message></form:label>
					<form:input path="adresse.adresse" cssClass="form-control"/>
				</div>
				
				<div class="form-group">
					<form:label path="adresse.codePostal"><spring:message code="adresse.codePostal"></spring:message></form:label>
					<form:input path="adresse.codePostal" cssClass="form-control" />
					<form:errors path="adresse.codePostal" cssClass="alert alert-danger" element="div"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="adresse.ville"></spring:message></form:label>
					<form:input path="adresse.ville" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="adresse.pays"><spring:message code="adresse.pays"></spring:message></form:label>
					<form:input path="adresse.pays" cssClass="form-control" />
				</div>
				
				<core:choose>
						<core:when test="${client.getClass().simpleName=='ClientMoral'}">
							<core:url var="action" value="saveClientMoral"></core:url>
							<div class="form-group">
								<form:label path="siret"><spring:message code="client.siret"></spring:message></form:label>
								<form:input path="siret" cssClass="form-control" />
							</div>					
						</core:when>
					</core:choose>

				<div>
					<button type="submit" class="btn btn-outline-success"><spring:message code="bouton.save"></spring:message></button>
					<a href="list" class="btn btn-outline-danger"><spring:message code="bouton.annuler"></spring:message></a>
				</div>

			</form:form>
		
		</fieldset>

	</div>

</body>
</html>