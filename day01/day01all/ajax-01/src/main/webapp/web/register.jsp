<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body style="font-size:30px;">
	<form action="" >
		姓名：<input type="text" 
		name="name" id="name" onblur="checkName()">
		<span id="namespan"></span>
		<br>
		密码：<input type="password" 
		name="pwd" id="pwd"><br>
		<input type="submit" value="注册">
	</form><br>
	
	省份：
	<select id="province" onchange="getCity(this.value)">
		<option>请选择。。。</option>
		<option value="1">河北省</option>
		<option value="2">辽宁省</option>
	</select>
	城市：
	<select id="city">
		<option>请选择。。。</option>
		
	</select>
</body>
<script type="text/javascript">
	//获取xhr对象
	function getXhr(){
		//1.定义变量
		var xhr;
		//2.两个分支；判断浏览器是否支持xhr对象
		if(window.XMLHttpRequest){
			//如果支持，直接创建对象
			xhr = new XMLHttpRequest();
		}else{
			//兼容ie5 ie6
			xhr = new ActiveXObject("Microsoft.XMLHttp");
		}
		//返回xhr
		return xhr;
	}
	
	//二级联动菜单
	//cityCode表示省份的编号
	function getCity(provinceCode){
		//1.获取xhr对象
		var xhr = getXhr();
		//2.监听状态变化
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var msg = xhr.responseText;
				alert(msg);
			}
		}
		//3.打开连接
		//当发送post请求的时候，必须要设置content-type
		//必须在send之前设置
		xhr.open("post","../user/getCity.do",true);
		xhr.setRequestHeader("content-type",
				"application/x-www-form-urlencoded");
		//4.发送请求
		xhr.send("provinceCode="+provinceCode);
	}
	
	//用户名异步验证
	function checkName(){
		//1.创建xhr对象
		var xhr = getXhr();
		//2.监听状态变化
		xhr.onreadystatechange = function(){
			//如果是第五种状态，并且状态码是200
			if(xhr.readyState==4&&xhr.status==200){
				//接收服务器端的数据
				var msg = xhr.responseText;
				//在namespan节点，添加姓名是否可用的信息
				if(msg=="1"){
					document.getElementById("namespan").innerHTML
					="姓名可以使用";
				}else{
					document.getElementById("namespan").innerHTML
					="姓名不可以使用";
				}
				
				
			}
		}
		//3.xhr.open();
		//获取文本框的值
		var nameValue = document.getElementById("name").value;
		xhr.open("get",
				"../user/checkName.do?name="+nameValue,
				true);
		//4.xhr.send();
		xhr.send();
		
	}
</script>
</html>















