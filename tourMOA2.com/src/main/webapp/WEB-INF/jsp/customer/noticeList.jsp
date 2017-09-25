<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/customer.css" />
    
<script>
function fnMenuSelect() {
	//공지사항
	$('.lnb01').addClass('lnb01 on'); $("ul.sub_1").css("display","block");    $('.sub01_01').addClass('sub01_01 on'); $('#one').show();
	
	//여행이야기
	
	
	//여행상담
	
	
	//고객의소리
	 
	
	//소비자중심경영
	
    
    //서비스안내
    
}

$( document ).ready(function() {
	fnMenuSelect();
	$('#lnb').mouseleave(function(){
        setTimeout(function() {
        	$("#one > li").removeClass('on'); // 1depth 초기화
        	$("ul.sub").css("display","none"); // 2depth 사라짐
        	$("ul.sub > li").removeClass('on'); // 2depth 초기화
            fnMenuSelect();
        }, 3000);
    });
});

function loginConfirm(){
	
			document.location.href='/customer/complaintWrite.do';
		 
}
</script>
    <script type="text/javaScript" language="javascript" defer="defer">		
		$(document).ready(function(){
			
			//카테고리 클릭 이벤트 삭제
			$(".cat_area > tbody > tr > th").unbind('click');		
		});
	</script>
	<section id="content"><!--[[ content Start ]] -->
        <div class="tit notice_tit" title="공지사항"><span class="tit_txt notice_sub">투어모아의 새로운 소식과 공지사항을 알려드립니다.</span></div>
		<form name="searchForm" id="searchForm" action="/customer/noticeList.do" method="post">
		<input type="hidden" name="searchNoticeCd" id="searchNoticeCd" value="" />
        <div class="board_search"><!--[[ Search Form Start ]]-->         
            <span class="select_wrap">
            	<i>
                  <!--[[ 구분 영역 ]]-->
                   <select name="selectNoti" id="searchCnd1" title="공지구분"  onchange="location.href=this.value">
		                <option value="/customer/noticeList.do?searchNoticeCd=&amp;searchCnd=&amp;searchWrd=" selected="selected">전체</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=notice&amp;searchCnd=&amp;searchWrd=" >공지사항</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=hym&amp;searchCnd=&amp;searchWrd=" >허니문</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=glf&amp;searchCnd=&amp;searchWrd=" >골프</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=crs&amp;searchCnd=&amp;searchWrd=" >크루즈</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=dmt&amp;searchCnd=&amp;searchWrd=" >국내</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=fbd&amp;searchCnd=&amp;searchWrd=" >부산/대구</option>
		                <option value="/customer/noticeList.do?searchNoticeCd=air&amp;searchCnd=&amp;searchWrd=" >항공권 소식</option>
		            </select>
            	            
            		<!--[[ 검색 영역 ]]-->
                  	<select name="searchCnd" id="searchCnd" title="검색조건">
		                <option value="TITLE" selected="selected">제목</option>
		                <option value="CONTENTS" >내용</option>
            		</select>
               	</i>
           	</span>
            <input type="text" name="searchWrd" id="searchWrd" title="검색어" value="" >
		    <button id="btn_search" title="검색" >검색</button>        
        </div><!--[[ Search Form End ]]-->
		</form>
       	<div class="board_area"><!--[[ board area Start ]]-->
	   	<table>
		    <caption>공지사항</caption>
               <colgroup>
                   <col class="no" />
                   <col />
                   <col class="dt" />
               </colgroup>
		    <tbody>
               <tr>
				    <th scope="col">번호</th>
				    <th scope="col">제목</th>
				    <th scope="col">등록일</th>
               </tr>
               <tr >
				    <td headers="번호" >
				    	<span class="bul bul_yellow">상시공지</span>
				    		</td>
				    <td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002801&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][오클랜드공항 송유관 파손으로 인한 안내]</a>
					</td>
					<td headers="등록일" >2017-09-20</td>
                </tr>                
                <tr class="even">
			    	<td headers="번호" >
			    		<span class="bul bul_yellow">상시공지</span>
			    	</td>
				    <td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002703&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][태풍 탈림(Talim)으로 인한 비정상 운항 안내]</a>
					</td>
				    <td headers="등록일" >2017-09-12</td>
                </tr>
                
                <tr >
			    	<td headers="번호" >
			    		<span class="bul bul_yellow">상시공지</span>
			    	</td>
			    	<td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002625&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][중국동방항공] 성형, 정형외과 수술 승객 항공기 탑승시 주의사항 안내</a>
				    </td>
				    <td headers="등록일" >2017-09-04</td>
                </tr>                
                <tr class="even">
			    	<td headers="번호" >
			    		<span class="bul bul_yellow">상시공지</span>
			    	</td>
			    	<td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000000122&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		투어모아 본사이전안내</a>
				    </td>
				    <td headers="등록일" >2016-04-19</td>
                </tr>                
                <tr >
			    	<td headers="번호" >
			    		<span class="bul bul_yellow">상시공지</span>
			    	</td>
			    	<td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000000021&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		여행상품 총액표시제 시행</a>
				    </td>
				    <td headers="등록일" >2016-02-11</td>
                </tr>                
                <tr class="even">
			    	<td headers="번호" >
			    		<span class="bul bul_yellow">상시공지</span>
			    	</td>
			    	<td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=10100000833&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		투어모아 휴면 계정 처리 안내</a>
				    </td>
				    <td headers="등록일" >2015-07-17</td>
                </tr>
                
                <tr >
			    	<td headers="번호" >
				    	<span class="bul bul_yellow">상시공지</span>
				    </td>
			    	<td headers="제목" class="subject">
			    	<a href="/customer/noticeView.do?noticeNo=10100000788&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
			    		소비자분쟁해결기준 (공정거래위원회 고시 제2014-4호)</a>
				    </td>
				    <td headers="등록일" >2014-03-20</td>
                </tr>                
                <tr class="even">
				    <td headers="번호" >	402</td>
				    <td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002803&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][대한항공] 휴스턴 노선 운휴 안내</a>
				    </td>
				    <td headers="등록일" >2017-09-20</td>
                </tr>
                
                <tr >
				    <td headers="번호" >	401</td>
				    <td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002802&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][필리핀항공] 동계스케줄 변경 안내</a>
				    </td>
				    <td headers="등록일" >2017-09-20</td>
                </tr>                
                <tr class="even">
			    	<td headers="번호" >400</td>
				    <td headers="제목" class="subject">
				    	<a href="/customer/noticeView.do?noticeNo=20000002781&pageIndex=1&searchCnd=&searchWrd=&searchNoticeCd=" >
				    		[해외항공][중국국제항공] 라싸(LXA) 외 지역 공항 수속 마감 시간 안내</a>
					</td>
				    <td headers="등록일" >2017-09-19</td>
                </tr>                
            </tbody>
        </table>
	    </div><!--[[ board area End ]]-->
	    <div class="board_navi_area"><!--[[ board navi Start ]]-->
	        <span class="paging">
	            <span class="first">&lt;</span><span class="pre">이전</span><span class="on"><a>1</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=2&searchCnd=&searchWrd=&searchNoticeCd=" title="2">2</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=3&searchCnd=&searchWrd=&searchNoticeCd=" title="3">3</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=4&searchCnd=&searchWrd=&searchNoticeCd=" title="4">4</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=5&searchCnd=&searchWrd=&searchNoticeCd=" title="5">5</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=6&searchCnd=&searchWrd=&searchNoticeCd=" title="6">6</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=7&searchCnd=&searchWrd=&searchNoticeCd=" title="7">7</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=8&searchCnd=&searchWrd=&searchNoticeCd=" title="8">8</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=9&searchCnd=&searchWrd=&searchNoticeCd=" title="9">9</a></span><span class=""><a href="/customer/noticeList.do?pageIndex=10&searchCnd=&searchWrd=&searchNoticeCd=" title="10">10</a></span><span class="next on"><a href="/customer/noticeList.do?pageIndex=2&searchCnd=&searchWrd=&searchNoticeCd="  title="다음페이지">다음</a></span><span class="last on"><a href="/customer/noticeList.do?pageIndex=41&searchCnd=&searchWrd=&searchNoticeCd=" title="마지막페이지">&gt;</a></span></span>		 
	    </div><!--[[ board navi End ]]-->
    </section>
</div>