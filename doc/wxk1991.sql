/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : wxk1991

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 06/01/2022 23:23:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `ad_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告id',
  `ad_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型',
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `ad_img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告的图片url地址',
  `ad_link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告跳转连接',
  `ad_sort` int(11) NULL DEFAULT NULL COMMENT '广告排序，越小越排在前面',
  `ad_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '广告开始时间',
  `ad_end_time` datetime(0) NULL DEFAULT NULL COMMENT '广告结束时间',
  `ad_add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加广告的时间',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('bf95b3c916434181c99a013e23dd576a', '0be3c8f15d70b5efffb66a6891fc7aad', 'SpringBoot从零开始搭建博客网站', '/20220106/upload/img/001_77de88949c9f47a4b7fe8bd96572e312.jpg', '#', 10, '2022-01-06 15:43:18', '2023-12-31 23:55:26', '2022-01-06 15:43:27');

-- ----------------------------
-- Table structure for ad_type
-- ----------------------------
DROP TABLE IF EXISTS `ad_type`;
CREATE TABLE `ad_type`  (
  `ad_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告类型id',
  `ad_type_title` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型名称',
  `ad_type_tag` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型标识（首页顶部广告，轮播图广告，文章详情广告）',
  `ad_type_sort` int(10) UNSIGNED NULL DEFAULT 10 COMMENT '广告类型排序，越小越靠前',
  `ad_type_add_time` datetime(0) NULL DEFAULT NULL COMMENT '广告类型添加时间',
  PRIMARY KEY (`ad_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad_type
-- ----------------------------
INSERT INTO `ad_type` VALUES ('0be3c8f15d70b5efffb66a6891fc7aad', '首页轮播图广告', 'homeAd', 0, '2021-12-25 10:23:35');
INSERT INTO `ad_type` VALUES ('e055bfbbcb4e35d92e1535654efb318e', '文章页面广告', 'articleAd', 1, '2021-12-25 10:23:35');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理员id',
  `admin_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `admin_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('cee01ba692ec3a4109d1e5e8b072bb98', 'admin', '0b4ef09e81e126cbc3732626416ae99c');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
  `article_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `article_cover_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `article_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_add_time` datetime(0) NULL DEFAULT NULL COMMENT '文章添加时间',
  `article_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `article_good_number` int(11) NULL DEFAULT NULL COMMENT '点赞次数',
  `article_look_number` int(11) NULL DEFAULT NULL COMMENT '观看次数',
  `article_hot` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是热门文章 0否，1是',
  `article_collection_number` int(11) NULL DEFAULT NULL COMMENT '收藏次数',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('76f9585b41424c9cbe39e833dbff815b', 'b59233147619026b7394dd80594ba26c', '2c69040892634050ad1892770d2ea68f', '/20220106/upload/img/粉紫色表白攻略可爱情人节节日分享中文微信公众号封面_cedd74d2ed67431b8fbc94b6106b2996.png', '男幼师的程序员之路', '2022-01-06 16:14:52', '<p style=\"text-align: center;\"><font size=\"6\" face=\"SimHei\" style=\"background-color: rgb(0, 176, 80);\" color=\"#ffffff\">说点啥吧，说啥好呢，那随便说咯</font></p><p><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp;大部分码农下班回家不是玩游戏就是玩游戏，对，我也一样；</font></p><p><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp;这种生活方式不好，一个游戏玩了10年，10年后发现自己啥也不是；</font></p><p><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp;突然想做点什么事情了，但又不知道做啥，自己除了会写点烂bug外还能做啥，啥都不会了；算了，那就写点bug吧，做个自己的小网站，多半也搞不到钱，可能连服务器费用都搞不到，比玩游戏好就成；</font></p><p><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp;提起编程的道路，感觉自己走了好多弯路呀，12年大学学了个学前教育专业，我的妈呀，出来实习800块工资，在幼儿园每天跟一些小朋友玩，我逗他们，他们逗我，倒是挺开心的，如果不是薪水太低，自己可能还会喜欢上那个职业；还记得当时毕业的时候，是绵阳的九院的幼儿园来招聘的，九院是个牛逼哄哄的单位，做啥的就不能说了，底下的幼儿园应该也比较牛逼吧，所以</font><span style=\"font-size: medium;\">我们那届有100多人面试，一个大的教室，6个男生其余全是女生，（对，我们专业没得几个男的，别个都说那你们不是个个熊猫哦，我tm只能呵呵一笑，哪个女的愿意找个幼师男的？还tm一个月只有1000的工资），人家九园的院长来就说了，你们100多人啊，我们只要三个。此话一出，教室后门那一坨人像打游击战的一样勾到脑壳往后门遛，我也想遛，但我坐在前面的，太明目张胆的好像不给九院面子一样，还是算了反正当学下面试经验了；</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp; 九院老师逼逼了几句后，拿了光盘出来，据说那是他们的宣传片，优雅的放到电脑主机里面，结果电脑不给九院面子，死机加放不出来，急得暴跳，然后那个招生办老师问，有没有谁会弄这个东西啊，优先录用；好巧不巧，我tm会，但是我不说，哎！就是玩，就装深沉撒，结果我后面一群女的指着我说这个叫王小康的会弄；别个说都说了，我不上去弄就不好得，那就假吧意思上去弄嘛，结果不出意外真给弄好了，那个院长说这个男生一会过来登个记；就这么就一面就过了，二面是在绵阳，去绵阳的那几天真滴是尴尬得一批，问钢琴，别人都是弹肖邦的曲子，我只会个两只老虎，问舞蹈，别人都是民族舞蹈，现代舞蹈，我跳的是个啥我都不知道，问美术，别人都是画点国画卡通画，我是画小鸡吃米图，问英语，别个都至少用英语三分钟自我介绍，我是说了一个my name is wangxiaokang ,3q you。。。。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp; 但是，我还是过了，这个面试过得我都开始怀疑人生了，好吧，不得不说那个时候男的在幼儿园确实有点枪手，尤其是会点别人不会的技能的时候，没得办法，既然面试上了就好好上班咯。上班第一天交给我任务是，维护中心院下面6个幼儿园的网络和电脑打印机之类的，然后周二和周四去不同的幼儿园教体育和数学，不错，工作性质还算比较符合我的职业规划；一干就干了半年，期间除了和小娃娃耍，还给他们做了6.1的宣传片，带毕业了一届大班的小朋友，另外和几个小朋友拜了把子，我当大哥他们是我小弟，半年来从中心院办公到二幼去当全职老师在到7幼去，除了工资连我裤兜都装不满以外，其他都很好，还和一个女老师差点搞起了，幸好我照了下镜子才放弃了。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp;12年下半年我用了一种不正确的方式离职了，没办法，走不了啊；我直接去了雅安，那个一个星期七天有五天都在下雨的城市，俗称雨城，去那边做的是移动代维，就是维护移动城域网络，什么医保网络啊，移动集团客服网络啊什么的，在那里我学到了网络基础知识，学会点思科路由交换机配置之类的，不是家庭路由，是用命令配置，没有可视化界面的，当时觉得在一个黑黢黢的界面敲代码感觉自己好牛逼啊，在雅安雨城我待了一年，这一年除了学习交换机配置外，还学了点c++，delphi，但是都登不上大雅之堂，就是很业余，不能用这个技能去找工作，差太远了；学习目的只是为了做游戏</span><span style=\"font-size: medium;\">*-*</span><span style=\"font-size: medium;\">外*-*挂，那个时候的DNF，剑侠三都很火，想到能搞一个wg卖，自己离自由职业就不远了，但是我太小看了wg的难度了，需要学习汇编和反汇编，还有什么脱壳原理，网络加密包分析，我操，真不是我一个业余专科生能学会的东西，好吧放弃了，不过那个时候我自己做了一个网站，叫寻幽谷，里面很多外挂，骇客之类的教程，现在已经关闭了，域名都被别人抢走了，不然我现在这个网站域名就用www.xunyougu,comle ，期间我</span><span style=\"font-size: medium;\">还</span><span style=\"font-size: medium;\">认识的聪哥，枫叶林的冲哥，那个时候很出名的，现在已经销声匿迹了，还有大名鼎鼎的 天道酬勤，这个是个大神，百度他的游戏辅助教程，还有大把大把的，后来我们几个还一起搞了一个woaidaima.com&nbsp; 网站，现在只有天道一个在弄了。后门我就开始试着用delphi写各种东西，什么扫描电脑硬盘，发现名称类似为 美***.jpg ，重要资料.doc 啊，这种东西就往我自己的服务器传送，后来在学习了相关的法律知识后就没搞了，那些xx.jpg&nbsp; xx.doc全都删除了，其中还有一个大公司，现在已经上市了，的重要资料，申明我没有传播也没偷看哈。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp;13年我回到成都，凭借自己那点点网络知识和服务器知识，找了一个网站系统维护的工作，又干了三个月，这个三个月我学了php这个世界上最好的编程语言，做了一个留言板，结束了自己php生涯，三个月后公司垮了，又离职了。又去做了网络推手，那种在网上各种发文，各种推广的职业，老板说了，产品推出去了，每个员工奖励一个水杯，真是让老板破费了。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp; 时间来到14年，</span><span style=\"font-size: medium;\">没错，这一年我和大学耍四年的女朋友分手了，还是说两嘴吧，</span><span style=\"font-size: medium;\">毕竟这么大的事，</span><span style=\"font-size: medium;\">反正她又看不到，她和我不是一个专业，她是市场营销的，比我小一届，女朋友该有的样子她都没得，但是当时就是对上眼了就耍上了，这一耍就是四年时间，不得不说，如果不是那个叫黄军的已婚男人，可能我们已经结婚了，现在我对姓黄的人过敏，姓黄的人麻烦不要注册我的博客账号谢谢，但是现在想想哈确实已婚男人魅力大，成熟稳定有钱体贴，好吧我承认我现在还没有这些特点，珉姐性格偏社会性，但是我又不是社会人，我也努力成为她喜欢的那种性格，但是我天生就不是社会性格，可能一开始就性格就没对上号。分手后我浑浑噩噩的度过了两个月，这两个月我住在同学那里，那个叫李菠萝的男人，那个炒菜用电饭锅炒的人，那个永远不会生气永远被我骂还嘻嘻哈哈的男人，nonono,我没有喜欢上他，我这方面取向还是正常的，一起住的还有个叫罗马的男人，三个男人一台戏。那两个月和他们同吃同住，菠萝在幼儿园当老师，罗马在写剧本要当导演，我就在他得出租屋里沉浸在失恋中无法自拔，两个月后，我满血复活了，开始了我的下一段漂泊之旅。14年国庆节，我还在犹豫我去哪个城市发展，反正成都我是不想呆了，这个让我伤心的城市，然后我端着水杯打开一张四川地图观摩，突然嘴上一滴水滴到了地图上，正好在四川的遂宁，好家伙，就它了，他正好在成都和重庆的中间位置，我老家重庆的，有家人在成都，天时地利人和，人和还没得。说走就走，我给李菠萝说我要走了，晚上三个男人一起吃了成都巷子火锅，第二天我出发遂宁，又是一段奇葩痛苦的经历。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp; 15年了，</span><span style=\"font-size: medium;\">我在遂宁，在一个1688创意工厂园区里面上班，不是工厂，是一个电商业务的公司，我是做他们系统维护的，当时公司做的挺火的，老王（王总），每个月都会砸大把大把钱做宣传，库房的货物品种越来越多，也是在这个公司我认识了我的上一任女票，我叫她风车车，她是在公司做广告设计的，感觉和她挺合的来的，这一耍又耍了四年，四年基本没吵架，每天和她过得都挺开心的，她对生活很有规划，在网上买的东西便宜又好用，把屋子打理得井井有条的，不算漂亮也不算丑，但是就是看着给人很舒服的感觉，是个适合结婚值得一辈子在一起的人。可惜啊，我自己犯错误(不是出轨，不想提起的痛苦)。。。到遂宁后的，我开始学习android开发j2ee，别说，有了以前的编程经验，java真的比c简单多了，自己用上班业余时间学习，两个月后，已经可以开始写一些东西了，那个时候流行的框架是ssm,ssh,但是这些都用得少，我喜欢上了一个国产的框架，Jfinal，现在还能查到，写代码跟拉稀一样爽。这个框架也是开启我进入程序员大门的钥匙，我用这个框架感觉什么功能都能做出来，我当时做过电商网站、装饰网站，门户网站、视频站，直到springboot的出现，才放弃了它。</span></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp;下班了，，，明天在接着写，，，</span></p><p><br></p><p><span style=\"font-size: medium;\">&nbsp; &nbsp; &nbsp; &nbsp;</span></p><p><span style=\"font-size: medium;\"><br></span></p><p><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp;</font></p><p><font size=\"5\"><br></font></p><p><br></p>', 1, 23, 0, 0);
INSERT INTO `article` VALUES ('af00d57a762aba0360ca4b5fe1531aa8', '2b897e397c6a058507f66d3b8ee27597', '2c69040892634050ad1892770d2ea68f', '/20220106/upload/img/粉紫气泡渐变双十一促销微信公众号封面_14908d277bfb4b5891430439b860e9e2.png', 'SpringBoot从零开始搭建博客网站', '2022-01-06 15:59:42', '<p><font size=\"5\">SpringBoot从零开始搭建博客网站</font></p><p><br></p>', 1, 31, 0, 0);

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `article_tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标签id',
  `article_tag_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `article_tag_add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES ('149c834a2c27624060a30782a9f198d0', 'SpringBoot', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('325eae9b1dbff3d211ca68c6dc18f78d', 'mysql', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('4186f544f4f59a158ddcbb7131d7ad79', 'mybatis', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('6770d541e8d8fc14046ab88b4db99fe9', 'java', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('6cef823dc9908dd9baadf70b3e0ece09', 'vue', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('807df03d515c0f42ea79c0c550e3c5e3', 'SpringCloud', '2022-01-05 23:23:46');
INSERT INTO `article_tag` VALUES ('8917da38b5e97c2c3308857a0ce3c85a', '生活那点事', '2022-01-06 16:13:07');
INSERT INTO `article_tag` VALUES ('b380e78d339f7045e8d76db5f57a53d6', '英雄联盟', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('cb248801542ddbf007f6bf66b3647027', '方舟生存进化', '2021-12-23 21:21:45');
INSERT INTO `article_tag` VALUES ('cd54f2abfaa5b61f759836d3c09d0e22', '游戏', '2021-12-23 21:21:45');

-- ----------------------------
-- Table structure for article_tag_list
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_list`;
CREATE TABLE `article_tag_list`  (
  `article_tag_list_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章对应标签id',
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章id',
  `article_tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签id',
  PRIMARY KEY (`article_tag_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章对应标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag_list
-- ----------------------------
INSERT INTO `article_tag_list` VALUES ('09f9a6a30f368bfda14ac1e8f12616e1', 'af00d57a762aba0360ca4b5fe1531aa8', '4186f544f4f59a158ddcbb7131d7ad79');
INSERT INTO `article_tag_list` VALUES ('18a3c097cd4cad872e4a67e2312db7a6', 'af00d57a762aba0360ca4b5fe1531aa8', '325eae9b1dbff3d211ca68c6dc18f78d');
INSERT INTO `article_tag_list` VALUES ('7012a90094d0b6d1ae954e13a9e3e8a3', 'af00d57a762aba0360ca4b5fe1531aa8', '149c834a2c27624060a30782a9f198d0');
INSERT INTO `article_tag_list` VALUES ('e49843e7f4bcafa8cfdb184c0dd7a5d1', 'af00d57a762aba0360ca4b5fe1531aa8', '6770d541e8d8fc14046ab88b4db99fe9');
INSERT INTO `article_tag_list` VALUES ('f280f95eeb1f53e26748a76ceeb48edf', '76f9585b41424c9cbe39e833dbff815b', '8917da38b5e97c2c3308857a0ce3c85a');

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `article_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章分类id',
  `article_type_parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类父id',
  `article_type_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类名称',
  `article_type_sort` int(11) NULL DEFAULT NULL COMMENT '文章分类排序，越小越靠前',
  `article_type_add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类i' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('18f4b2d41b944252ac5f970aa234d348', '3b52dbbdad61b445663361ebf8f467ad', 'vue', 40, '2022-01-03 10:08:31');
INSERT INTO `article_type` VALUES ('1c2ab73282ada9223fe68b3a09415cb9', '', '游戏', 20, '2022-01-03 10:07:16');
INSERT INTO `article_type` VALUES ('2b897e397c6a058507f66d3b8ee27597', '449333fdae67b307a71cf96caf52b0fa', 'java', 0, '2022-01-03 10:07:33');
INSERT INTO `article_type` VALUES ('3b52dbbdad61b445663361ebf8f467ad', '', '前端', 10, '2021-12-23 21:26:27');
INSERT INTO `article_type` VALUES ('449333fdae67b307a71cf96caf52b0fa', '', '后端', 0, '2022-01-03 10:07:05');
INSERT INTO `article_type` VALUES ('533d2f2d20b4c5eb3247f0cca1d2b4d0', '1c2ab73282ada9223fe68b3a09415cb9', '方舟生存进化', 0, '2022-01-03 10:08:45');
INSERT INTO `article_type` VALUES ('5db9f9c18a9b5fa3afcf20e564eab2e5', '', '生活', 30, '2022-01-03 10:07:22');
INSERT INTO `article_type` VALUES ('611bb6ed477d06bedb771b6f3b2380b9', '1c2ab73282ada9223fe68b3a09415cb9', '英雄联盟', 10, '2022-01-03 10:09:01');
INSERT INTO `article_type` VALUES ('664b900047cf47b4775338032e83d444', '449333fdae67b307a71cf96caf52b0fa', 'c++', 10, '2022-01-03 10:07:43');
INSERT INTO `article_type` VALUES ('ab6fa67c2ba644440f3b361050800547', '3b52dbbdad61b445663361ebf8f467ad', 'css', 10, '2022-01-03 10:08:04');
INSERT INTO `article_type` VALUES ('b59233147619026b7394dd80594ba26c', '5db9f9c18a9b5fa3afcf20e564eab2e5', '我是穷逼', 10, '2022-01-06 15:44:03');
INSERT INTO `article_type` VALUES ('cedb98aa9e90fe95d1de6c5c666f210e', '3b52dbbdad61b445663361ebf8f467ad', 'javascript', 20, '2022-01-03 10:08:14');
INSERT INTO `article_type` VALUES ('f21998f1d4bd8593a178317cff1e2eb6', '3b52dbbdad61b445663361ebf8f467ad', 'jquery', 30, '2022-01-03 10:08:22');
INSERT INTO `article_type` VALUES ('f6f10439ba39da2430081eb89460db9d', '3b52dbbdad61b445663361ebf8f467ad', 'html', 0, '2022-01-03 10:07:56');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章评论id',
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id（评论人）',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章评论内容',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `comment_good_number` int(11) NULL DEFAULT NULL COMMENT '点赞次数',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('b3d60ae222f811f3dca9aafa01fb46d9', 'af00d57a762aba0360ca4b5fe1531aa8', '338f668cfa0d4dc1b46dd03073402ef0', '123123123', '2022-01-06 19:17:57', 1);
INSERT INTO `comment` VALUES ('e4d046a9f38d9149d2742675c2154383', 'af00d57a762aba0360ca4b5fe1531aa8', '338f668cfa0d4dc1b46dd03073402ef0', '123123123', '2022-01-06 20:17:03', 1);

-- ----------------------------
-- Table structure for comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply`  (
  `comment_reply_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论回复id',
  `comment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论id',
  `reply_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复评论的人id',
  `secondly_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '继续回复的人id',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复内容',
  `comment_reply_time` datetime(0) NULL DEFAULT NULL COMMENT '评论回复的时间',
  PRIMARY KEY (`comment_reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论回复' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `link_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友情连接id',
  `link_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情连接标题',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情连接的地址',
  `link_logo_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情连接logo',
  `link_sort` int(11) UNSIGNED NULL DEFAULT 10 COMMENT '友情连接排序，越小越考前',
  `link_add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加友情连接的时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情连接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('2698265b7ae39dc59d3cdff5c5d6dd06', '百度', 'https://www.baidu.com', 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', 2, '2021-12-25 10:22:08');
INSERT INTO `link` VALUES ('5395b905b2b73e791a2fbba044dec51c', '阿里矢量图标库', 'https://www.iconfont.cn/', 'https://img.alicdn.com/imgextra/i3/O1CN01Mn65HV1FfSEzR6DKv_!!6000000000514-55-tps-228-59.svg', 5, '2021-12-25 10:31:29');

-- ----------------------------
-- Table structure for upload_file_list
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_list`;
CREATE TABLE `upload_file_list`  (
  `upload_file_list_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件的列表',
  `file_size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小，作为文件唯一标识',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径url',
  `upload_file_time` datetime(0) NULL DEFAULT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`upload_file_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_file_list
-- ----------------------------
INSERT INTO `upload_file_list` VALUES ('4a341776689bab7116d1ee73880ac142', 33072, '/20220106/upload/img/粉紫色表白攻略可爱情人节节日分享中文微信公众号封面_cedd74d2ed67431b8fbc94b6106b2996.png', '2022-01-06 16:14:52');
INSERT INTO `upload_file_list` VALUES ('e2c604fae29b0fe42a3729d5775d2b5f', 69954, '/20220106/upload/img/粉紫气泡渐变双十一促销微信公众号封面_14908d277bfb4b5891430439b860e9e2.png', '2022-01-06 15:59:42');
INSERT INTO `upload_file_list` VALUES ('f23c4d4a896734b080651f464d7d6237', 158974, '/20220106/upload/img/001_77de88949c9f47a4b7fe8bd96572e312.jpg', '2022-01-06 15:43:27');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_publish_article` int(1) NULL DEFAULT NULL COMMENT '是否可以发布文章 0不能，1可以发布',
  `user_frozen` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否冻结，0正常，1冻结（冻结后无法登陆）',
  `user_register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2c69040892634050ad1892770d2ea68f', 'wxk546259649', '5f85a56a40b42984b6c710c2a294a5a6', 1, 0, '2022-01-05 23:47:30');
INSERT INTO `user` VALUES ('338f668cfa0d4dc1b46dd03073402ef0', 'kk123456', '9f347acd25767e9f49554beea18fca1c', 0, 0, '2022-01-06 19:15:28');
INSERT INTO `user` VALUES ('91f90eba67d14d438eb085298b04ed89', '123456', 'e86c2c0c894d3fa2abf59ace69c4b950', 0, 0, '2022-01-06 16:00:16');
INSERT INTO `user` VALUES ('d509626a195a4e669e5a266528c8edf7', '123', '9f37c49a2384d6e7010e95897f541dd4', 0, 1, '2022-01-03 09:29:37');

-- ----------------------------
-- Table structure for user_collection_article
-- ----------------------------
DROP TABLE IF EXISTS `user_collection_article`;
CREATE TABLE `user_collection_article`  (
  `user_collection_article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户收藏的文章id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章id',
  `user_collection_article_time` datetime(0) NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`user_collection_article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏的文章' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
