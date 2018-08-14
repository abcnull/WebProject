package com.example.crud.dao;

import com.example.crud.bean.Film;

import java.util.List;


/**
 * Created by 石磊 on 2018/8/13.
 */
public interface FilmMapper {
    List<Film> selectByAll();
    int insertAll(Film film);
    int deleteByPrimaryKey(short filmId);
    int deleteOther(short filmId);
}
