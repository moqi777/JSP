package com.jqe.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author:zhengyilong
 * @email:1797344574@qq.com
 * @phone:13479394730
 * @desc:只有用户名和密码正确且是post请求才跳转到欢饮界面，否者仍然是登录界面，使用重定向
 * @DateTime:2024/4/1 17:05
 **/
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=utf-8");

            String name = req.getParameter("name");
            String password = req.getParameter("password");
            if (name.equals("莫七")&&password.equals("123123")){
                resp.sendRedirect("/servlet/hello.jsp?name="+name);
            }else {
                resp.sendRedirect("/servlet/login.jsp?trem=0");

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}

