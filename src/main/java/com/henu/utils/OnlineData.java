package com.henu.utils;

import com.alibaba.fastjson.JSON;
import com.henu.entity.User;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class OnlineData {

    //在线用户 用户id-用户对象
    //用map在查数据时更简洁，直接调用map的get方法就可以
    public static Map<Integer, User> onlineUsers = new ConcurrentHashMap<>();
    //新增逻辑： 用户登录，会添加当前用户到onlineUsers
    //在哪新增： 登录成功时，在LoginServlet中完成新增


    //求和
    //key：消息用户id
    //value: 1（求和申请） 2（同意求和） 3 （拒绝求和）
    public static Map<Integer, Integer> he = new HashMap<>();

    //删除逻辑： 当用户心跳超时时（3秒），将onLineUsers中的当前用户删除
    //在哪删除： 专门创建一个（定时器）类，定时的去检查超时用户，完成删除

    //记录心跳
    //key:用户id    值：时间戳
    public static Map<Integer,Long> xintiao  = new ConcurrentHashMap<>();

    //记录邀请消息
    //key: 被邀请用户id  值：List<Users> 邀请者集合
    //该用户，被哪些用户邀请了
    public static Map<Integer,List<User>> yaoqing = new HashMap<>();


    //记录接受邀请消息
    //key: 邀请者id， 值：接受邀请的用户
    public static Map<Integer,User> jieshou = new HashMap<>();


    //落子信息消息
    //归属于某个用户的落子消息
    //key: 用户id  例如 5:5号用户
    //value: 棋子位置  例如 1,3 : 棋子在棋盘的坐标为（1,3）
    public static Map<Integer,String> goes = new HashMap<>();


    //失败消息通知
    //keyid ： 用户id
    //value: 1
    // 这个用户已经输了
    public static Map<Integer,Integer> fails = new HashMap<>();

    //static: 系统启动就执行，并且只执行一次
    //系统启动时就将定时器开启，让它去检查心跳，删除超时用户
    static{
        Timer timer = new Timer();
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                ////检查超时用户，完成删除
                //遍历xintiao Map，找超时
                Set<Integer> ids = OnlineData.xintiao.keySet();//获取所以key，用户id
                List<Integer> removeIds = new ArrayList<>();
                for (Integer id : ids) {
                    Long time = OnlineData.xintiao.get(id);//获取它的心跳时间（时间戳）
                    if (time != null) {
                        //超过3秒算超时
                        if (System.currentTimeMillis() - time >= 30000) {
                            //删除onlineUsers中对应的对象
                            User u = OnlineData.onlineUsers.remove(id);
                            System.out.println("删除：" + JSON.toJSONString(u));
                            removeIds.add(id);
                        }
                    }
                }
                //将过时的心跳也删除
                for(Integer id:removeIds){
                    xintiao.remove(id);
                }
            }
        };
        timer.schedule(task, 0, 10000);
    }


}
