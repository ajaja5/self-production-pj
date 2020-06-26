package com.board.example.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.example.dto.BoardDTO;
import com.board.example.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService boardService;
	
	// 과거 ModelAndView를 활용한 방법
//	@RequestMapping("list.do")
//	public ModelAndView boardMenu() throws Exception {
//		List<BoardDTO> list = boardService.boardList();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("board/board_list");
//		mav.addObject("list", list);
//		return mav; // board/board_list.jsp로 이동
//	}
	
	// 현재 자주 쓰는 Model 클래스를 DI 하는 방법
	@RequestMapping("list.do")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> list = boardService.boardList(); // list 변수에 결과 값을 담는다
		model.addAttribute("list", list); // model에 데이터 값을 담는다
		return "board/board_list"; // board/board_list.jsp로 이동
	}
	
}