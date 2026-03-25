package com.henu.service.impl;

import com.henu.entity.User;
import com.henu.mapper.UserMapper;
import com.henu.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author **
 * @since 2024年11月17日
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
