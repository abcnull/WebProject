package com.example.crud.controller;

import com.example.crud.bean.Film;
import com.example.crud.bean.Msg;
import com.example.crud.service.CustomerService;
import com.example.crud.service.FilmService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by 石磊 on 2018/8/13.
 */
@WebServlet(name = "FilmSelectServlet", urlPatterns="/emps")
public class FilmSelectServlet extends HttpServlet {
    @Autowired
    FilmService filmService;

    //在servlet中要使@Autowired 生效 需要配置一下内容
    public void init(ServletConfig config) throws ServletException {
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
                config.getServletContext());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PageHelper.startPage(Integer.parseInt(request.getParameter("pn")),5);//页码和每页大小
        //后面紧跟分页查询
        List<Film> films = filmService.getAll();
        //使用PageInfo包装查询后的结果，咱们只需要将PageInfo交给页面，封装了详细的分页信息，包括查询出来的数据，每次显示5页
        PageInfo pageInfo = new PageInfo(films, 5);
        Msg msg = Msg.success().add("pageInfo", pageInfo);
        Gson gson = new Gson();//gson的使用
        String json = gson.toJson(msg);//将msg对象转化为string
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.append(json);
    }
}
