package com.board.example.service;

import java.util.List;


import com.board.example.dto.BoardDTO;

public interface BoardService {
	// 게시물 목록 조회
	public List<BoardDTO> boardList() throws Exception;
}
