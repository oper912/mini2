package org.mini.location.web;

import java.util.ArrayList;
import java.util.List;

import org.mini.domain.Comment;
import org.mini.location.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/location/*")
public class LocationController {

	@Autowired
	LocationService service;
	
	@GetMapping("/main")
	public void main(Model model, @RequestParam(value="zcode", defaultValue="1") int zcode, @RequestParam(value="pno", defaultValue="0") int pno) {
		
		System.out.println(zcode);
		System.out.println(service.getMovies(pno, zcode));
		
		model.addAttribute("mList", service.getMovies(pno, zcode));
		model.addAttribute("pName", service.getPlaceName(pno));
		model.addAttribute("pList", service.getPlace(zcode));
		model.addAttribute("lList", service.getLocation());
		model.addAttribute("zone", service.getZone(zcode));
		
	}
	
	@GetMapping("/detail")
	public void detail(Model model, @RequestParam(value="rno", defaultValue="24") int rno) {
		
		model.addAttribute("report", service.getReport(rno));
		model.addAttribute("movie", service.rMovie(rno));
		model.addAttribute("marker", service.rMarker(rno));
	}
	
}






