package cn.tedu.spring.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Controller
public class UploadController {
	
	CommonsMultipartResolver cmr;
	
	@RequestMapping("/upload.do")
	public String handleUpload(
			MultipartHttpServletRequest request,
			MultipartFile file,
			ModelMap map) //file就是客户端提交的文件的数据
					throws IllegalStateException, IOException{
		//CommonsMultipartFile file 就是客户端提交的文件的数据
		//后端的主要任务是将这个数据存储到硬盘中
		
		// 获取上传的文件的信息
		System.out.println("【上传文件信息】");
		// file.getBytes(); // 获取文件的数据本身
		// file.getInputStream(); // 获取上传文件的输入流
		String contentType 
		    = file.getContentType(); // 获取文件的类型，例如：image/jpeg
		
		String[] imageType = contentType.split("/");
		System.out.println(imageType[0]);
		//判定是否是图片类型
		if("image".equals(imageType[0])) {
			
			String name = file.getName(); // 获取文件名
			String originalFileName = file.getOriginalFilename(); // 获取原始文件名
			String type = originalFileName.substring(originalFileName.lastIndexOf("."));
			System.out.println(System.currentTimeMillis()+type);
			originalFileName = System.currentTimeMillis()+type;
			
			long size = file.getSize(); // 获取文件大小
			System.out.println("contentType=" + contentType);
			System.out.println("name=" + name);
			System.out.println("originalFileName=" + originalFileName);
			System.out.println("size=" + size);
			
			//请确保已经在webapp下创建了upload文件
			//确定upload文件的位置
			String dirPatg = request.getServletContext().getRealPath("upload");
			//确定目标文件，即上传的文件数据保存到那个文件
			//File的构造方法中的2个参数，第一个是文件夹，第二个是文件名
			File dest = new File(dirPatg ,originalFileName);
			//调用CommonsMultipartFile对象的transferTo()方法即可将数据保存到硬盘
			file.transferTo(dest);
			//暂时不考虑后续处理
			
			map.addAttribute("originalFileName",originalFileName);
			
			return "image";
			
		}else {
			return "请上传图片文件";
		}
		
		
	}
}
