package com.henu.web;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.henu.entity.PK;
import com.henu.entity.User;
import com.henu.mapper.PKMapper;
import com.henu.mapper.UserMapper;
import com.henu.service.UserService;
import com.henu.utils.OnlineData;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author **
 * @since 2024年11月17日
 */
@RestController
@RequestMapping("/onlines")
public class OnlineController {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PKMapper pkMapper;


    //用户个人数据
    @GetMapping("/myinfo")
    public User myinfo(int id) {
        //根据用户id，去在线用户列表中直接查询用户
        User user = OnlineData.onlineUsers.get(id);
        return user;
    }

    //页面数据更新：在线用户、当前对局
    @GetMapping("/onlines")
    public Map<String, Object> onlines(int id) {
        if (id != -1) {//有意义的用户
            //更新心跳
            OnlineData.xintiao.put(id, System.currentTimeMillis());
        }
        //获取在线用户
        Collection<User> users = OnlineData.onlineUsers.values();
        //当前进行的对局（桌位）
        QueryWrapper<PK> query = Wrappers.query();
        List<PK> pks = pkMapper.selectList(query.ne("status", 2));

        //我的新消息（邀请消息）
        List<User> yqs = OnlineData.yaoqing.get(id);
        if (yqs == null) {
            yqs = new ArrayList<>();
            OnlineData.yaoqing.put(id, yqs);
        }
        //接受邀请的信息
        User whiteuser = OnlineData.jieshou.remove(id);

        //我的棋子信息（坐标）
        String xy = OnlineData.goes.remove(id);//获取并清空
        //我是不是输了
        Integer fail = OnlineData.fails.remove(id);

        Integer he=OnlineData.he.remove(id);

        Map<String, Object> map = new HashMap<>();
        map.put("users", users);//在线用户
        map.put("pks", pks);
        map.put("yqs", new ArrayList<>(yqs));
        OnlineData.yaoqing.get(id).clear();//清空邀请消息
        map.put("whiteuser", whiteuser);

        map.put("xy", xy);//null 或  1,3
        map.put("fail", fail);// null 或 1
        map.put("he",he);//1,2,3,null

        return map;
    }

    /**
     * 邀请功能
     *
     * @param id      邀请者id
     * @param otherid 被邀请者id
     * @return
     */
    @GetMapping("/yaoqing")
    public Integer yaoqing(int id, int otherid, String nickname) {
        //创建座位
        PK pk = new PK();
        pk.setUid1(id);
        pk.setUid1Nickname(nickname);
        pk.setCtime(new SimpleDateFormat("yyyy-MM-dd HH:ss:mm").format(new Date()));
        pk.setStatus(0);
        pkMapper.insert(pk);
        //记录邀请消息
        List<User> us = OnlineData.yaoqing.get(otherid);
        if (us == null) {
            us = new ArrayList<>();
            //将该集合加入到map中
            OnlineData.yaoqing.put(otherid, us);
        }
        us.add(OnlineData.onlineUsers.get(id));//当前用户加入到集合中
        return pk.getId();//响应桌号
    }

    @GetMapping("/jieshou")
    public Map<String, Object> jieshou(int id, int otherid, String nickname) {
        Map<String, Object> map = new HashMap<>();
        //当前进行的对局（桌位）
        QueryWrapper<PK> query = Wrappers.query();
//        select * from pk where status=0 and uid1=#{otherid} order by id desc limit 0,1
        PK pk = pkMapper.selectOne(query.eq("status", 0)
                .eq("uid1", otherid).orderByDesc("id").last("LIMIT 0,1"));

        if (pk != null) {
            //更新pk表数据，修改uid2和 状态为1 进行中
            pk.setUid2(id);
            pk.setStatus(1);
            pk.setUid2Nickname(nickname);
            pkMapper.updateById(pk);
            //查询桌主信息
            User blackuser = userMapper.selectById(otherid);
            //查询接受邀请者的信息（我的信息）
            User whiteuser = userMapper.selectById(id);
            //接受邀请的信息，存放到map中，用来响应
            OnlineData.jieshou.put(otherid, whiteuser);
            //pk信息和桌主信息


            map.put("pk", pk);
            map.put("blackuser", blackuser);
        }
        return map;
    }



}
