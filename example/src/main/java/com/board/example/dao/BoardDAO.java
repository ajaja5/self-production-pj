package com.board.example.dao;

import java.util.List;


import com.board.example.dto.BoardDTO;

public interface BoardDAO {
	// 게시물 목록 보기
	public List<BoardDTO> boardList() throws Exception;
}