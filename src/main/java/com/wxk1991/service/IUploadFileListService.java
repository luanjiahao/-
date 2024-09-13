package com.wxk1991.service;

import com.wxk1991.entity.UploadFileList;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2022-01-03
 */
public interface IUploadFileListService extends IService<UploadFileList> {

    /**
     * 文件上传后获取文件路径
     * @param file
     * @return
     */
    String getUploadFileUrl(MultipartFile file);
}
