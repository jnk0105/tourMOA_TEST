<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">
	<h1>상품 등록</h1>
	<div class="row justify-content-between mb-3">
		<div class="col-lg-3">
		</div>
		<div class="col-lg-1">
			<button type="button" class="w-100 btn btn-primary" onclick="location.href='/adminGoodsList.do'">목록</button>
		</div>
	</div>
	
	<script> //도시 추가 인풋창 누적 하기	
	$(document).ready(function(){
	    $("input#addCity").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	fn_add();
	        }
	    });
	    $("input#viaSelect").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	fn_add2();
	        }
	    });
	});
	function fn_add() {
		var addCity = document.frm.addCity.value;
		document.frm.addCity.value = "";
		if (document.frm.city.value != "") document.frm.city.value += ",";  
		document.frm.city.value += addCity;
	}
	function fn_add2() {
		var viaSelect = document.frm.viaSelect.value;
		document.frm.viaSelect.value = "";
		if (document.frm.vias.value != "") document.frm.vias.value += ",";  
		document.frm.vias.value += viaSelect;
	}
	</script>
	
	<script type="text/javascript">
	$(function(){
		
		$("#saveBtn").click(function(){
			
			/* 1박 + 2일 = 1박 2일 */
			var period = $("#period1").val();
			period += "박 ";
			period += $("#period2").val();
			period += "일";
			$("#period").val(period);
			
			/* 에디터의 내용을 hidden textarea 에 담는다 */
			var detail1 = $(".note-codable + div").html();
			$("#detail1").text(detail1);
			
			if($("#frm #title").val() == "") {
				alert("제목을 입력해주세요.");
				$("#frm #title").focus();
				return false;
			}
			
			/* price 타입이 number 이므로 "" 이 들어가면 안됨 0이라도 넣어야 함 */
			if($("#frm #price").val() == "") {
				alert("비용을 입력해주세요.");
				$("#frm #price").focus();
				return false;
			}
			if($("#frm #pricech").val() == "") {
				alert("아동가를 입력해주세요.");
				$("#frm #pricech").focus();
				return false;
			}
			if($("#frm #pricein").val() == "") {
				alert("유아가를 입력해주세요.");
				$("#frm #pricein").focus();
				return false;
			}
			
			
			/* var gender = $(":input:radio[id=gender]:checked").val(); */
			
			/*
			price 컬럼에 0 값을 넣기 위해서..
			if ($("#price").val() == "") {
				$("#price").val("0");
			}
			if ($("#pricech").val() == "") {
				$("#pricech").val("0");
			}
			if ($("#pricein").val() == "") {
				$("#pricein").val("0");
			} */
			
			var param = "gubun="+$("#gubun").val()
				param +="&code="+$("#code").val()
				param +="&title="+$("#title").val()
				param +="&location="+$("#location").val()
				param +="&nation="+$("#nation").val()
				param +="&city="+$("#city").val()
				param +="&schd="+$("#schd").val()
				param +="&airline="+$("#airline").val()
				param +="&detail1="+$("#detail1").val()
				param +="&via="+$("#via").val()
				param +="&vias="+$("#vias").val()
				param +="&use="+$("#use").val()
				param +="&sdate="+$("#sdate").val()
				param +="&edate="+$("#edate").val()
				param +="&period="+$("#period").val()
				param +="&period1="+$("#period1").val()
				param +="&period2="+$("#period2").val()
				param +="&price="+$("#price").val()
				param +="&pricech="+$("#pricech").val()
				param +="&pricein="+$("#pricein").val();
			
			alert(param);
			
			/* var form = new FormData(document.getElementById("frm")); */
						
			$.ajax({
				type: "POST",
				data: param,
				url: "<c:url value='/adminGoodsWriteSave.do' />",
				dataType: "json",
				processData: false,
				contentType: false,
				success: function (data) {
					if(data.result == "ok") {
						alert("저장됐습니다.");
						location.href = "<c:url value='/adminGoodsList.do' />";
					} else {
						alert("저장 실패");
					}
				},
				error: function (error) {
					alert("error : " + error);
				}
			});
		});
	});
	</script>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="unq" value="" />
		<div class="form-group row">
			<label for="inputGoodsType" class="col-sm-2 col-form-label">상품구분</label>
			<div class="col-sm-2">
				<select class="form-control" name="gubun" id="gubun">
					<option value="">-선택-</option>
					<option value="자유여행">자유여행</option>
					<option value="해외패키지">해외패키지</option>
				</select>
			</div>
			<div class="btn-group col-sm-2" role="group" aria-label="First group">
				<input type="text" class="form-control rounded-0 rounded-left" placeholder="구분 추가" aria-label="Input group example" aria-describedby="btnGroupAddon2">
				<button type="button" class="btn btn-primary">+</button>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputSimpleExp" class="col-sm-2 col-form-label">상품번호</label>
			<div class="col-sm-2">
				<input type="text" name="code" id="code" class="form-control" placeholder="상품번호">
			</div>
		</div>
	
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">상품명</label>
			<div class="col-sm-10">
				<input type="text" name="title" id="title" class="form-control form-control-lg" placeholder="상품명">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputLocation" class="col-sm-2 col-form-label">지역</label>
			<div class="col-sm-2">
				<select class="form-control" name="location" id="location">
					<option value="">-선택-</option>
					<option value="weurope">서유럽</option>
					<option value="eeurope">동유럽</option>
					<option value="enasia">동남아</option>
					<option value="easia">동아시아</option>
					<option value="namerica">미주</option>
				</select>
			</div>
			<div class="btn-group col-sm-2" role="group" aria-label="First group">
				<input type="text" class="form-control rounded-0 rounded-left" placeholder="지역 추가" aria-label="Input group example" aria-describedby="btnGroupAddon2">
				<button type="button" class="btn btn-primary">+</button>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputLocation" class="col-sm-2 col-form-label">국가</label>
			<div class="col-sm-2">
				<select class="form-control" name="nation" id="nation">
					<option value="">-선택-</option>
					<option value="영국">영국</option>
					<option value="프랑스">프랑스</option>
					<option value="이탈리아">이탈리아</option>
					<option value="독일">독일</option>
					<option value="스페인">스페인</option>
				</select>
			</div>
			<div class="btn-group col-sm-2" role="group" aria-label="First group">
				<input type="text" class="form-control rounded-0 rounded-left" placeholder="국가 추가" aria-label="Input group example" aria-describedby="btnGroupAddon2">
				<button type="button" class="btn btn-primary">+</button>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputCity" class="col-sm-2 col-form-label">도시</label>
			<div class="btn-group col-sm-2" role="group" aria-label="First group">
				<input type="text" class="form-control rounded-0 rounded-left" id="addCity" placeholder="도시 추가" aria-label="Input group example" aria-describedby="btnGroupAddon2">
				<button type="button" class="btn btn-primary" onclick="fn_add()">+</button>
			</div>	
		</div>
		
		<div class="form-group row">
			<label for="inputCitys" class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="text" name="city" id="city" class="form-control" placeholder="오사카,도쿄,오키나와,...">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputSimpleExp" class="col-sm-2 col-form-label">간략정보</label>
			<div class="col-sm-10">
				<input type="text" name="schd" id="schd" class="form-control" placeholder="ex)인천-보라카이-인천">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="usingAirline" class="col-sm-2 col-form-label">이용항공</label>
			<div class="col-sm-10">
				<input type="text" name="airline" id="airline" class="form-control" placeholder="이용항공">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="priceAdult" class="col-sm-2 col-form-label">인원</label>
			<div class="col-sm-10">
				<div class="form-row align-items-center">
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="price" id="price" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="총 인원">
							<span class="input-group-addon">명</span>
						</div>
					</div>
					
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="pricech" id="pricech" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="남은 인원">
							<span class="input-group-addon">명</span>
						</div>
					</div>
					
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="pricein" id="pricein" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="출발가능 인원">
							<span class="input-group-addon">명</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		
		<div class="form-group row">
			<label for="priceAdult" class="col-sm-2 col-form-label">비용</label>
			<div class="col-sm-10">
				<div class="form-row align-items-center">
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="price" id="price" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="성인가">
							<span class="input-group-addon">￦</span>
						</div>
					</div>
					
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="pricech" id="pricech" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="아동가">
							<span class="input-group-addon">￦</span>
						</div>
					</div>
					
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="pricein" id="pricein" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="유아가">
							<span class="input-group-addon">￦</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="form-group row">
			<label for="priceAdult" class="col-sm-2 col-form-label">여행기간</label>
			
			<div class="col-sm-10">
				<div class="form-row align-items-center">
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="period1" id="period1" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="1">
							<span class="input-group-addon">박</span>
						</div>
					</div>
					
					<div class="col-2">
						<div class="input-group">
							<input type="text" name="period2" id="period2" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="2">
							<span class="input-group-addon">일</span>
						</div>
					</div>
					
					<div class="col-auto">
						<input type="hidden" name="period" id="period" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="(히든)">
					</div>
				</div>
			</div>
			
		</div>
				
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">출발일</label>
			
			<div class='col-sm-10'>
				<div class="form-row align-items-center">
					<div class='col-4'>
						<div class="input-group date form_datetime" data-date-format="yyyy년 MM d일 - HH:ii p" data-link-field="dtp_input1">
		                    <input class="form-control" size="16" type="text" value="" placeholder="한국 출발" readonly>
		                    <span class="input-group-addon"><span class="fa fa-times" aria-hidden="true"></span></span>
							<span class="input-group-addon"><span class="fa fa-calendar" aria-hidden="true"></span></span>
		                </div>
						<input type="hidden" id="dtp_input1" value="" />
					</div>
					<div class='col-4'>
						<div class="input-group date form_datetime" data-date-format="yyyy년 MM d일 - HH:ii p" data-link-field="dtp_input1">
		                    <input class="form-control" size="16" type="text" value="" placeholder="현지 도착" readonly>
		                    <span class="input-group-addon"><span class="fa fa-times" aria-hidden="true"></span></span>
							<span class="input-group-addon"><span class="fa fa-calendar" aria-hidden="true"></span></span>
		                </div>
						<input type="hidden" id="dtp_input1" value="" />
					</div>
				</div>
			</div>
				
		</div>
		
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">도착일</label>
			<div class='col-sm-10'>
				<div class="form-row align-items-center">
					<div class='col-4'>
						<div class="input-group date form_datetime" data-date-format="yyyy년 MM d일 - HH:ii p" data-link-field="dtp_input1">
		                    <input class="form-control" size="16" type="text" value="" placeholder="현지 출발" readonly>
		                    <span class="input-group-addon"><span class="fa fa-times" aria-hidden="true"></span></span>
							<span class="input-group-addon"><span class="fa fa-calendar" aria-hidden="true"></span></span>
		                </div>
						<input type="hidden" id="dtp_input1" value="" />
					</div>
					<div class='col-sm-4'>
						<div class="input-group date form_datetime" data-date-format="yyyy년 MM d일 - HH:ii p" data-link-field="dtp_input1">
		                    <input class="form-control" size="16" type="text" value="" placeholder="한국 도착" readonly>
		                    <span class="input-group-addon"><span class="fa fa-times" aria-hidden="true"></span></span>
							<span class="input-group-addon"><span class="fa fa-calendar" aria-hidden="true"></span></span>
		                </div>
						<input type="hidden" id="dtp_input1" value="" />
					</div>
				</div>
			</div>
		</div>
		
		<!-- <div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">시작일</label>
			<div class='col-sm-2'>
				<div class='input-group date'>
					<input type='text' name="sdate" id="sdate" class="form-control" />
				</div>
			</div>
				<script>
			        $('#sdate').datepicker({
			            uiLibrary: 'bootstrap4',
			            format: 'yyyy-mm-dd HH:mm:ss',
			            iconsLibrary: 'fontawesome'
			        });
			    </script>			
		</div>
		
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">종료일</label>
			<div class='col-sm-2'>
				<div class='input-group date' >
					<input type='text' name="edate" id="edate" class="form-control" />
				</div>
			</div>
			
				<script>
			        $('#edate').datepicker({
			            uiLibrary: 'bootstrap4',
			            format: 'yyyy-mm-dd HH:mm:ss',
			            iconsLibrary: 'fontawesome'
			        });
			    </script>
			    
		</div> -->
		
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-2 col-form-label">간단 정보</label>
			<div class='col-sm-10'>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputDetail" class="col-sm-2 col-form-label">상세정보</label>
			<div class="col-sm-10">
				<div class="form-control" id="summernote"></div>
				<script>
					$('#summernote').summernote({
						height: 400,
						minHeight: null,
						maxHeight: null,
						placeholder: '상세정보',
						tabsize: 2,
						lang: 'ko-KR'
					});
				</script>
				<textarea class="form-control" id="detail1" rows="6" hidden></textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="selectDirect" class="col-sm-2 col-form-label">직항여부</label>
			<div class="col-sm-2">
				<select class="form-control" name="via" id="via">
					<option value="Y">직항</option>
					<option value="N">경유</option>
				</select>
			</div>
			<script>
			$("#via").on("change", function(){
				if ($(this).val() == "Y") {
				 	$("#vias").attr("disabled",true);
				 	$("#viaSelect").attr("disabled",true);
				 	$("#viaSelect + button").attr("disabled",true);
				}
				if ($(this).val() == "N") {
				 	$("#vias").removeAttr("disabled");
				 	$("#viaSelect").removeAttr("disabled");
				 	$("#viaSelect + button").removeAttr("disabled");
				}
			});
			</script>
		</div>
		
		<div class="form-group row">
			<label for="selectWaypoint" class="col-sm-2 col-form-label">경유지</label>
			<div class="btn-group col-sm-2" role="group" aria-label="First group">
				<input type="text" class="form-control rounded-0 rounded-left" placeholder="경유지 추가" aria-label="Input group example" aria-describedby="btnGroupAddon2" id="viaSelect" disabled>
				<button type="button" class="btn btn-primary" onclick="fn_add2()" disabled>+</button>
			</div>	
		</div>
				
		<div class="form-group row">
			<label for="selectWaypoints" class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="vias" id="vias" placeholder="상해,뭄바이" disabled>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="selectUse" class="col-sm-2 col-form-label">슬라이드 이미지</label>
			<div class="col-sm-2">
				
				<input type="file" class="form-control-file" id="exampleFormControlFile1" multiple>
			
			</div>
			
			
			
		</div>
		
		<div class="form-group row">
			<label for="selectUse" class="col-sm-2 col-form-label">사용여부</label>
			<div class="col-sm-2">
				<select class="form-control" name="use" id="use">
					<option value="Y" selected>사용</option>
					<option value="N">중지</option>
				</select>
			</div>
		</div>
		
		<div class="d-flex justify-content-center">
			<div class="p-2">
				<button type="button" class="btn btn-primary" id="saveBtn">Submit</button>
			</div>
		</div>
		
	</form>
	
	
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
   </script>
	
	
	
	
	
    </main>