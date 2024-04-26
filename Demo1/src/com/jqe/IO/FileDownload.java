package com.jqe.IO;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * @author:zhengyilong
 * @email:1797344574@qq.com
 * @phone:13479394730
 * @desc:
 * @DateTime:2024/4/19 20:45
 **/
@WebServlet("/download")
public class FileDownload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //确认下载的文件路径
        String realPath = this.getServletContext().getRealPath("/img/头像.jpg");
        //创建文件
        File file = new File(realPath);

        //输入流
        FileInputStream fileInputStream = new FileInputStream(file);
        //设置编码格式和响应头
        resp.setContentType("application/x-msdownload");
        resp.setHeader("Content-Disposition","attachment;filename="+ URLEncoder.encode(file.getName(),"UTF-8"));
        //输出流
        ServletOutputStream outputStream = resp.getOutputStream();

        byte[] buffer = new byte[1024];
        int len;

        while ((len = fileInputStream.read(buffer)) > 0){
            outputStream.write(buffer,0,len);
        }

        outputStream.close();
        fileInputStream.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}

