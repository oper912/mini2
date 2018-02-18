package org.mini.movie.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.mini.domain.Movie;
import org.mini.domain.Report;
import org.mini.dto.Criteria;
import org.mini.movie.service.CommentService;
import org.mini.movie.service.MovieService;
import org.mini.util.MediaUtils;
import org.mini.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	@Autowired
	private CommentService cservice;
	
	//-------------------------------업로드-------------------------------
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){

	}

	@ResponseBody
	@RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
	produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{

		log.info("originalName: " + file.getOriginalFilename());


		return 
				new ResponseEntity<>(
						UploadFileUtils.uploadFile(uploadPath, 
								file.getOriginalFilename(), 
								file.getBytes()), 
						HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{

		InputStream in = null; 
		ResponseEntity<byte[]> entity = null;

		log.info("uploadPath : " + uploadPath);
		log.info("FILE NAME: " + fileName);

		try{

			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath+fileName);

			if(mType != null){
				headers.setContentType(mType);
			}else{

				fileName = fileName.substring(fileName.indexOf("_")+1);       
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+ 
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
					headers, 
					HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;    
	}
	  
	  @ResponseBody
	  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(String fileName){

		  log.info("delete file: "+ fileName);

		  String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		  MediaType mType = MediaUtils.getMediaType(formatName);

		  if(mType != null){      

			  String front = fileName.substring(0,12);
			  String end = fileName.substring(14);
			  log.info("front : " + front);
			  log.info("end : " + end);
			  new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		  }

		  new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();


		  return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }  
	//-------------------------------업로드-------------------------------
	  
	  
	//@GetMapping("/list")
	@RequestMapping(value="/list", produces = "application/text; charset=utf8")
	public void list(Criteria cri, Model model, @RequestParam(value="search", defaultValue="")String search) {
		log.info("keyword : " + search);
		log.info("list : " + service.getList(cri, search));
		log.info("count : " + service.getCount(cri, search));
		
		model.addAttribute("list", service.getList(cri, search));
		model.addAttribute("total", service.getCount(cri, search));
		model.addAttribute("skeyword", search);
		model.addAttribute("uploadPath", uploadPath);
	}
	
	@GetMapping(value = "/listImg")
	@ResponseBody
	public byte[] display(String fileName) {

		log.info("이건뭐지 ? : " + File.separator);
		try {
			FileInputStream in = new FileInputStream("C:\\zzz\\upload" + File.separator + fileName);

			ByteArrayOutputStream bas = new ByteArrayOutputStream();

			FileCopyUtils.copy(in, bas);

			return bas.toByteArray();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}
	
	@GetMapping("/insert")
	public void register() {
		
	}

	
	@PostMapping("/insert")
	public String registerPost(@RequestParam(value="mcode")int mcode,
												@RequestParam(value="imgUp")String imgUp,
												@RequestParam(value="pathUp")String pathUp,
												@RequestParam(value="place")String place,
												@RequestParam(value="address")String address,
												@RequestParam(value="title")String title,
												@RequestParam(value="content")String content, 
												Criteria cri, 
												RedirectAttributes rttr) {

		//log.info("" + report);
		//service.register(report);
		log.info("mcode : " + mcode);
		
		String[] rImg = imgUp.split(",");
		String[] rPath = pathUp.split(",");
		
		String[] pName = place.split(",");
		String[] addr = address.split(",");
		
		log.info("title : " + title);
		log.info("content : " + content);
		
		service.register(mcode, rImg, rPath, pName, addr, title, content);
		
		//rttr.addFlashAttribute("result", "success");
		//rttr.addFlashAttribute("criteria", cri);
		return "redirect:/movie/list";
	}
	
	
	
	//@PostMapping("/movieread")
	@RequestMapping(value="/movieread")
	public @ResponseBody List<Movie> movieread(String keyword) {

		return service.getMovieread(keyword);
	}
	
	@RequestMapping(value="/totalSubmit")
	public 	@ResponseBody void totalSubmit(@RequestParam(value="mcode")int mcode,
																			@RequestParam(value="imgUp")String imgUp,
																			@RequestParam(value="pathUp")String pathUp,
																			@RequestParam(value="place")String place,
																			@RequestParam(value="address")String address,
																			@RequestParam(value="title")String title,
																			@RequestParam(value="content")String content
																			) {
		//model.addAttribute("testdata", );
		log.info("mcode : " + mcode);
		//log.info("imgUp : " + imgUp);
		//log.info("pathUp : " + pathUp);
		String[] img = imgUp.split(",");
		String[] path = pathUp.split(",");
		
		for(int i = 0; i < img.length; i++) {
			log.info(img[i]);
			log.info(path[i]);
		}
		
		String[] placeArr = place.split(",");
		String[] addressArr = address.split(",");
		
		for(int i = 0; i < placeArr.length; i++) {
			log.info("장소 : " + placeArr[i]);
			log.info("주소 : " + addressArr[i]);
		}
		
		log.info("title : " + title);
		log.info("content : " + content);
		
	}
	
	@RequestMapping(value="/test")
	public 	@ResponseBody List<Report> test() {
		//model.addAttribute("testdata", );
		
		return service.getAllData();
	}
	
	@RequestMapping(value="/test2")
	@ResponseBody
	public 	String test2(@RequestParam(value="places[]")String[] places, @RequestParam(value="addr[]")String[] addr) {
		//model.addAttribute("testdata", );
		for(int i = 0; i < places.length; i++) {
			log.info("장소 : " + places[i]);
			log.info("주소" + addr[i]);
		}
		return "";
	}
}
