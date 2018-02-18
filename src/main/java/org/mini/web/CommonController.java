package org.mini.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.mini.domain.Member;
import org.mini.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
@Controller
public class CommonController {

	@Autowired
	CommonService service;

	@GetMapping("/home")
	public void home(Model model, HttpSession session) {

		if (session.getAttribute("login") != null) {
			System.out.println("들어왔음");
			System.out.println(session.getAttribute("login"));
			session.setAttribute("userimg", service.getProfile(session.getAttribute("login").toString()));
		}
	}

	@GetMapping("/join")
	public void joinPage() {

	}

	@PostMapping("/join")
	public String join(Member member) {
		System.out.println(member);

		service.join(member);

		return "redirect:/home";

	}

	@PostMapping("/dup")
	@ResponseBody
	public Boolean dupCheck(String id, String nick, int type) {

		// true면 중복됨
		Boolean result = null;

		switch (type) {
		case 1:
			result = service.idcheck(id);
			break;
		case 2:
			result = service.nickcheck(nick);
			break;
		}

		return result;
	}

	@GetMapping("/login")
	public void loginPage() {

	}

	@PostMapping("/ismember")
	@ResponseBody
	public Boolean isMember(String id, String pw) {

		System.out.println(service.loginTest(id, pw));

		// 로그인 성공이 true
		return service.loginTest(id, pw);
	}

	@PostMapping("/loginProcess")
	public String login(String id, String pw, Boolean remember, Model model) {

		System.out.println("remember" + remember);

		model.addAttribute("remember", remember);
		model.addAttribute("id", id);

		return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = request.getSession().getAttribute("login");
		System.out.println("띠용");

		System.out.println("세샨? " + obj);

		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();

		}

		Cookie loginCookie = WebUtils.getCookie(request, "login");
		Cookie userImgCookie = WebUtils.getCookie(request, "userimg");

		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}

		if (userImgCookie != null) {
			userImgCookie.setPath("/");
			userImgCookie.setMaxAge(0);
			response.addCookie(userImgCookie);
		}

		return "redirect:/home";
	}

	@GetMapping("/loginonly")
	public void loginonly() {

	}

	@PostMapping("/profile")
	@ResponseBody
	public String profileUpdate(MultipartFile file, HttpSession session) {

		String uuid = UUID.randomUUID().toString();
		String filePath = "C:\\movietrip\\userprofile" + File.separator;
		String fileName = uuid + "_" + file.getOriginalFilename();

		try {
			if (file.getSize() > 0) {

				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(filePath + fileName));

				service.setProfile(session.getAttribute("login").toString(), fileName);

			}

		} catch (Exception e) {
			log.warning(e.getMessage());
		}

		return fileName;
	}

	@GetMapping(value = "/userimg", produces = "image/*")
	@ResponseBody
	public byte[] display(String fileName) {

		try {
			FileInputStream in = new FileInputStream("C:\\movietrip\\userprofile" + File.separator + fileName);

			ByteArrayOutputStream bas = new ByteArrayOutputStream();

			FileCopyUtils.copy(in, bas);

			return bas.toByteArray();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
