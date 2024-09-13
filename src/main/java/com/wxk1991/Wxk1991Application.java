package com.wxk1991;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.Transactional;

@SpringBootApplication
//开启定时任务
@EnableScheduling
public class Wxk1991Application {

    public static void main(String[] args) {
        SpringApplication.run(Wxk1991Application.class, args);
    }

}
