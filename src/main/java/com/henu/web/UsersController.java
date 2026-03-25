package com.henu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.henu.entity.User;
import com.henu.service.UserService;
import com.henu.utils.OnlineData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author **
 * @since 2024年11月17日
 */
@RestController
@RequestMapping("/user")
public class UsersController {
    @Autowired
    private UserService userService;

    //用户注册
    @PostMapping("/register") // /user/register
    public int register(@RequestBody User user) {
        QueryWrapper<User> query = Wrappers.query();
        User us = userService.getOne(query.eq("username", user.getUsername()) );
        if(us!=null){
            return -1;
        }else{
            //初始化积分和等级
            user.setScore(0);
            user.setLevel(0);

            boolean b = userService.save(user);
            return b?1:0;
        }
    }

    @GetMapping("/login")
    public User login(User user) {

        User us = userService.getOne(Wrappers.query(user));
        if (us != null) {
            //登录成功
            OnlineData.onlineUsers.put(us.getId(), us);
        }
        return us;
    }


}
