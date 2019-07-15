<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>上传图片预览功能</title>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<style>
 #preview,.img,img {
	width:200px;
	height:200px;
}
#preview {
	border:1px solid #000;
}
</style>
</head>
<body>
<div id="preview"></div>
<input type="file" onchange="preview(this)">

<script>
var _URL = window.URL || window.webkitURL;

function preview(file) {
    var prevDiv = document.getElementById('preview');
    if (file.files && file.files[0]) {
        var reader = new FileReader();
        reader.onload = function(evt) {
            prevDiv.innerHTML = '<img id="imgnode" src="' + evt.target.result + '" />';
            console.log(evt.target.result)
        }
        reader.readAsDataURL(file.files[0]);
    } else {
        prevDiv.innerHTML = '<div class="img" id="imgnode"  style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
    }
}
</script>

</body>
</html>
