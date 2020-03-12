package com.shizhichao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.shizhichao.entity.Sku;
import com.shizhichao.entity.Spu;
import com.shizhichao.entity.SpuVo;
import com.shizhichao.service.SpuService;

/**
 * 首页
 * @author zhuzg
 *
 */
@Controller
public class IndexController {

	@Reference
	SpuService spuService;
	
	/**
	 * 
	 * @param request
	 * @param page
	 * @param catId
	 * @return
	 */
	@RequestMapping({"/","index"})
	public String index(HttpServletRequest request,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="0") int catId) {
		// 获取商品的数据
		PageInfo<Spu> listSpu = spuService.listSpu(page, new SpuVo());
		
		System.err.println(listSpu);
		
		request.setAttribute("pageInfo", listSpu);
		return "index";
	}
	
	/**
	 * 显示商品详情
	 * @param request
	 * @param spuId
	 * @return
	 */
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,int spuId) {
		/**
		 * 获取详情
		 */
		// spu
		Spu spu = spuService.getSpu(spuId);
		//sku 
		List<Sku> skuList = spuService.listSkuBySpu(spuId);
		
		request.setAttribute("spu", spu);
		request.setAttribute("skus", skuList);
		System.out.println("skuList is " + skuList);
		return "detail";
	}
	
}
