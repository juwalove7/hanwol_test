<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.header__menu h1 {
	font-size: 25px;
}

.header__menu h1 sapn {
	font-size: 12px;
}
</style>
<div id="layout" class="no-flex-layout">
	<div class="header__flex">
		<header class="header__menu">
			<div style="font-size: 20pt;">
				<a href="" class="header__logo-link">HWIF</a>
			</div>
			<ul class="oneDepth__menu-items">
				<li class="oneDepth__menu-item">예제
					<ul class="twoDepth__menu-items">
						<li class="twoDepth__menu-item"><a href="/oneGrid.do"
							class="bookmark__item-link"><img
								src="/images/icons/icon_li.png" alt="li" /> 그리드 1</a></li>
						<li class="twoDepth__menu-item"><a href="/twoGrid.do"
							class="bookmark__item-link"><img
								src="/images/icons/icon_li.png" alt="li" /> 그리드 2</a></li>
						<li class="twoDepth__menu-item"><a href="/threeGrid.do"
							class="bookmark__item-link"><img
								src="/images/icons/icon_li.png" alt="li" /> 그리드 3</a></li>
					</ul>
				</li>
				<li class="oneDepth__menu-item">연습페이지
					<ul class="twoDepth__menu-items">
					</ul>
				</li>
			</ul>
		</header>
		<header class="header__bookmark">
			<ul class="bookmark__items">
			</ul>
			<div class="header_user"></div>
		</header>
	</div>
</div>