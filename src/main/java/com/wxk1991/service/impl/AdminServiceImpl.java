package com.wxk1991.service.impl;

import com.wxk1991.entity.Admin;
import com.wxk1991.mapper.AdminMapper;
import com.wxk1991.service.IAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-12-25
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

}
