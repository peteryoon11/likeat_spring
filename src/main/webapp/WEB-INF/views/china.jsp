<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIKEat!</title>    
</head>
<body>
<jsp:include page="includeTop/topNav.jsp" />
<%-- <c:if test="${SuccessAlert != null}">
	<script type="text/javascript">
		alert('${SuccessAlert}');
	</script>
</c:if> --%>
<jsp:include page="category/china.jsp" />
</body>
</html>
