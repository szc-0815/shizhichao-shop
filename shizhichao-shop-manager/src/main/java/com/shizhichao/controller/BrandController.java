package com.shizhichao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("brand")
public class BrandController {

	/*
	 * @Reference BrandService brandService;
	 */
	
	
	/*
	 * @RequestMapping("list1") public String list1(HttpServletRequest request,
	 * 
	 * @RequestParam(defaultValue="1") int pageNum,
	 * 
	 * @RequestParam(defaultValue="3") int pageSize,
	 * 
	 * @RequestParam(defaultValue="") String name ) { PageInfo<Spec> pageInfo =
	 * brandService.list(name, pageNum,pageSize); request.setAttribute("pageInfo",
	 * pageInfo); return "spec/list"; }
	 */
	@RequestMapping("list")
	public String list() {
		
		return "spec/list";
	}
	
}
