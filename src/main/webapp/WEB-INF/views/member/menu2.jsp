<%@page import="com.entity.MemberDTO"%>
<%@page import="org.apache.ibatis.session.RowBounds"%>
<%@page import="com.exception.LikeatException"%>
<%@page import="com.entity.PageDTO"%>
<%@page import="com.entity.StoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String userid = request.getParameter("userid");
	System.out.println("userid ===> " + userid);
%>

[내가 단 댓글]은 준비중 :-)