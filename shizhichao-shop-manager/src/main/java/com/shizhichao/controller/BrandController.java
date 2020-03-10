package com.shizhichao.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.shizhichao.entity.Brand;
import com.shizhichao.entity.Spec;
import com.shizhichao.service.BrandService;

@Controller
@RequestMapping("brand")
public class BrandController {

	
	  @Reference
	  BrandService brandService;
	 
	
	@RequestMapping("list")
	public String list(HttpServletRequest request,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="") String name
	) {
		 PageInfo<Brand> pageInfo = brandService.list(name, page);
		//pageInfo.getPages()
		 request.setAttribute("pageInfo", pageInfo);
		 request.setAttribute("queryName", name);
		return "brand/list";
	}
	
	/**
	 * 添加
	 * @param request
	 * @param page
	 * @param name
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(HttpServletRequest request,Brand brand) {

		System.out.println(brand);
		
		//调用服务
		int add = brandService.add(brand);
		
		return add>0?"success":"false";
	}
	
	/**
	 * 删除品牌
	 * @param request
	 * @param id  品牌的id
	 * @return
	 */
	@RequestMapping("delSpec")
	@ResponseBody
	public String delSpec(HttpServletRequest request,int id) {
		//调用服务
		int delNum = brandService.delete(id);
		return delNum>0?"success":"false";
	}
	
	/**
	 * 删除品牌
	 * @param request
	 * @param id  品牌的id
	 * @return
	 */
	@RequestMapping("delBrandBatch")
	@ResponseBody
	public String delBrandBatch(HttpServletRequest request,@RequestParam(name="ids[]") int[] ids) {
		System.out.println("要删除的额数据");
		for (int i : ids) {
			System.out.println(" i is " + i  );
		}
		//调用服务
		int delNum = brandService.deleteBatch(ids);
		return delNum>0?"success":"false";
	}
	
	
	
	
	/**
	 * 用于修改数据时候的回显
	 * @param request
	 * @param id 规格id
	 * @return
	 */
	@RequestMapping("getBrand")
	@ResponseBody
	public Brand getBrand(HttpServletRequest request, int id){
		
		System.out.println(id);
		
		return brandService.findById(id);
		
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(HttpServletRequest request,Brand brand) {
		System.out.println("brand" + brand);
	
		int result = brandService.update(brand);  
		return result >0 ?"success":"false";
		//return "fail";
	}
	
	
	
}
