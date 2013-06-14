function getYear(date){

	if (!date){
		return "";
	}
	var year = date.split("-")[0];

	return year;
}

function getMonth(date){
	
	if (!date){
		return "";
	}
	var month = date.split("-")[1];
	
	return month;
}

function getYMD(date){
	
	if (!date){
		return "";
	}
	var month = date.split(" ")[0];
	
	return month;
}

$('.form_date').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});
$('#top').click(function(){$('html,body').animate({scrollTop: '0px'}, 1200);return false;});