package com.jqe;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * @author:zhengyilong
 * @email:1797344574@qq.com
 * @phone:13479394730
 * @desc:
 * @DateTime:2024/5/8 16:17
 **/
@Data
@AllArgsConstructor
@ToString
public class Resume {
    String name;
    String gen;
    String birthday;
    String phone;
    String mail;
    String address;
    String school;
    String work;
    String skill;
}

