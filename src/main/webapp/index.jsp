<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<style>
 #preview,.img,img {
	width:200px;
	height:200px;
}
#preview {
	border:1px solid #000;
}
</style>
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
</head>
<body>
	<!-- 使用了enctype="multipart/form-data"并不影响使用其它控件提交数据 -->
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<p>用户名：<input type="text" name="username"/></p>
		<!-- 浏览文件需要使用type="file"控件,加上"multiple",即可多选文件 -->
		<p>文件：<input type="file" name="file" onchange="preview(this)" multiple/></p>
		<p><input type="submit" value="上传"/></p>
	</form>
</body>
</html>