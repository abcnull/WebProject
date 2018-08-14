package com.example.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 石磊 on 2018/8/7.
 */
public class Msg {
//    状态码，服务器返回100成功
//    状态码，服务器返回200失败
    private int code;
    private String msg;//提示信息
//    用户返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<String, Object>();
//    返回处理成功的该类对象
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }
//    返回处理失败的该类对象
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }
//    返回新增了map属性键值的该类对象
    public Msg add(String key, Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
