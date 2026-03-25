package com.henu.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("pk")
public class PK {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private Integer uid1;
    private Integer uid2;
    private String result;
    private Integer winid;
    private String ctime;
    //0 未开始   1 进行中  2 已结束
    private int status;

    @TableField("uid1_nickname")
    private String uid1Nickname;

    @TableField("uid2_nickname")
    private String uid2Nickname;

    public String getUid1Nickname() {
        return uid1Nickname;
    }

    public void setUid1Nickname(String uid1Nickname) {
        this.uid1Nickname = uid1Nickname;
    }

    public String getUid2Nickname() {
        return uid2Nickname;
    }

    public void setUid2Nickname(String uid2Nickname) {
        this.uid2Nickname = uid2Nickname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid1() {
        return uid1;
    }

    public void setUid1(Integer uid1) {
        this.uid1 = uid1;
    }

    public Integer getUid2() {
        return uid2;
    }

    public void setUid2(Integer uid2) {
        this.uid2 = uid2;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Integer getWinid() {
        return winid;
    }

    public void setWinid(Integer winid) {
        this.winid = winid;
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
