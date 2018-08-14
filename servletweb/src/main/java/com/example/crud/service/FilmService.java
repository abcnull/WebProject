package com.example.crud.service;

import com.example.crud.bean.Film;
import com.example.crud.dao.FilmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 石磊 on 2018/8/13.
 */
@Service
public class FilmService {
    @Autowired
    FilmMapper filmMapper;

    //查询所有数据，存在list中
    public List<Film> getAll(){
        return filmMapper.selectByAll();
    }
    //插入一条数据
    public int insertOneDate(Film film){
        return filmMapper.insertAll(film);
    }
    //删除一条数据
    public int deleteById(short filmId){
        filmMapper.deleteOther(filmId);
        return filmMapper.deleteByPrimaryKey(filmId);
    }
}
