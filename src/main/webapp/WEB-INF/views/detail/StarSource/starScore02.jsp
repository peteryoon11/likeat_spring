<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Expires" content="-1"/>
        <title>jQuery Raty - A Star Rating Plugin</title>
 
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="/test/2979/js/jquery.raty.js"></script>
 
    </head>
    <body>
        <div id="star" ></div>
 
        <div style="padding-top:20px;">
            <label for="starRating">Value : </label><input type="text" id="starRating" value="3"/>
        </div>
 
        <div style="padding-top:20px;">
            <label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span>
        </div>
    </body>
 
    <script type="text/javascript">
        $(function() {
            $('div#star').raty({
                score: 3
                ,path : "/test/2979/img"
                ,width : 200
                ,click: function(score, evt) {
                    $("#starRating").val(score);
                    $("#displayStarRating").html(score);
                }
            });
        });
    </script>
</html>