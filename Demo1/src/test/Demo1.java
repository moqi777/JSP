package test;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @author:zhengyilong
 * @email:1797344574@qq.com
 * @phone:13479394730
 * @desc:
 * @DateTime:2024/4/18 22:38
 **/
public class Demo1 {
    public static void main(String[] args) throws UnsupportedEncodingException {
        String str = "头像.jpg";
        System.out.println(str.substring(str.lastIndexOf(".")+1));

        File file = new File("D:\\AppServ\\www\\src\\t1去外地范玮琪.php");
        String encode = URLEncoder.encode(file.getName(), "UTF-8");
        System.out.println(encode);
    }
}

