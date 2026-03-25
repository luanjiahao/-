package com.henu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.henu.entity.PK;
import com.henu.entity.Record;
import com.henu.mapper.PKMapper;
import com.henu.mapper.RecordMapper;
import com.henu.utils.OnlineData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/play")
public class PlayController {
    @Autowired
    private PKMapper pkMapper;

    @Autowired
    private RecordMapper recordMapper;




    //用户个人数据
    @GetMapping("/putstone")
    public int putstone(Integer x,Integer y,Integer pkid,String color,boolean win) {

        //@2
        Record r = new Record(null,pkid,x,y,color);

        int i = recordMapper.insert(r);

        PK pk = pkMapper.selectById(pkid);

        if(color.equals("b")){
            //黑棋落子---》给白棋用户（uid2）缓存消息
            OnlineData.goes.put(pk.getUid2(),x+","+y);
        }else{
            //白棋落子---》给黑棋用户（uid1）缓存消息
            OnlineData.goes.put(pk.getUid1(),x+","+y);
        }
        //赢：缓存消息、更新PK表
        if(win){
            pk.setResult("赢");
            pk.setWinid(color.equals("b")? pk.getUid1():pk.getUid2());
            pkMapper.updateById(pk);
            //给对手缓存“fail”消息
            OnlineData.fails.put(color.equals("b")?pk.getUid2():pk.getUid1(),1);
        }
        return i;//无具体意义
    }

    //求和
    @GetMapping("/qiuhe")
    public int qiuhe(Integer otherid) {
        OnlineData.he.put(otherid,1);
        return 1;
    }
    //同意求和
    @GetMapping("/jvjue")
    public int jvjue(Integer  otherid) {
        OnlineData.he.put(otherid,3);
        return 1;
    }
    //拒绝求和
    @GetMapping("/tongyi")
    public int tongyi(Integer  otherid,Integer  pkid) {
        PK pk = pkMapper.selectById(pkid);
        pk.setResult("和");
        pk.setStatus(2);
        pkMapper.updateById(pk);


        OnlineData.he.put(otherid,2);
        return 1;
    }

    //退出房间
    @GetMapping("/exit")
    public int exit(Integer pkid){
        int result=pkMapper.deleteById(pkid);
        QueryWrapper<Record> wrapper = new QueryWrapper<>();
        wrapper.eq("pkid", pkid);
        int result2 = recordMapper.delete(wrapper);
        return 1;
    }


}
