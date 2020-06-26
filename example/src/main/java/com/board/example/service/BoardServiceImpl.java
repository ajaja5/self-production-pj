package com.board.example.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.example.dao.BoardDAO;
import com.board.example.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDao;

	@Override
	public List<BoardDTO> boardList() throws Exception {
		return boardDao.boardList(); 
	}
}
