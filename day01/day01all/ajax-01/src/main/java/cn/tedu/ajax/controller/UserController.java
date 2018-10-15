package cn.tedu.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	//显示页面
	@RequestMapping("/showRegister.do")
	public String showRegister(){
		return "register";
	}
	
	//处理异步请求
	//@ResponseBody表示如果不响应页面，使用该注解
	//如果响应页面，不使用该注解
	@RequestMapping("/checkName.do")
	@ResponseBody
	public String checkName(String name){
		//判断name，如果为admin，响应错误信息；
		if("admin".equals(name)){
			//设置状态码：0表示失败；1表示成功
			return "0";
		}else{
			return "1";
		}
	}
	//实现二级联动菜单
	@RequestMapping("/getCity.do")
	//不响应页面，使用该注解
	@ResponseBody
	public String getCity(String provinceCode){
		if(provinceCode.equals("1")){
			return "11,石家庄;12,秦皇岛";
		}else{
			return "21,沈阳市;22,大连市";
		}
	}
}









