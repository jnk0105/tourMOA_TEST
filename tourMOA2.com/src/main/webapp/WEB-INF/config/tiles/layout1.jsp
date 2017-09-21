<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<meta charset="UTF-8">	
<!-- <link rel="stylesheet" type="text/css" href="http://www.swagger.kr/index.html"> -->
<link rel="stylesheet" type="text/css" href="/css/tp-main.css">
<link rel="stylesheet" type="text/css" href="/css/detailPackage.css">
<link rel="stylesheet" type="text/css" href="/css/product-main.css">
<link rel="stylesheet" type="text/css" href="/css/product-detail.css">
<link rel="stylesheet" type="text/css" href="/css/search-total.css">
<link rel="stylesheet" href="/css/sliderkit/sliderkit.css">
<link rel="stylesheet" href="/fp/skin/functional.css">
<!-- fontAwesome 사이트에 아이콘  -->
<link rel="stylesheet" type="text/css" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
	<tiles:insertAttribute name="topMenu" />
	<tiles:insertAttribute name="topNav" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />
