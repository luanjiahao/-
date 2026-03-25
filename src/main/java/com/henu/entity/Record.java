package com.henu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 *
 */

@TableName("record")
public class Record {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private Integer pkid;
    private int x;
    private int y;
    private String color;

    public Record(){}

    public Record(Integer id, Integer pkid, Integer x, Integer y, String color) {
        this.id = id;
        this.pkid = pkid;
        this.x = x;
        this.y = y;
        this.color = color;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPkid() {
        return pkid;
    }

    public void setPkid(Integer pkid) {
        this.pkid = pkid;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
