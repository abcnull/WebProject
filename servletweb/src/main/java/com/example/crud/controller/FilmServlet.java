package com.example.crud.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 石磊 on 2018/8/13.
 */
@WebServlet(name = "FilmServlet",urlPatterns="/film")
public class FilmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //请求"/film"重定向到登录页面
        request.getRequestDispatcher("/WEB-INF/film.jsp").forward(request, response);
    }
}
