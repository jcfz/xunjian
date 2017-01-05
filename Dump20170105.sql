-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: xunjian
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jc_acquisition`
--

DROP TABLE IF EXISTS `jc_acquisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS采集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition`
--

LOCK TABLES `jc_acquisition` WRITE;
/*!40000 ALTER TABLE `jc_acquisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_acquisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_acquisition_history`
--

DROP TABLE IF EXISTS `jc_acquisition_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition_history`
--

LOCK TABLES `jc_acquisition_history` WRITE;
/*!40000 ALTER TABLE `jc_acquisition_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_acquisition_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_acquisition_temp`
--

DROP TABLE IF EXISTS `jc_acquisition_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `percent` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition_temp`
--

LOCK TABLES `jc_acquisition_temp` WRITE;
/*!40000 ALTER TABLE `jc_acquisition_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_acquisition_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising`
--

DROP TABLE IF EXISTS `jc_advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising`
--

LOCK TABLES `jc_advertising` WRITE;
/*!40000 ALTER TABLE `jc_advertising` DISABLE KEYS */;
INSERT INTO `jc_advertising` VALUES (1,1,1,'banner','image',NULL,1,127,0,NULL,NULL,'1'),(2,2,1,'通栏广告1','image',NULL,1,123,2,NULL,NULL,'1'),(3,3,1,'视频广告上','image',NULL,1,0,0,NULL,NULL,'1'),(4,4,1,'视频广告下','image',NULL,1,0,0,NULL,NULL,'1'),(5,5,1,'留言板本周热点广告','image',NULL,1,0,0,NULL,NULL,'1');
/*!40000 ALTER TABLE `jc_advertising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising_attr`
--

DROP TABLE IF EXISTS `jc_advertising_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising_attr`
--

LOCK TABLES `jc_advertising_attr` WRITE;
/*!40000 ALTER TABLE `jc_advertising_attr` DISABLE KEYS */;
INSERT INTO `jc_advertising_attr` VALUES (1,'image_title','查看JEECMS官方网站'),(1,'image_url','/r/cms/www/red/img/banner.gif'),(1,'image_target','_blank'),(1,'image_link','http://www.jeecms.com'),(1,'image_width','735'),(1,'image_height','70'),(2,'image_title','JEECMS官方网站'),(2,'image_url','/r/cms/www/red/img/banner1.jpg'),(2,'image_target','_blank'),(2,'image_link','http://www.jeecms.com'),(2,'image_width','960'),(2,'image_height','60'),(3,'image_height','89'),(3,'image_link','http://'),(3,'image_target','_blank'),(3,'image_url','/u/cms/www/201112/17144805im1p.jpg'),(3,'image_width','980'),(4,'image_height','90'),(4,'image_link','http://'),(4,'image_target','_blank'),(4,'image_url','/u/cms/www/201112/17145028j3bj.jpg'),(4,'image_width','980'),(5,'image_height','109'),(5,'image_link','http://3x.jeecms.com'),(5,'image_target','_blank'),(5,'image_url','/u/cms/www/201112/18155751wi1k.gif'),(5,'image_width','215');
/*!40000 ALTER TABLE `jc_advertising_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising_space`
--

DROP TABLE IF EXISTS `jc_advertising_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising_space`
--

LOCK TABLES `jc_advertising_space` WRITE;
/*!40000 ALTER TABLE `jc_advertising_space` DISABLE KEYS */;
INSERT INTO `jc_advertising_space` VALUES (1,1,'页头banner','全站页头banner','1'),(2,1,'通栏广告','页面中间通栏广告','1'),(3,1,'视频广告上','','1'),(4,1,'视频广告下','','1'),(5,1,'留言板本周热点广告','','1');
/*!40000 ALTER TABLE `jc_advertising_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel`
--

DROP TABLE IF EXISTS `jc_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel`
--

LOCK TABLES `jc_channel` WRITE;
/*!40000 ALTER TABLE `jc_channel` DISABLE KEYS */;
INSERT INTO `jc_channel` VALUES (1,1,1,NULL,'report',1,2,1,1,1);
/*!40000 ALTER TABLE `jc_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_attr`
--

DROP TABLE IF EXISTS `jc_channel_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_attr`
--

LOCK TABLES `jc_channel_attr` WRITE;
/*!40000 ALTER TABLE `jc_channel_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_ext`
--

DROP TABLE IF EXISTS `jc_channel_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员;2:关闭)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_ext`
--

LOCK TABLES `jc_channel_ext` WRITE;
/*!40000 ALTER TABLE `jc_channel_ext` DISABLE KEYS */;
INSERT INTO `jc_channel_ext` VALUES (1,'报表',NULL,NULL,'0','0','0','0',20,NULL,NULL,NULL,'/WEB-INF/t/cms/www/red/channel/新闻栏目.html',NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,'报表','报表','报表');
/*!40000 ALTER TABLE `jc_channel_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_model`
--

DROP TABLE IF EXISTS `jc_channel_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`),
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目可选内容模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_model`
--

LOCK TABLES `jc_channel_model` WRITE;
/*!40000 ALTER TABLE `jc_channel_model` DISABLE KEYS */;
INSERT INTO `jc_channel_model` VALUES (1,1,'',0),(1,3,'',1),(1,4,'',2),(1,5,'/WEB-INF/t/cms/www/WEB-INF/t/cms/www/red/content/图库内容_延迟.html',3),(1,6,'',4),(1,7,'',5),(1,8,'',6);
/*!40000 ALTER TABLE `jc_channel_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_txt`
--

DROP TABLE IF EXISTS `jc_channel_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_txt`
--

LOCK TABLES `jc_channel_txt` WRITE;
/*!40000 ALTER TABLE `jc_channel_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_user`
--

DROP TABLE IF EXISTS `jc_channel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_user`
--

LOCK TABLES `jc_channel_user` WRITE;
/*!40000 ALTER TABLE `jc_channel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_chnl_group_contri`
--

DROP TABLE IF EXISTS `jc_chnl_group_contri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_chnl_group_contri`
--

LOCK TABLES `jc_chnl_group_contri` WRITE;
/*!40000 ALTER TABLE `jc_chnl_group_contri` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_chnl_group_contri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_chnl_group_view`
--

DROP TABLE IF EXISTS `jc_chnl_group_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_chnl_group_view`
--

LOCK TABLES `jc_chnl_group_view` WRITE;
/*!40000 ALTER TABLE `jc_chnl_group_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_chnl_group_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_comment`
--

DROP TABLE IF EXISTS `jc_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_comment`
--

LOCK TABLES `jc_comment` WRITE;
/*!40000 ALTER TABLE `jc_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_comment_ext`
--

DROP TABLE IF EXISTS `jc_comment_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_comment_ext`
--

LOCK TABLES `jc_comment_ext` WRITE;
/*!40000 ALTER TABLE `jc_comment_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_comment_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config`
--

DROP TABLE IF EXISTS `jc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config`
--

LOCK TABLES `jc_config` WRITE;
/*!40000 ALTER TABLE `jc_config` DISABLE KEYS */;
INSERT INTO `jc_config` VALUES (1,'',NULL,8080,'/dbfile.svl?n=',0,'/r/cms/www/no_picture.gif','/login.jspx',NULL,0,120,120,'/r/cms/www/watermark.png','www.cfz.com',20,'#FF0000',50,1,0,0,'2016-12-22','2016-12-22 02:55:33','jeecms',12,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `jc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config_attr`
--

DROP TABLE IF EXISTS `jc_config_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config_attr`
--

LOCK TABLES `jc_config_attr` WRITE;
/*!40000 ALTER TABLE `jc_config_attr` DISABLE KEYS */;
INSERT INTO `jc_config_attr` VALUES (1,'password_min_len','3'),(1,'username_reserved',''),(1,'register_on','false'),(1,'member_on','false'),(1,'username_min_len','3'),(1,'version','jeecmsv5.0-f'),(1,'user_img_width','143'),(1,'user_img_height','98');
/*!40000 ALTER TABLE `jc_config_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content`
--

DROP TABLE IF EXISTS `jc_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`),
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content`
--

LOCK TABLES `jc_content` WRITE;
/*!40000 ALTER TABLE `jc_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_attachment`
--

DROP TABLE IF EXISTS `jc_content_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_attachment`
--

LOCK TABLES `jc_content_attachment` WRITE;
/*!40000 ALTER TABLE `jc_content_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_attr`
--

DROP TABLE IF EXISTS `jc_content_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_attr`
--

LOCK TABLES `jc_content_attr` WRITE;
/*!40000 ALTER TABLE `jc_content_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_channel`
--

DROP TABLE IF EXISTS `jc_content_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_channel`
--

LOCK TABLES `jc_content_channel` WRITE;
/*!40000 ALTER TABLE `jc_content_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_check`
--

DROP TABLE IF EXISTS `jc_content_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_check`
--

LOCK TABLES `jc_content_check` WRITE;
/*!40000 ALTER TABLE `jc_content_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_count`
--

DROP TABLE IF EXISTS `jc_content_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_count`
--

LOCK TABLES `jc_content_count` WRITE;
/*!40000 ALTER TABLE `jc_content_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_ext`
--

DROP TABLE IF EXISTS `jc_content_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_ext`
--

LOCK TABLES `jc_content_ext` WRITE;
/*!40000 ALTER TABLE `jc_content_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_group_view`
--

DROP TABLE IF EXISTS `jc_content_group_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_group_view`
--

LOCK TABLES `jc_content_group_view` WRITE;
/*!40000 ALTER TABLE `jc_content_group_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_group_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_picture`
--

DROP TABLE IF EXISTS `jc_content_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_picture`
--

LOCK TABLES `jc_content_picture` WRITE;
/*!40000 ALTER TABLE `jc_content_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_tag`
--

DROP TABLE IF EXISTS `jc_content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_tag`
--

LOCK TABLES `jc_content_tag` WRITE;
/*!40000 ALTER TABLE `jc_content_tag` DISABLE KEYS */;
INSERT INTO `jc_content_tag` VALUES (1,'2011',1),(2,'中国',1),(9,'机构',0),(16,'基金',0),(52,'调控',0);
/*!40000 ALTER TABLE `jc_content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_topic`
--

DROP TABLE IF EXISTS `jc_content_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_topic`
--

LOCK TABLES `jc_content_topic` WRITE;
/*!40000 ALTER TABLE `jc_content_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_txt`
--

DROP TABLE IF EXISTS `jc_content_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_txt`
--

LOCK TABLES `jc_content_txt` WRITE;
/*!40000 ALTER TABLE `jc_content_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_type`
--

DROP TABLE IF EXISTS `jc_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_type`
--

LOCK TABLES `jc_content_type` WRITE;
/*!40000 ALTER TABLE `jc_content_type` DISABLE KEYS */;
INSERT INTO `jc_content_type` VALUES (1,'普通',100,100,0,0),(2,'图文',143,98,1,0),(3,'焦点',280,200,1,0),(4,'头条',0,0,0,0);
/*!40000 ALTER TABLE `jc_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_contenttag`
--

DROP TABLE IF EXISTS `jc_contenttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_contenttag`
--

LOCK TABLES `jc_contenttag` WRITE;
/*!40000 ALTER TABLE `jc_contenttag` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_contenttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_dictionary`
--

DROP TABLE IF EXISTS `jc_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_dictionary`
--

LOCK TABLES `jc_dictionary` WRITE;
/*!40000 ALTER TABLE `jc_dictionary` DISABLE KEYS */;
INSERT INTO `jc_dictionary` VALUES (1,'1-20人','1-20人','scale'),(2,'20-50人','20-50人','scale'),(3,'50-10人','50-10人','scale'),(4,'100人以上','100人以上','scale'),(5,'私企','私企','nature'),(6,'股份制','股份制','nature'),(7,'国企','国企','nature'),(8,'互联网','互联网','industry'),(9,'房地产','房地产','industry'),(10,'加工制造','加工制造','industry'),(11,'服务行业','服务行业','industry'),(12,'政府机构','政府机构','nature'),(13,'aaa','aaa','aaa'),(14,'房地产','房地产','12');
/*!40000 ALTER TABLE `jc_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_file`
--

DROP TABLE IF EXISTS `jc_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_jc_file_content` (`content_id`),
  CONSTRAINT `fk_jc_file_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_file`
--

LOCK TABLES `jc_file` WRITE;
/*!40000 ALTER TABLE `jc_file` DISABLE KEYS */;
INSERT INTO `jc_file` VALUES ('/u/cms/www//contact.vcf','contact.vcf',0,NULL),('/u/cms/www//index.html','index.html',0,NULL),('/u/cms/www//new.gif','new.gif',0,NULL),('/WEB-INF/t/cms/www//index.html','index.html',0,NULL),('/WEB-INF/t/cms/www//www.zip','www.zip',0,NULL);
/*!40000 ALTER TABLE `jc_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_friendlink`
--

DROP TABLE IF EXISTS `jc_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_friendlink`
--

LOCK TABLES `jc_friendlink` WRITE;
/*!40000 ALTER TABLE `jc_friendlink` DISABLE KEYS */;
INSERT INTO `jc_friendlink` VALUES (1,1,1,'JEECMS官网','http://www.jeecms.com',NULL,'jeecms@163.com','JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。',9,'1',1),(2,1,1,'JEEBBS论坛','http://bbs.jeecms.com',NULL,'jeecms@163.com','JEEBBS论坛',5,'1',10),(3,1,2,'京东商城','http://www.360buy.com/','/u/cms/www/201112/1910271036lr.gif','','',4,'1',10),(4,1,2,'当当网','http://www.dangdang.com/','/u/cms/www/201112/191408344rwj.gif','','',0,'1',10),(5,1,2,'亚马逊','http://www.amazon.cn/','/u/cms/www/201112/19141012lh2q.gif','','',0,'1',10),(6,1,2,'ihush','http://www.ihush.com/','/u/cms/www/201112/19141255yrfb.gif','','',1,'1',10),(7,1,2,'名品打折','http://temai.dazhe.cn','/u/cms/www/201112/19141401rp2d.gif','','',2,'1',10),(8,1,2,'优品','http://temai.dazhe.cn','/u/cms/www/201112/191415078pzs.gif','','',4,'1',10);
/*!40000 ALTER TABLE `jc_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_friendlink_ctg`
--

DROP TABLE IF EXISTS `jc_friendlink_ctg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_friendlink_ctg`
--

LOCK TABLES `jc_friendlink_ctg` WRITE;
/*!40000 ALTER TABLE `jc_friendlink_ctg` DISABLE KEYS */;
INSERT INTO `jc_friendlink_ctg` VALUES (1,1,'文字链接',1),(2,1,'品牌专区（图片链接）',2);
/*!40000 ALTER TABLE `jc_friendlink_ctg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_group`
--

DROP TABLE IF EXISTS `jc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_group`
--

LOCK TABLES `jc_group` WRITE;
/*!40000 ALTER TABLE `jc_group` DISABLE KEYS */;
INSERT INTO `jc_group` VALUES (1,'普通会员',10,1,1,4096,1024,'jpg,jpeg,gif,png,bmp',1),(2,'高级组',10,1,1,0,0,'',0);
/*!40000 ALTER TABLE `jc_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook`
--

DROP TABLE IF EXISTS `jc_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS留言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook`
--

LOCK TABLES `jc_guestbook` WRITE;
/*!40000 ALTER TABLE `jc_guestbook` DISABLE KEYS */;
INSERT INTO `jc_guestbook` VALUES (1,1,1,1,NULL,'127.0.0.1','2014-07-20 02:07:14',NULL,0,0),(2,1,1,1,NULL,'127.0.0.1','2014-07-20 02:07:38',NULL,0,0);
/*!40000 ALTER TABLE `jc_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook_ctg`
--

DROP TABLE IF EXISTS `jc_guestbook_ctg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook_ctg`
--

LOCK TABLES `jc_guestbook_ctg` WRITE;
/*!40000 ALTER TABLE `jc_guestbook_ctg` DISABLE KEYS */;
INSERT INTO `jc_guestbook_ctg` VALUES (1,1,'普通',1,'普通留言');
/*!40000 ALTER TABLE `jc_guestbook_ctg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook_ext`
--

DROP TABLE IF EXISTS `jc_guestbook_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook_ext`
--

LOCK TABLES `jc_guestbook_ext` WRITE;
/*!40000 ALTER TABLE `jc_guestbook_ext` DISABLE KEYS */;
INSERT INTO `jc_guestbook_ext` VALUES (1,NULL,'aa',NULL,'aa','aa',NULL),(2,'aaa','aa',NULL,NULL,'aaa',NULL);
/*!40000 ALTER TABLE `jc_guestbook_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_job_apply`
--

DROP TABLE IF EXISTS `jc_job_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_job_apply`
--

LOCK TABLES `jc_job_apply` WRITE;
/*!40000 ALTER TABLE `jc_job_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_job_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_keyword`
--

DROP TABLE IF EXISTS `jc_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_keyword`
--

LOCK TABLES `jc_keyword` WRITE;
/*!40000 ALTER TABLE `jc_keyword` DISABLE KEYS */;
INSERT INTO `jc_keyword` VALUES (1,NULL,'内容管理系统','<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>',0);
/*!40000 ALTER TABLE `jc_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_log`
--

DROP TABLE IF EXISTS `jc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_log`
--

LOCK TABLES `jc_log` WRITE;
/*!40000 ALTER TABLE `jc_log` DISABLE KEYS */;
INSERT INTO `jc_log` VALUES (1,1,NULL,1,'2014-06-08 01:09:21','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(3,1,NULL,1,'2014-06-08 01:50:22','192.168.1.104','/jeeadmin/jeecms/login.do','登录成功',NULL),(4,1,NULL,1,'2014-06-08 17:28:44','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(5,1,NULL,1,'2014-06-27 21:11:22','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(6,1,NULL,1,'2014-06-27 21:25:42','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(7,1,NULL,1,'2014-06-28 00:39:11','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(8,1,NULL,1,'2014-06-28 12:40:28','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(10,1,NULL,1,'2014-06-29 13:12:57','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(11,NULL,NULL,2,'2014-06-29 21:12:32','127.0.0.1','/jeeadmin/jeecms/login.do','登录失败','username=admin'),(12,1,NULL,1,'2014-06-29 21:12:40','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(13,1,NULL,1,'2014-07-05 02:49:27','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(14,1,NULL,1,'2014-07-06 02:40:14','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(15,NULL,NULL,2,'2014-07-07 22:42:03','127.0.0.1','/jeeadmin/jeecms/login.do','登录失败','username=admin'),(16,1,NULL,1,'2014-07-07 22:42:12','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(17,NULL,NULL,2,'2014-07-09 01:59:29','127.0.0.1','/jeeadmin/jeecms/login.do','登录失败','username=admin'),(18,NULL,NULL,2,'2014-07-09 01:59:51','127.0.0.1','/jeeadmin/jeecms/login.do','登录失败','username=admin'),(19,1,NULL,1,'2014-07-09 02:00:00','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(20,1,NULL,1,'2014-07-09 02:43:11','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(22,1,NULL,1,'2014-07-09 02:55:33','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(27,1,NULL,1,'2014-07-09 03:56:20','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(28,1,NULL,1,'2014-07-09 05:42:31','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(30,1,NULL,1,'2014-07-10 21:53:45','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(31,1,NULL,1,'2014-07-12 01:38:21','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(32,1,NULL,1,'2014-07-12 01:47:40','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(33,1,NULL,1,'2014-07-13 12:06:04','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(35,1,NULL,1,'2014-07-15 20:59:28','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(36,1,NULL,1,'2014-07-15 21:54:43','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(37,1,NULL,1,'2014-07-15 23:39:11','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(38,1,NULL,1,'2014-07-16 00:15:03','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(39,1,NULL,1,'2014-07-16 00:33:27','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(52,1,NULL,1,'2014-07-16 19:31:04','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(53,1,NULL,1,'2014-07-16 22:01:50','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(55,1,NULL,1,'2014-07-20 00:10:00','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(56,1,NULL,1,'2014-07-20 15:05:04','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(57,1,NULL,1,'2014-07-21 01:22:03','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(58,1,NULL,1,'2014-07-21 15:55:15','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(59,1,NULL,1,'2014-07-21 16:53:26','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(60,1,NULL,1,'2014-07-21 18:57:09','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(61,1,NULL,1,'2014-07-22 08:47:55','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(62,1,NULL,1,'2014-07-29 11:43:41','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(63,1,NULL,1,'2014-07-29 20:59:37','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(64,1,NULL,1,'2014-07-31 20:11:00','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(65,1,NULL,1,'2014-07-31 22:26:35','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(66,1,NULL,1,'2014-08-02 16:18:12','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(67,1,NULL,1,'2014-08-02 20:02:33','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(68,1,NULL,1,'2014-08-02 20:42:12','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(69,1,NULL,1,'2014-08-02 22:12:25','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(164,1,NULL,1,'2014-08-08 21:46:02','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(165,1,NULL,1,'2014-08-12 10:33:05','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(166,1,NULL,1,'2014-08-12 16:42:38','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(167,1,NULL,1,'2014-08-16 19:08:53','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(168,1,NULL,1,'2014-08-17 13:52:44','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(169,1,NULL,1,'2014-08-23 13:17:43','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(170,1,NULL,1,'2014-08-23 16:00:11','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(171,1,NULL,1,'2014-08-23 23:53:12','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(172,1,NULL,1,'2014-08-26 10:29:46','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(174,1,NULL,1,'2014-08-27 11:27:13','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(175,1,NULL,1,'2014-08-27 13:24:11','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(176,1,NULL,1,'2014-08-27 13:34:14','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(177,1,NULL,1,'2014-08-27 17:10:32','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(178,1,NULL,1,'2014-08-28 14:19:55','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(179,1,NULL,1,'2014-08-28 14:31:25','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(180,1,NULL,1,'2014-08-30 11:02:05','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(181,NULL,NULL,2,'2014-08-30 11:02:35','127.0.0.1','/jeeadmin/jeecms/login.do','登录失败','username=admin'),(182,1,NULL,1,'2014-08-30 11:02:41','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(185,1,NULL,1,'2014-08-30 12:20:22','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(278,1,NULL,1,'2014-08-31 09:45:51','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(279,1,NULL,1,'2014-08-31 10:18:15','127.0.0.1','/jeeadmin/jeecms/login.do','登录成功',NULL),(281,1,NULL,1,'2014-09-10 22:55:18','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(282,1,NULL,1,'2014-09-10 22:55:56','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(283,1,NULL,1,'2014-09-18 23:35:05','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(284,1,NULL,1,'2014-09-19 00:52:32','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(285,1,NULL,1,'2014-09-19 03:06:22','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(286,1,NULL,1,'2014-09-19 16:20:40','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(287,1,NULL,1,'2014-09-20 05:11:40','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(288,1,NULL,1,'2014-09-20 09:48:18','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(289,1,NULL,1,'2014-09-20 10:48:55','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(290,1,NULL,1,'2014-10-02 14:58:21','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(307,NULL,NULL,2,'2014-10-02 19:38:02','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录失败','username=admin'),(308,1,NULL,1,'2014-10-02 19:38:10','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(309,1,NULL,1,'2014-10-03 09:23:52','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(310,1,NULL,1,'2014-10-03 20:39:06','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(311,1,NULL,1,'2014-10-04 00:55:50','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(312,1,NULL,1,'2014-10-04 01:43:19','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(313,1,NULL,1,'2014-10-04 12:31:00','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(314,1,NULL,1,'2014-10-04 12:45:51','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(315,1,NULL,1,'2014-10-05 19:52:49','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(316,1,NULL,1,'2014-10-18 11:17:28','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(318,1,NULL,1,'2014-10-19 18:44:47','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(319,1,NULL,1,'2014-10-20 20:25:53','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(320,1,NULL,1,'2014-10-22 14:23:41','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(323,2,NULL,1,'2014-10-22 14:37:59','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(326,1,NULL,1,'2014-10-22 15:30:05','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(329,2,NULL,1,'2014-10-22 15:33:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(330,1,NULL,1,'2014-10-22 15:35:17','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(331,1,NULL,1,'2014-10-22 15:42:22','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(332,2,NULL,1,'2014-10-22 15:42:40','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(333,2,NULL,1,'2014-10-22 15:43:58','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(334,1,NULL,1,'2014-10-22 15:44:12','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(335,1,NULL,1,'2014-10-22 20:21:53','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(338,2,NULL,1,'2014-10-22 20:24:33','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(339,1,NULL,1,'2014-10-22 20:28:53','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(342,2,NULL,1,'2014-10-22 20:30:00','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(343,1,NULL,1,'2014-10-22 20:30:57','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(344,1,NULL,1,'2014-10-22 22:03:50','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(345,1,NULL,1,'2014-10-22 23:34:06','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(346,1,NULL,1,'2014-10-23 14:42:23','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(347,1,NULL,1,'2014-10-23 17:30:50','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(348,1,NULL,1,'2014-10-25 12:44:30','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(349,1,NULL,1,'2014-10-25 20:21:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(350,1,NULL,1,'2014-10-26 20:35:54','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(351,1,NULL,1,'2014-10-26 23:31:08','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(352,1,NULL,1,'2014-10-27 12:32:29','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(353,1,NULL,1,'2014-10-27 18:35:11','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(354,1,NULL,1,'2014-10-28 02:24:06','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(355,1,NULL,1,'2014-10-28 04:04:37','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(356,1,NULL,1,'2014-10-28 07:21:07','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(357,1,NULL,1,'2014-10-28 09:06:05','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(358,1,NULL,1,'2014-10-28 15:02:59','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(359,1,NULL,1,'2014-10-29 00:28:29','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(360,1,NULL,1,'2014-10-29 14:02:24','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(361,1,NULL,1,'2014-10-29 20:31:50','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(362,1,NULL,1,'2014-10-29 21:06:18','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(363,1,NULL,1,'2014-10-30 03:58:09','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(364,1,NULL,1,'2014-10-30 08:50:08','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(366,1,NULL,1,'2014-10-31 08:45:48','192.168.1.100','/xjadmin/xunjian/login.do','登录成功',NULL),(367,1,NULL,1,'2014-10-31 08:50:04','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(368,1,NULL,1,'2014-11-11 18:52:32','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(369,NULL,NULL,2,'2014-11-16 23:42:16','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录失败','username=admin'),(370,1,NULL,1,'2014-11-16 23:42:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(371,1,NULL,1,'2014-11-16 23:49:28','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(373,1,NULL,1,'2014-11-30 14:52:53','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(374,1,NULL,1,'2014-11-30 16:04:37','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(375,1,NULL,1,'2014-12-03 21:09:19','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(376,1,NULL,1,'2014-12-04 01:04:09','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(377,1,NULL,1,'2014-12-04 01:34:27','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(378,1,NULL,1,'2014-12-11 00:47:52','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(379,1,NULL,1,'2014-12-12 20:48:14','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(380,1,NULL,1,'2014-12-13 00:17:44','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(381,1,NULL,1,'2014-12-13 12:00:21','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(382,1,NULL,1,'2014-12-13 12:30:02','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(383,1,NULL,1,'2014-12-13 13:48:59','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(384,1,NULL,1,'2014-12-13 13:54:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(385,1,NULL,1,'2014-12-15 15:49:23','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(398,1,NULL,1,'2014-12-16 19:30:48','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(399,1,NULL,1,'2014-12-17 20:37:01','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(400,1,NULL,1,'2014-12-17 21:56:46','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(401,1,NULL,1,'2014-12-17 21:57:33','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(402,1,NULL,1,'2014-12-18 17:40:52','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(403,1,NULL,1,'2014-12-18 20:11:18','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(404,1,NULL,1,'2014-12-18 20:41:07','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(405,1,NULL,1,'2014-12-18 23:19:31','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(406,1,NULL,1,'2014-12-19 07:56:55','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(407,1,NULL,1,'2014-12-19 07:59:52','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(408,1,NULL,1,'2014-12-19 08:02:41','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(409,1,NULL,1,'2014-12-19 08:18:40','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(410,1,NULL,1,'2014-12-20 18:35:24','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(411,1,NULL,1,'2014-12-21 19:08:18','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(423,1,NULL,1,'2014-12-21 21:28:50','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(424,1,NULL,1,'2014-12-21 22:18:17','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(436,1,NULL,1,'2014-12-22 02:02:14','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(437,1,NULL,1,'2014-12-22 08:01:52','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(438,1,NULL,1,'2014-12-22 11:13:47','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(439,1,NULL,1,'2014-12-22 15:33:28','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(440,1,NULL,1,'2014-12-22 16:05:43','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(441,1,NULL,1,'2014-12-23 08:18:36','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(442,1,NULL,1,'2014-12-23 08:47:15','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(444,1,NULL,1,'2014-12-23 09:46:31','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(445,1,NULL,1,'2014-12-23 23:52:02','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(446,1,NULL,1,'2014-12-24 05:59:53','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(447,1,NULL,1,'2014-12-24 06:29:28','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(448,1,NULL,1,'2014-12-24 06:29:28','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(449,1,NULL,1,'2014-12-24 07:24:15','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(450,1,NULL,1,'2014-12-24 07:44:06','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(451,1,NULL,1,'2014-12-24 07:44:06','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(452,1,NULL,1,'2014-12-24 07:54:29','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(453,1,NULL,1,'2014-12-24 07:54:30','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(455,1,NULL,1,'2014-12-25 08:29:57','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(456,1,NULL,1,'2014-12-25 09:22:21','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(457,1,NULL,1,'2014-12-25 10:01:33','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(458,1,NULL,1,'2014-12-25 10:03:23','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(459,1,NULL,1,'2014-12-25 10:07:33','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(460,1,NULL,1,'2014-12-25 14:16:09','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(465,1,NULL,1,'2014-12-26 08:07:34','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(471,1,NULL,1,'2014-12-29 09:09:34','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(472,NULL,NULL,2,'2014-12-29 14:40:47','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录失败','username=lj'),(474,1,NULL,1,'2014-12-30 07:59:25','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(475,1,NULL,1,'2014-12-30 07:59:25','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(478,NULL,NULL,2,'2014-12-31 07:30:16','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=hw'),(481,1,NULL,1,'2015-01-01 07:45:39','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(482,1,NULL,1,'2015-01-01 10:12:32','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(483,NULL,NULL,2,'2015-01-01 23:00:45','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=lj'),(484,NULL,NULL,2,'2015-01-01 23:00:54','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=lj'),(485,NULL,NULL,2,'2015-01-01 23:02:23','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=admin'),(486,1,NULL,1,'2015-01-01 23:19:29','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(487,1,NULL,1,'2015-01-01 23:33:07','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(488,1,NULL,1,'2015-01-02 06:26:46','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(489,1,NULL,1,'2015-01-02 07:11:03','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(495,1,NULL,1,'2015-01-04 07:10:49','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(496,1,NULL,1,'2015-01-05 07:12:00','127.0.0.1','/xjadmin/xunjian/login.do','登录成功',NULL),(499,1,NULL,1,'2015-01-07 06:35:17','127.0.0.1','/xjadmin/xunjian/login.do','登录成功',NULL),(500,1,NULL,1,'2015-01-07 07:47:38','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(501,1,NULL,1,'2015-01-07 08:00:02','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(503,1,NULL,1,'2015-01-08 07:45:10','192.168.63.81','/xjadmin/xunjian/login.do','登录成功',NULL),(504,NULL,NULL,2,'2015-01-08 15:44:13','127.0.0.1','/xjadmin/xunjian/login.do','登录失败','username=123456'),(509,NULL,NULL,2,'2015-01-11 07:17:31','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录失败','username=123456'),(510,1,NULL,1,'2015-01-11 07:17:41','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(512,1,NULL,1,'2015-01-14 07:33:47','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(513,1,NULL,1,'2015-01-14 08:39:47','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(514,1,NULL,1,'2015-01-14 09:19:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(515,1,NULL,1,'2015-01-14 09:19:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(516,1,NULL,1,'2015-01-15 06:42:09','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(519,1,NULL,1,'2015-01-16 05:37:41','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(521,1,NULL,1,'2015-01-17 08:09:03','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(525,1,NULL,1,'2015-01-19 07:12:56','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(527,1,NULL,1,'2015-01-20 07:27:35','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(533,1,NULL,1,'2015-01-22 05:41:15','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(534,1,NULL,1,'2015-01-22 05:59:29','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(535,NULL,NULL,2,'2015-01-23 06:10:58','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=123456'),(536,1,NULL,1,'2015-01-23 06:11:13','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(537,1,NULL,1,'2015-01-23 09:26:28','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(538,1,NULL,1,'2015-01-23 09:26:28','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(543,1,NULL,1,'2015-01-25 07:39:58','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(551,1,NULL,1,'2015-02-01 07:49:54','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(553,1,NULL,1,'2015-02-03 07:34:59','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(555,1,NULL,1,'2015-02-04 07:39:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(561,1,NULL,1,'2015-02-10 07:07:35','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(564,NULL,NULL,2,'2015-02-11 15:01:21','192.168.63.83','/xjadmin/xunjian/login.do','登录失败','username=lq'),(566,1,NULL,1,'2015-02-13 08:24:47','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(567,1,NULL,1,'2015-02-13 08:26:31','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(568,1,NULL,1,'2015-02-13 08:33:55','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(569,1,NULL,1,'2015-02-13 08:56:57','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(570,1,NULL,1,'2015-02-13 09:24:08','192.168.63.83','/xjadmin/xunjian/login.do','登录成功',NULL),(574,1,NULL,1,'2015-04-04 19:29:34','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(575,1,NULL,1,'2015-04-04 19:40:03','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(576,1,NULL,1,'2015-04-06 01:20:01','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(577,1,NULL,1,'2015-04-07 01:54:14','192.168.1.101','/xjadmin/xunjian/login.do','登录成功',NULL),(578,1,NULL,1,'2015-04-07 18:23:36','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(579,1,NULL,1,'2015-04-07 20:55:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(580,1,NULL,1,'2015-04-07 22:09:35','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(581,1,NULL,1,'2015-04-07 23:51:27','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(583,1,NULL,1,'2015-04-08 00:37:15','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(584,1,NULL,1,'2015-04-08 01:59:01','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(586,1,NULL,1,'2015-04-09 21:32:23','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(589,1,NULL,1,'2015-04-10 01:37:59','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(590,1,NULL,1,'2015-04-10 01:50:54','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(597,1,NULL,1,'2015-04-10 03:03:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(598,1,NULL,1,'2016-03-13 19:37:56','127.0.0.1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(599,1,NULL,1,'2016-03-13 19:42:36','127.0.0.1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(600,1,NULL,1,'2016-03-15 21:08:49','127.0.0.1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(601,1,NULL,1,'2016-03-15 23:28:53','127.0.0.1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(602,1,NULL,1,'2016-03-18 00:42:32','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(603,1,NULL,1,'2016-03-18 00:50:54','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(604,1,NULL,1,'2016-03-19 10:09:11','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(605,1,1,3,'2016-03-19 11:30:09','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/template/o_delete_single.do','删除模板','filename=/WEB-INF/t_d/www/.DS_Store'),(606,1,NULL,1,'2016-03-19 14:18:14','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(607,1,1,3,'2016-03-19 14:45:09','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/data/o_delete_single.do','删除资源','filename=/WEB-INF/backup/20141219081304.sql'),(608,1,NULL,1,'2016-03-19 21:39:20','0:0:0:0:0:0:0:1','/xunjian/xjadmin/xunjian/login.do','登录成功',NULL),(609,1,NULL,1,'2016-03-19 22:52:28','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(610,1,NULL,1,'2016-03-22 19:41:07','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(611,1,NULL,1,'2016-03-22 20:34:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(612,1,NULL,1,'2016-03-22 20:41:07','192.168.1.106','/xjadmin/xunjian/login.do','登录成功',NULL),(613,1,NULL,1,'2016-03-22 21:49:02','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(614,1,NULL,1,'2016-03-23 08:38:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(615,1,NULL,1,'2016-03-23 08:43:23','192.168.0.101','/xjadmin/xunjian/login.do','登录成功',NULL),(616,1,NULL,1,'2016-03-23 08:44:33','192.168.0.100','/xjadmin/xunjian/login.do','登录成功',NULL),(617,1,NULL,1,'2016-03-23 10:26:59','192.168.0.100','/xjadmin/xunjian/login.do','登录成功',NULL),(618,1,NULL,1,'2016-03-24 08:42:59','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(619,1,NULL,1,'2016-04-19 21:24:07','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(620,1,NULL,1,'2016-04-20 22:30:25','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(621,NULL,NULL,2,'2016-04-23 18:59:35','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录失败','username=admin'),(622,1,NULL,1,'2016-04-23 18:59:42','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(623,1,NULL,1,'2016-09-03 18:01:01','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(624,1,NULL,1,'2016-09-10 14:43:04','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(625,1,NULL,1,'2016-09-10 16:34:07','0:0:0:0:0:0:0:1','/xjadmin/xunjian/login.do','登录成功',NULL),(626,1,NULL,1,'2016-10-01 22:50:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(627,1,NULL,1,'2016-10-02 09:27:37','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(628,1,NULL,1,'2016-10-02 09:40:46','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(629,1,NULL,1,'2016-10-02 09:59:34','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(630,1,NULL,1,'2016-10-02 15:29:33','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(631,1,NULL,1,'2016-10-02 16:08:12','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(632,1,NULL,1,'2016-10-02 23:14:49','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(633,1,NULL,1,'2016-10-03 22:01:20','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(634,1,NULL,1,'2016-10-05 15:45:32','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(636,2,NULL,1,'2016-10-06 07:04:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(637,1,NULL,1,'2016-10-06 07:04:43','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(638,1,1,3,'2016-10-06 07:05:18','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=31;username=zjw'),(640,1,NULL,1,'2016-10-06 07:06:06','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(641,1,NULL,1,'2016-10-06 07:12:25','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(642,1,1,3,'2016-10-06 08:14:22','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=31;username=zjw'),(643,1,1,3,'2016-10-06 08:19:54','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=32;username=test'),(644,1,NULL,1,'2016-10-06 08:48:35','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(645,1,1,3,'2016-10-06 08:48:56','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=32;username=test'),(646,1,1,3,'2016-10-06 08:49:06','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=32;username=test'),(647,1,1,3,'2016-10-06 08:49:45','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=33;username=test'),(648,1,1,3,'2016-10-06 08:51:47','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=33;username=test'),(649,1,1,3,'2016-10-06 08:53:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=34;username=test'),(650,1,NULL,1,'2016-10-06 08:56:53','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(651,1,1,3,'2016-10-06 09:13:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=34;username=test'),(652,1,1,3,'2016-10-06 09:13:55','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=31;username=zjw'),(653,1,1,3,'2016-10-06 09:14:44','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=34;username=test'),(654,1,1,3,'2016-10-06 09:17:38','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=34;username=test'),(655,1,1,3,'2016-10-06 09:18:18','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=35;username=ttt'),(656,1,NULL,1,'2016-10-06 19:46:21','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(657,1,NULL,1,'2016-10-07 09:28:28','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(658,1,NULL,1,'2016-10-07 10:10:28','0:0:0:0:0:0:0:1','/xunjian-web/user_api/login.jspx','登录成功',NULL),(659,1,NULL,1,'2016-11-05 14:37:49','0:0:0:0:0:0:0:1','/xunjian-web/user_info/login.jspx','登录成功',NULL),(660,1,NULL,1,'2016-11-05 14:39:27','0:0:0:0:0:0:0:1','/xunjian-web/user_info/login.jspx','登录成功',NULL),(664,1,NULL,1,'2016-11-05 14:43:21','0:0:0:0:0:0:0:1','/xunjian-web/user_info/login.jspx','登录成功',NULL),(665,1,NULL,1,'2016-11-05 14:43:48','0:0:0:0:0:0:0:1','/xunjian-web/user_info/login.jspx','登录成功',NULL),(666,1,NULL,1,'2016-11-05 14:44:12','0:0:0:0:0:0:0:1','/xunjian-web/user_info/login.jspx','登录成功',NULL),(667,1,NULL,1,'2016-11-05 21:37:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(668,1,1,3,'2016-11-05 21:38:24','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=35;username=ttt'),(669,1,1,3,'2016-11-05 21:38:31','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=51;username=test2'),(670,1,1,3,'2016-11-05 21:45:56','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=54;username=test11'),(671,1,1,3,'2016-11-05 21:53:41','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_update.do','修改用户','id=54;username=test11'),(672,1,1,3,'2016-11-05 22:39:29','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_login_update.do','修改登录设置',NULL),(673,1,1,3,'2016-11-05 22:39:47','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_member_update.do','修改会员设置',NULL),(674,1,1,3,'2016-11-05 22:42:56','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_login_update.do','修改登录设置',NULL),(675,NULL,NULL,2,'2016-11-05 22:43:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录失败','username=ttt'),(677,1,1,3,'2016-11-05 22:45:34','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_mark_update.do','修改水印设置',NULL),(678,1,1,3,'2016-11-05 22:45:39','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_mark_update.do','修改水印设置',NULL),(679,1,NULL,1,'2016-11-05 23:56:01','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(680,1,1,3,'2016-11-06 00:01:30','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=46;username=test1'),(681,1,1,3,'2016-11-06 00:10:50','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=26;username=ycz'),(682,1,1,3,'2016-11-06 00:11:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=23;username=fwy'),(683,1,NULL,1,'2016-11-06 00:12:26','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(684,1,1,3,'2016-11-06 00:13:05','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=21;username=sl'),(685,1,NULL,1,'2016-11-06 14:49:25','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(686,1,1,3,'2016-11-06 21:23:52','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/config/o_login_update.do','修改登录设置',NULL),(687,1,NULL,1,'2016-11-08 21:57:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(688,1,NULL,1,'2016-11-15 21:49:38','127.0.0.1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(689,1,1,3,'2016-11-15 22:13:34','127.0.0.1','/xunjian-web/xjadmin/xunjian/template/o_save.do','增加模板','filename=test'),(690,1,NULL,1,'2016-11-19 18:40:24','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(691,1,NULL,1,'2016-11-19 23:17:31','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(692,1,NULL,1,'2016-11-20 00:07:03','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(693,1,1,3,'2016-11-20 01:18:37','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=13;username=gyq'),(694,1,1,3,'2016-11-20 01:18:50','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=12;username=gl'),(695,1,1,3,'2016-11-20 01:18:58','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=10;username=xt'),(696,1,1,3,'2016-11-20 01:19:07','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=8;username=zr'),(697,1,1,3,'2016-11-20 01:21:27','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=11;username=gx'),(698,1,1,3,'2016-11-20 01:27:17','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=27;username=hw'),(699,1,1,3,'2016-11-20 01:27:45','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=7;username=mj'),(700,1,1,3,'2016-11-20 01:58:52','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=31;username=zjw'),(701,1,1,3,'2016-11-20 01:58:57','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=19;username=wjj'),(702,1,1,3,'2016-11-20 01:59:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=28;username=lzz'),(703,1,1,3,'2016-11-20 01:59:07','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=24;username=lq'),(704,1,1,3,'2016-11-20 01:59:20','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=54;username=test11'),(705,1,1,3,'2016-11-20 01:59:26','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=40;username=test'),(706,1,1,3,'2016-11-20 01:59:37','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=25;username=ww'),(707,1,1,3,'2016-11-20 02:28:42','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=30;username=zbj'),(708,1,1,3,'2016-11-20 02:28:45','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=29;username=gbm'),(709,1,1,3,'2016-11-20 02:28:48','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=22;username=gyt'),(710,1,1,3,'2016-11-20 02:28:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=20;username=yqf'),(711,1,1,3,'2016-11-20 02:28:54','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=18;username=tqe'),(712,1,1,3,'2016-11-20 02:28:59','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=17;username=ljw'),(713,1,1,3,'2016-11-20 02:29:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=16;username=lw'),(714,1,1,3,'2016-11-20 02:29:08','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=15;username=nls'),(715,1,1,3,'2016-11-20 02:29:11','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=14;username=lp'),(716,1,1,3,'2016-11-20 02:29:14','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=9;username=lxw'),(717,1,1,3,'2016-11-20 02:29:17','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=6;username=lj'),(718,1,1,3,'2016-11-20 02:29:20','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=5;username=ps'),(719,1,1,3,'2016-11-20 02:29:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=4;username=lc'),(720,1,1,3,'2016-11-20 02:29:26','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/admin_global/o_delete.do','删除用户','id=3;username=zhjd'),(721,1,1,3,'2016-11-20 02:29:41','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/role/o_delete.do','删除角色','id=6;name=绞车司机'),(722,1,1,3,'2016-11-20 02:29:58','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/role/o_delete.do','删除角色','id=5;name=电工'),(723,1,NULL,1,'2016-11-20 11:58:33','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(724,1,1,3,'2016-11-20 11:59:43','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/role/o_delete.do','删除角色','id=4;name=钳工'),(725,1,NULL,1,'2016-11-20 13:27:45','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(726,1,NULL,1,'2016-11-20 18:03:29','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(727,1,NULL,1,'2016-11-20 18:52:12','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(728,1,NULL,1,'2016-12-06 12:15:34','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(729,1,NULL,1,'2016-12-06 22:17:47','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(730,1,1,3,'2016-12-06 22:40:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(731,1,1,3,'2016-12-06 22:40:36','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(732,1,1,3,'2016-12-06 22:51:37','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(733,1,1,3,'2016-12-06 22:51:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(734,1,1,3,'2016-12-06 22:55:47','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(735,1,1,3,'2016-12-06 22:57:50','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(736,1,1,3,'2016-12-06 23:33:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(737,1,NULL,1,'2016-12-07 09:05:13','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(738,1,1,3,'2016-12-07 09:33:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(739,1,1,3,'2016-12-07 09:33:27','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(740,1,1,3,'2016-12-07 09:33:47','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(741,1,1,3,'2016-12-07 09:35:53','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/首页.html'),(742,1,1,3,'2016-12-07 09:36:16','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/首页.html'),(743,1,1,3,'2016-12-07 09:39:49','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(744,1,1,3,'2016-12-07 09:40:01','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(745,1,1,3,'2016-12-07 09:40:35','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(746,1,1,3,'2016-12-07 09:41:24','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(747,1,1,3,'2016-12-07 09:43:36','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(748,1,1,3,'2016-12-07 10:02:03','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(749,1,1,3,'2016-12-07 10:30:18','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(750,1,1,3,'2016-12-07 10:35:35','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(751,1,1,3,'2016-12-07 10:39:04','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(752,1,1,3,'2016-12-07 10:39:57','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(753,1,NULL,1,'2016-12-07 15:36:20','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(754,1,1,3,'2016-12-07 15:39:11','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(755,1,1,3,'2016-12-07 15:43:44','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(756,1,1,3,'2016-12-07 15:44:02','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(757,1,1,3,'2016-12-07 15:45:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/首页.html'),(758,1,1,3,'2016-12-07 15:46:17','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(759,1,NULL,1,'2016-12-07 19:49:00','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(760,1,1,3,'2016-12-07 19:57:54','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(761,1,1,3,'2016-12-07 19:58:32','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(762,1,1,3,'2016-12-07 20:00:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(763,1,1,3,'2016-12-07 20:04:24','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(764,1,1,3,'2016-12-07 20:06:06','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(765,1,1,3,'2016-12-07 20:06:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(766,1,1,3,'2016-12-07 20:17:54','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(767,1,1,3,'2016-12-07 20:18:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(768,1,1,3,'2016-12-07 20:20:12','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(769,1,1,3,'2016-12-07 20:21:58','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(770,1,1,3,'2016-12-07 20:23:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(771,1,1,3,'2016-12-07 20:24:01','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(772,1,1,3,'2016-12-07 21:12:05','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(773,1,1,3,'2016-12-07 21:12:20','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_update.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(774,1,1,3,'2016-12-07 21:12:31','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(775,1,1,3,'2016-12-07 21:13:19','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/首页.html'),(776,1,1,3,'2016-12-07 21:24:37','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(777,1,1,3,'2016-12-07 21:25:05','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(778,1,1,3,'2016-12-07 21:30:57','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(779,1,NULL,1,'2016-12-08 09:24:28','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(780,1,NULL,1,'2016-12-09 16:33:22','172.22.16.118','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(781,1,NULL,1,'2016-12-09 16:36:22','172.22.16.99','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(782,1,NULL,1,'2016-12-09 16:57:24','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(783,1,NULL,1,'2016-12-09 17:38:09','172.22.14.51','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(784,1,NULL,1,'2016-12-10 23:17:23','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(785,1,NULL,1,'2016-12-11 11:51:13','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(786,1,1,3,'2016-12-11 12:06:00','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(787,1,1,3,'2016-12-11 12:07:18','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(788,1,1,3,'2016-12-11 12:09:35','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(789,1,1,3,'2016-12-11 12:11:29','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(790,1,1,3,'2016-12-11 12:15:52','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(791,1,1,3,'2016-12-11 12:24:16','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(792,1,1,3,'2016-12-11 12:24:34','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(793,1,1,3,'2016-12-11 12:25:53','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(794,1,1,3,'2016-12-11 12:26:54','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(795,1,1,3,'2016-12-11 12:27:38','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(796,1,1,3,'2016-12-11 12:28:38','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(797,1,1,3,'2016-12-11 12:29:42','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(798,1,1,3,'2016-12-11 12:34:51','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(799,1,1,3,'2016-12-11 12:36:07','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(800,1,NULL,1,'2016-12-19 13:40:26','192.168.17.29','/xunjianweb/xjadmin/xunjian/login.do','登录成功',NULL),(801,1,1,3,'2016-12-19 13:55:06','192.168.17.29','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/1.html'),(802,1,NULL,1,'2016-12-19 14:06:01','10.101.20.152','/xunjianweb/xjadmin/xunjian/login.do','登录成功',NULL),(803,NULL,NULL,2,'2016-12-19 14:30:37','10.101.21.154','/xunjianweb/user_info/login.jspx','登录失败','username=emsadmin'),(804,1,NULL,1,'2016-12-19 14:30:55','10.101.21.154','/xunjianweb/xjadmin/xunjian/login.do','登录成功',NULL),(805,1,1,3,'2016-12-19 14:57:11','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/1.html'),(806,1,1,3,'2016-12-19 14:57:15','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/1.html'),(807,1,1,3,'2016-12-19 16:09:48','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/10.html'),(808,1,1,3,'2016-12-19 16:11:23','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/2.html'),(809,1,1,3,'2016-12-19 16:12:20','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/3.html'),(810,1,1,3,'2016-12-19 16:13:34','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/4.html'),(811,1,1,3,'2016-12-19 16:14:54','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/5.html'),(812,1,1,3,'2016-12-19 16:16:14','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/6.html'),(813,1,1,3,'2016-12-19 16:17:49','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/7.html'),(814,1,1,3,'2016-12-19 16:18:46','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/8.html'),(815,1,1,3,'2016-12-19 16:20:48','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(816,1,1,3,'2016-12-19 16:20:51','10.101.21.154','/xunjianweb/xjadmin/xunjian/template/o_ajaxUpdate.do','修改模板','filename=/WEB-INF/xj_sys/www/9.html'),(817,1,1,3,'2016-12-19 16:26:08','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=4;name=公司领导'),(818,1,1,3,'2016-12-19 16:26:43','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=5;name=运营管理部'),(819,1,1,3,'2016-12-19 16:27:30','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=6;name=焊装车间'),(820,1,1,3,'2016-12-19 16:27:56','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=7;name=涂装车间'),(821,1,1,3,'2016-12-19 16:28:17','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=8;name=总装车间'),(822,1,1,3,'2016-12-19 16:28:38','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=9;name=试验检测中心'),(823,1,1,3,'2016-12-19 16:28:56','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_save.do','增加角色','id=10;name=物流中心'),(824,1,1,3,'2016-12-19 16:29:20','10.101.21.154','/xunjianweb/xjadmin/xunjian/role/o_delete.do','删除角色','id=3;name=起重工'),(825,1,1,3,'2016-12-19 16:30:08','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=3;username=20030092'),(826,1,1,3,'2016-12-19 16:30:46','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=4;username=20100422'),(827,1,1,3,'2016-12-19 16:31:23','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=5;username=20070525'),(828,1,1,3,'2016-12-19 16:31:54','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=6;username=20110192'),(829,1,1,3,'2016-12-19 16:32:30','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=7;username=20131829'),(830,1,1,3,'2016-12-19 16:33:05','10.101.21.154','/xunjianweb/xjadmin/xunjian/admin_global/o_save.do','增加用户','id=8;username=20070498'),(831,NULL,NULL,2,'2016-12-19 18:14:18','10.101.20.152','/xunjianweb/user_info/login.jspx','登录失败','username=emsadmin'),(832,1,NULL,1,'2016-12-19 18:14:31','10.101.20.152','/xunjianweb/xjadmin/xunjian/login.do','登录成功',NULL),(833,1,NULL,1,'2016-12-19 21:02:36','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(834,1,NULL,1,'2016-12-21 20:07:48','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(835,1,NULL,1,'2016-12-21 23:45:07','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL),(836,1,NULL,1,'2016-12-22 02:38:05','0:0:0:0:0:0:0:1','/xunjian-web/xjadmin/xunjian/login.do','登录成功',NULL);
/*!40000 ALTER TABLE `jc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_message`
--

DROP TABLE IF EXISTS `jc_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站内信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_message`
--

LOCK TABLES `jc_message` WRITE;
/*!40000 ALTER TABLE `jc_message` DISABLE KEYS */;
INSERT INTO `jc_message` VALUES (1,'aa','aaaa','2014-07-16 14:09:53',1,1,1,0,1);
/*!40000 ALTER TABLE `jc_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_model`
--

DROP TABLE IF EXISTS `jc_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_model`
--

LOCK TABLES `jc_model` WRITE;
/*!40000 ALTER TABLE `jc_model` DISABLE KEYS */;
INSERT INTO `jc_model` VALUES (1,'新闻','1','新闻栏目','新闻内容',139,139,310,310,1,1,0,1),(2,'单页','2','单页','',139,139,310,310,2,0,0,0),(3,'作品','3','作品栏目','作品内容',139,139,310,310,3,1,0,0),(4,'下载','4','下载栏目','下载内容',139,139,310,310,4,1,0,0),(5,'图库','5','图库栏目','图库内容',139,139,310,310,5,1,0,0),(6,'视频','6','视频栏目','视频内容',139,139,310,310,10,1,0,0),(7,'产品','7','产品栏目','产品内容',139,139,310,310,10,1,0,0),(8,'招聘','job','招聘栏目','招聘内容',139,139,310,310,10,1,0,0);
/*!40000 ALTER TABLE `jc_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_model_item`
--

DROP TABLE IF EXISTS `jc_model_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_model_item`
--

LOCK TABLES `jc_model_item` WRITE;
/*!40000 ALTER TABLE `jc_model_item` DISABLE KEYS */;
INSERT INTO `jc_model_item` VALUES (1,1,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(2,1,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(3,1,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(4,1,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(5,1,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(6,1,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(7,1,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(8,1,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(9,1,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(10,1,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(11,1,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(12,1,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(13,1,'finalStep','终审级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(14,1,'afterCheck','审核后',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(15,1,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(16,1,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(17,1,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(18,1,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(19,1,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(20,1,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(21,1,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(22,1,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(23,1,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(24,1,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(25,1,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(26,1,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(27,1,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(28,1,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(29,1,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(30,1,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1),(31,1,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(32,1,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(33,1,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(34,1,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(35,1,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(36,1,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(37,1,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(38,1,'attachments','附件',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(39,1,'media','多媒体',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(40,1,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(42,2,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(43,2,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(44,2,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(45,2,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(46,2,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(47,2,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(48,2,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(49,2,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(50,2,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(51,2,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(52,2,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(53,2,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(54,3,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(55,3,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(56,3,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(57,3,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(58,3,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(59,3,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(60,3,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(61,3,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(62,3,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(63,3,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(64,3,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(65,3,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(66,3,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(67,3,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(68,3,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(69,3,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(70,3,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(73,3,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(74,3,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(75,3,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(76,3,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(77,3,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(78,3,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(79,3,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(80,3,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(81,3,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1),(82,3,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(83,3,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(84,3,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(85,3,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(86,3,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(87,3,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(88,3,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(89,3,'attachments','附件',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(90,3,'media','多媒体',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(91,3,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(92,3,'pictures','图片集',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(93,4,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(94,4,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(95,4,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(96,4,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(97,4,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(98,4,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(99,4,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(100,4,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(101,4,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(102,4,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(103,4,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(104,4,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(105,4,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(106,4,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(107,4,'channelId','栏目',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(108,4,'title','软件名称',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(109,4,'shortTitle','软件简称',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(110,4,'titleColor','标题颜色',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(111,4,'description','摘要',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(112,4,'author','发布人',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(113,4,'viewGroupIds','浏览权限',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,0,0,1),(114,4,'topLevel','固顶级别',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(115,4,'releaseDate','发布时间',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(116,4,'typeId','内容类型',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(117,4,'tplContent','指定模板',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(118,4,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(119,4,'attachments','资源上传',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(120,4,'txt','软件介绍',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(121,4,'softType','软件类型',12,'国产软件','国产软件,国外软件','100','3','30',NULL,NULL,6,0,0,1,1),(122,4,'warrant','软件授权',13,'免费版','免费版,共享版','','3','30','','',6,0,0,1,1),(123,4,'relatedLink','相关链接',14,'http://','','50','3','30','','',1,0,0,1,1),(124,4,'demoUrl','演示地址',15,'http://',NULL,'60','3','30',NULL,NULL,1,0,0,1,1),(125,5,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(126,5,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(127,5,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(128,5,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(129,5,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(130,5,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(131,5,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(132,5,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(133,5,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(134,5,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(135,5,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(136,5,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(137,5,'finalStep','终审级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(138,5,'afterCheck','审核后',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(139,5,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(140,5,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(141,5,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(142,5,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(143,5,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(144,5,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(145,5,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(146,5,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(147,5,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(148,5,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(149,5,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(150,5,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(151,5,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(152,5,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(153,5,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(154,5,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(155,5,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1),(156,5,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(157,5,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(158,5,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(159,5,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(160,5,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(161,5,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(162,5,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(163,5,'pictures','图片集',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(164,6,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(165,6,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(166,6,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(167,6,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(168,6,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(169,6,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(170,6,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(171,6,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(172,6,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(173,6,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(174,6,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(175,6,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(176,6,'finalStep','终审级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(177,6,'afterCheck','审核后',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(178,6,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(179,6,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(180,6,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(181,6,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(182,6,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(183,6,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(184,6,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(185,6,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(186,6,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(187,6,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(188,6,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(189,6,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(190,6,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(191,6,'description','内容简介',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(192,6,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,0),(193,6,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,0),(194,6,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1),(195,6,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(196,6,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(197,6,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(198,6,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(199,6,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(200,6,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(201,6,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(202,6,'attachments','附件',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,0),(203,6,'media','多媒体',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(204,7,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(205,7,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(206,7,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(207,7,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(208,7,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(209,7,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(210,7,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(211,7,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(212,7,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(213,7,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(214,7,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(215,7,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(216,7,'finalStep','终审级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(217,7,'afterCheck','审核后',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(218,7,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(219,7,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(220,7,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(221,7,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(222,7,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(223,7,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(224,7,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(225,7,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(226,7,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(227,7,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(228,7,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(229,7,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(230,7,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(231,7,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(232,7,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(233,7,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1),(234,7,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1),(235,7,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(236,7,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(237,7,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(238,7,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(239,7,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(240,7,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(241,7,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(242,7,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(243,7,'marketprice','市场价',10,NULL,NULL,NULL,'3','30',NULL,NULL,3,1,0,1,1),(244,7,'price','价格',10,NULL,NULL,NULL,'3','30',NULL,NULL,3,1,0,1,1),(246,4,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(248,7,'txt1','内容1',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(249,8,'name','栏目名称',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(250,8,'path','访问路径',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(251,8,'title','meta标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(252,8,'keywords','meta关键字',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1),(253,8,'description','meta描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(254,8,'tplChannel','栏目模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(255,8,'tplContent','内容模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(256,8,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(257,8,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1),(258,8,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(259,8,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(260,8,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1),(261,8,'finalStep','终审级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1),(262,8,'afterCheck','审核后',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1),(263,8,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(264,8,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1),(265,8,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(266,8,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1),(267,8,'userIds','管理权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1),(268,8,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(269,8,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(270,8,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1),(271,8,'channelId','栏目',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1),(272,8,'title','岗位名称',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(275,8,'tagStr','Tag标签',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1),(279,8,'viewGroupIds','浏览权限',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,0,0,1),(280,8,'topLevel','固顶级别',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(281,8,'releaseDate','发布时间',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1),(282,8,'typeId','内容类型',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(283,8,'tplContent','指定模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1),(289,8,'txt','职位描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1),(290,8,'deadline','截止日期',2,NULL,NULL,NULL,'3','30','留空永久有效',NULL,5,0,0,1,1),(291,8,'experience','工作经验',3,NULL,'1年以内,1年以上,2年以上,3年以上,4年以上,5年以上,不限',NULL,'3','30',NULL,NULL,6,0,0,1,1),(292,8,'education','最低学历',3,'','专科,本科,硕士,不限','','3','30','','',6,0,0,1,1),(293,8,'salary','职位月薪',4,NULL,'2000-3000,3000-5000,4000-6000,5000-7000,6000-8000,8000+,面议',NULL,'3','30',NULL,NULL,6,0,0,1,1),(294,8,'workplace','工作地点',4,'','北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌','','3','30','','',7,0,0,1,1),(295,8,'nature','工作性质',5,'','全职,兼职','','3','30','','',8,0,0,1,1),(296,8,'hasmanage','管理经验',5,'','要求,不要求','','3','30','','',8,0,0,1,1),(297,8,'nums','招聘人数',6,'','1-3人,3-5人,5-10人,若干','','3','30','','',6,0,0,1,1),(298,8,'category','职位类别',6,NULL,'项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持',NULL,'3','30',NULL,NULL,6,0,0,1,1),(299,6,'Director','导演',10,NULL,NULL,NULL,'1','2',NULL,NULL,1,0,0,1,1),(300,6,'Starring','主演',10,NULL,NULL,NULL,'1','30',NULL,'2',1,0,0,1,1),(301,6,'VideoType','视频类型',70,NULL,'历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚',NULL,'3','30',NULL,NULL,7,0,0,1,1),(302,6,'Video','影片信息',70,NULL,'正片,预告片',NULL,'3','30',NULL,NULL,6,0,0,1,1);
/*!40000 ALTER TABLE `jc_model_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_receiver_message`
--

DROP TABLE IF EXISTS `jc_receiver_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='站内信收信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_receiver_message`
--

LOCK TABLES `jc_receiver_message` WRITE;
/*!40000 ALTER TABLE `jc_receiver_message` DISABLE KEYS */;
INSERT INTO `jc_receiver_message` VALUES (1,'aa','aaaa','2014-07-15 18:35:46',1,1,1,1,0,NULL),(2,'aa','aaaa','2014-07-15 18:35:46',1,1,1,0,3,NULL),(3,'aa','aaaa','2014-07-16 14:09:53',1,1,1,1,0,1);
/*!40000 ALTER TABLE `jc_receiver_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_role`
--

DROP TABLE IF EXISTS `jc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_role`
--

LOCK TABLES `jc_role` WRITE;
/*!40000 ALTER TABLE `jc_role` DISABLE KEYS */;
INSERT INTO `jc_role` VALUES (1,NULL,'管理员',10,'1'),(2,NULL,'巡检管理员',10,'0'),(4,NULL,'公司领导',10,'0'),(5,NULL,'运营管理部',10,'0'),(6,NULL,'焊装车间',10,'0'),(7,NULL,'涂装车间',10,'0'),(8,NULL,'总装车间',10,'0'),(9,NULL,'试验检测中心',10,'0'),(10,NULL,'物流中心',10,'0');
/*!40000 ALTER TABLE `jc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_role_permission`
--

DROP TABLE IF EXISTS `jc_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_role_permission`
--

LOCK TABLES `jc_role_permission` WRITE;
/*!40000 ALTER TABLE `jc_role_permission` DISABLE KEYS */;
INSERT INTO `jc_role_permission` VALUES (2,'/top.do'),(2,'/right.do'),(2,'/main.do'),(2,'/left.do'),(2,'/personal/'),(2,'/index.do'),(2,'/report/'),(2,'/contents/'),(2,'/message/v_countUnreadMsg.do'),(2,'/content/o_generateTags.do'),(2,'/map.do'),(1,'/top.do'),(1,'/right.do'),(1,'/message/v_countUnreadMsg.do，/contents/v_pic.do'),(1,'/main.do'),(1,'/left.do'),(1,'/index.do'),(1,'/content/o_generateTags.do'),(1,'/map.do'),(4,'/map.do'),(4,'/role/'),(4,'/content/o_generateTags.do'),(4,'/frame/user'),(4,'/left.do'),(4,'/message/v_countUnreadMsg.do'),(4,'/frame/manager'),(4,'/main.do'),(4,'/contents/'),(4,'/index.do'),(4,'/admin_local/'),(4,'/message/'),(4,'/log/'),(4,'/top.do'),(4,'/personal/'),(4,'/right.do'),(4,'/contents/v_pic.do'),(4,'/admin_global/'),(4,'/point/'),(5,'/map.do'),(5,'/role/'),(5,'/event/'),(5,'/template/v_tree.do'),(5,'/template/o_delete_single.do'),(5,'/main.do'),(5,'/index.do'),(5,'/item_group/'),(5,'/admin_local/'),(5,'/log/'),(5,'/template/o_create_dir.do'),(5,'/template/o_def_template.do'),(5,'/contents/v_pic.do'),(5,'/template/o_update.do'),(5,'/admin_global/'),(5,'/template/o_swfupload.do'),(5,'/content/o_generateTags.do'),(5,'/frame/user'),(5,'/template/v_rename.do'),(5,'/left.do'),(5,'/message/v_countUnreadMsg.do'),(5,'/frame/manager'),(5,'/template/o_rename.do'),(5,'/template/o_delete.do'),(5,'/template/o_export.do'),(5,'/template/o_save.do'),(5,'/contents/'),(5,'/message/'),(5,'/template/v_list.do'),(5,'/cycle/'),(5,'/template/v_add.do'),(5,'/top.do'),(5,'/personal/'),(5,'/template/o_import.do'),(5,'/template/v_left.do'),(5,'/right.do'),(5,'/template/v_setting.do'),(5,'/templet/'),(5,'/template/v_edit.do'),(5,'/point/'),(5,'/frame/template'),(6,'/map.do'),(6,'/role/'),(6,'/content/o_generateTags.do'),(6,'/frame/user'),(6,'/left.do'),(6,'/message/v_countUnreadMsg.do'),(6,'/event/'),(6,'/frame/manager'),(6,'/main.do'),(6,'/contents/'),(6,'/index.do'),(6,'/item_group/'),(6,'/log/'),(6,'/top.do'),(6,'/personal/'),(6,'/right.do'),(6,'/contents/v_pic.do'),(6,'/point/'),(7,'/map.do'),(7,'/role/'),(7,'/content/o_generateTags.do'),(7,'/frame/user'),(7,'/left.do'),(7,'/message/v_countUnreadMsg.do'),(7,'/event/'),(7,'/frame/manager'),(7,'/main.do'),(7,'/contents/'),(7,'/index.do'),(7,'/item_group/'),(7,'/log/'),(7,'/cycle/'),(7,'/top.do'),(7,'/personal/'),(7,'/right.do'),(7,'/contents/v_pic.do'),(7,'/templet/'),(7,'/point/'),(8,'/map.do'),(8,'/role/'),(8,'/content/o_generateTags.do'),(8,'/frame/user'),(8,'/left.do'),(8,'/message/v_countUnreadMsg.do'),(8,'/event/'),(8,'/frame/manager'),(8,'/main.do'),(8,'/contents/'),(8,'/index.do'),(8,'/item_group/'),(8,'/log/'),(8,'/top.do'),(8,'/personal/'),(8,'/right.do'),(8,'/contents/v_pic.do'),(8,'/templet/'),(8,'/point/'),(9,'/map.do'),(9,'/role/'),(9,'/content/o_generateTags.do'),(9,'/frame/user'),(9,'/left.do'),(9,'/message/v_countUnreadMsg.do'),(9,'/event/'),(9,'/frame/manager'),(9,'/main.do'),(9,'/contents/'),(9,'/index.do'),(9,'/item_group/'),(9,'/log/'),(9,'/top.do'),(9,'/personal/'),(9,'/right.do'),(9,'/contents/v_pic.do'),(9,'/point/'),(10,'/map.do'),(10,'/role/'),(10,'/content/o_generateTags.do'),(10,'/frame/user'),(10,'/left.do'),(10,'/message/v_countUnreadMsg.do'),(10,'/event/'),(10,'/frame/manager'),(10,'/main.do'),(10,'/contents/'),(10,'/index.do'),(10,'/item_group/'),(10,'/log/'),(10,'/top.do'),(10,'/personal/'),(10,'/right.do'),(10,'/contents/v_pic.do'),(10,'/templet/'),(10,'/point/');
/*!40000 ALTER TABLE `jc_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_sensitivity`
--

DROP TABLE IF EXISTS `jc_sensitivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_sensitivity`
--

LOCK TABLES `jc_sensitivity` WRITE;
/*!40000 ALTER TABLE `jc_sensitivity` DISABLE KEYS */;
INSERT INTO `jc_sensitivity` VALUES (1,'法论功','***');
/*!40000 ALTER TABLE `jc_sensitivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site`
--

DROP TABLE IF EXISTS `jc_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `is_master` tinyint(1) DEFAULT '0' COMMENT '是否主站',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site`
--

LOCK TABLES `jc_site` WRITE;
/*!40000 ALTER TABLE `jc_site` DISABLE KEYS */;
INSERT INTO `jc_site` VALUES (1,1,NULL,'localhost','www','电子巡检系统','电子巡检系统','http://','.jhtml','.html','/zhuzhan','0','0','zh_CN','zh_CN','red',2,1,'1','1','','',0);
/*!40000 ALTER TABLE `jc_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_attr`
--

DROP TABLE IF EXISTS `jc_site_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_attr`
--

LOCK TABLES `jc_site_attr` WRITE;
/*!40000 ALTER TABLE `jc_site_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_cfg`
--

DROP TABLE IF EXISTS `jc_site_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_cfg`
--

LOCK TABLES `jc_site_cfg` WRITE;
/*!40000 ALTER TABLE `jc_site_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_company`
--

DROP TABLE IF EXISTS `jc_site_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) DEFAULT NULL COMMENT '联系方式',
  `description` text COMMENT '公司简介',
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5,2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4,2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`),
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_company`
--

LOCK TABLES `jc_site_company` WRITE;
/*!40000 ALTER TABLE `jc_site_company` DISABLE KEYS */;
INSERT INTO `jc_site_company` VALUES (1,'12345678990','20-50人','股份制','互联网','电话：12345678990','<p>12345678990</p>\r\n','12345678990',NULL,NULL);
/*!40000 ALTER TABLE `jc_site_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_flow`
--

DROP TABLE IF EXISTS `jc_site_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `access_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '访问者ip',
  `access_date` varchar(50) DEFAULT NULL COMMENT '访问日期',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `access_page` varchar(255) NOT NULL DEFAULT '' COMMENT '访问页面',
  `referer_website` varchar(255) DEFAULT NULL COMMENT '来访网站',
  `referer_page` varchar(255) DEFAULT NULL COMMENT '来访页面',
  `referer_keyword` varchar(255) DEFAULT NULL COMMENT '来访关键字',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `session_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'cookie信息',
  PRIMARY KEY (`flow_id`),
  KEY `fk_jc_flow_site` (`site_id`),
  CONSTRAINT `fk_jc_flow_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='站点流量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_flow`
--

LOCK TABLES `jc_site_flow` WRITE;
/*!40000 ALTER TABLE `jc_site_flow` DISABLE KEYS */;
INSERT INTO `jc_site_flow` VALUES (1,1,'127.0.0.1','2014-8-25','2014-08-25 17:21:01','http：//localhost：8080/news/index.jhtml','http：//localhost：8080','http：//localhost：8080/member/index.jspx?res=r/cms/www/red&location=http：//localhost：8080/login.jspx&locale=zh_CN&base=&_start_time=1408958451281&resSys=/r/cms','','本机地址','48619D0D60A7408B47F71DB6779E9B63'),(2,1,'127.0.0.1','2014-8-30','2014-08-30 11:00:33','http：//localhost：8080/news/index.jhtml','http：//localhost：8080','http：//localhost：8080/member/index.jspx?res=r/cms/www/red&location=http：//localhost：8080/login.jspx&locale=zh_CN&base=&_start_time=1409367627437&resSys=/r/cms','','本机地址','BB2713E317E15D9B663681D78C6ED0D5'),(3,1,'127.0.0.1','2014-8-30','2014-08-30 11:28:43','http：//localhost：8080/news/index.jhtml','','','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(4,1,'127.0.0.1','2014-8-30','2014-08-30 11:29:02','http：//localhost：8080/picture/index.jhtml','http：//localhost：8080','http：//localhost：8080/news/index.jhtml','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(5,1,'127.0.0.1','2014-8-30','2014-08-30 11:29:15','http：//localhost：8080/job/index.jhtml','http：//localhost：8080','http：//localhost：8080/download/index.jhtml','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(6,1,'127.0.0.1','2014-8-30','2014-08-30 11:29:10','http：//localhost：8080/wldc/index.jhtml','http：//localhost：8080','http：//localhost：8080/download/index.jhtml','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(7,1,'127.0.0.1','2014-8-30','2014-08-30 11:29:08','http：//localhost：8080/download/index.jhtml','http：//localhost：8080','http：//localhost：8080/veido/index.jhtml','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(8,1,'127.0.0.1','2014-8-30','2014-08-30 11:29:05','http：//localhost：8080/veido/index.jhtml','http：//localhost：8080','http：//localhost：8080/picture/index.jhtml','','本机地址','8F5B88F658D67C1DF95F865BBB429432'),(9,1,'127.0.0.1','2014-8-30','2014-08-30 14:36:26','http：//localhost：8080/mrzx/536.jhtml','http：//localhost：8080','http：//localhost：8080/jeeadmin/jeecms/content/v_list.do?cid=44','','本机地址','36574F58F2513DEAA8CF3A82ED038729'),(10,1,'127.0.0.1','2014-8-30','2014-08-30 15:14:31','http：//localhost：8080/report/index.jhtml','','','','本机地址','36574F58F2513DEAA8CF3A82ED038729'),(11,1,'127.0.0.1','2014-8-30','2014-08-30 16:33:33','http：//localhost：8080/report/index.jhtml','http：//localhost：8080','http：//localhost：8080/report/index.jhtml','','本机地址','36574F58F2513DEAA8CF3A82ED038729'),(12,1,'127.0.0.1','2014-8-30','2014-08-30 16:49:50','http：//localhost：8080/report/index.jhtml','http：//localhost：8080','http：//localhost：8080/report/index.jhtml','','本机地址','36574F58F2513DEAA8CF3A82ED038729');
/*!40000 ALTER TABLE `jc_site_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_model`
--

DROP TABLE IF EXISTS `jc_site_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_model`
--

LOCK TABLES `jc_site_model` WRITE;
/*!40000 ALTER TABLE `jc_site_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_txt`
--

DROP TABLE IF EXISTS `jc_site_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_txt`
--

LOCK TABLES `jc_site_txt` WRITE;
/*!40000 ALTER TABLE `jc_site_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_task`
--

DROP TABLE IF EXISTS `jc_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`),
  KEY `fk_jc_task_site` (`site_id`),
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_task`
--

LOCK TABLES `jc_task` WRITE;
/*!40000 ALTER TABLE `jc_task` DISABLE KEYS */;
INSERT INTO `jc_task` VALUES (5,'c0a08e22-9eb6-4589-bd8f-abdac705be9c',1,'yb','com.xunjian.cms.task.job.TempletJob',1,NULL,NULL,NULL,NULL,NULL,5,1,'',1,'',1,1,'2014-07-29 23:05:15'),(6,'c5ac5599-64e2-4064-ad3b-6a81d9384c6d',1,'link','com.xunjian.cms.task.job.LinkJob',1,NULL,NULL,NULL,NULL,NULL,1,1,'',1,'',1,1,'2014-09-19 00:12:01');
/*!40000 ALTER TABLE `jc_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_task_attr`
--

DROP TABLE IF EXISTS `jc_task_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  KEY `fk_jc_attr_task` (`task_id`),
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_task_attr`
--

LOCK TABLES `jc_task_attr` WRITE;
/*!40000 ALTER TABLE `jc_task_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_task_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_topic`
--

DROP TABLE IF EXISTS `jc_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_topic`
--

LOCK TABLES `jc_topic` WRITE;
/*!40000 ALTER TABLE `jc_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user`
--

DROP TABLE IF EXISTS `jc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user`
--

LOCK TABLES `jc_user` WRITE;
/*!40000 ALTER TABLE `jc_user` DISABLE KEYS */;
INSERT INTO `jc_user` VALUES (1,1,'admin',NULL,'2011-01-03 00:00:00','127.0.0.1','2016-12-22 02:38:05','0:0:0:0:0:0:0:1',812,9,63,63,'2013-07-10',1,0,0,0,NULL),(2,1,'xunjian','','2014-10-22 14:37:31','0:0:0:0:0:0:0:1','2016-10-06 07:04:23','0:0:0:0:0:0:0:1',7,8,0,0,'2014-10-22',1,0,1,0,NULL),(3,1,'20030092','','2016-12-19 16:30:08','10.101.21.154','2016-12-19 16:30:08','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL),(4,1,'20100422','','2016-12-19 16:30:46','10.101.21.154','2016-12-19 16:30:46','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL),(5,1,'20070525','','2016-12-19 16:31:23','10.101.21.154','2016-12-19 16:31:23','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL),(6,1,'20110192','','2016-12-19 16:31:54','10.101.21.154','2016-12-19 16:31:54','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL),(7,1,'20131829','','2016-12-19 16:32:30','10.101.21.154','2016-12-19 16:32:30','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL),(8,1,'20070498','','2016-12-19 16:33:05','10.101.21.154','2016-12-19 16:33:05','10.101.21.154',0,8,0,0,'2016-12-19',1,0,0,0,NULL);
/*!40000 ALTER TABLE `jc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_collection`
--

DROP TABLE IF EXISTS `jc_user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_collection`
--

LOCK TABLES `jc_user_collection` WRITE;
/*!40000 ALTER TABLE `jc_user_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_ext`
--

DROP TABLE IF EXISTS `jc_user_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_ext`
--

LOCK TABLES `jc_user_ext` WRITE;
/*!40000 ALTER TABLE `jc_user_ext` DISABLE KEYS */;
INSERT INTO `jc_user_ext` VALUES (1,'管理员',1,NULL,NULL,'上海',NULL,NULL,NULL,'15011111111','',''),(2,'巡检员',NULL,NULL,NULL,'上海',NULL,NULL,NULL,NULL,NULL,NULL),(3,'刘杨',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'陈龙富',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'杨勇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'谢志强',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'方慧',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'张立武',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jc_user_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_resume`
--

DROP TABLE IF EXISTS `jc_user_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) DEFAULT NULL COMMENT '下属人数',
  `job_description` text COMMENT '工作描述',
  `self_evaluation` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户简历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_resume`
--

LOCK TABLES `jc_user_resume` WRITE;
/*!40000 ALTER TABLE `jc_user_resume` DISABLE KEYS */;
INSERT INTO `jc_user_resume` VALUES (1,'程序员','全职','上海','项目主管','','南昌大学','2009-07-01 00:00:00','本科','计算机','江西金磊科技发展有限公司',NULL,NULL,'程序员',NULL,'2009-10-01 00:00:00',NULL,'程序开发','小伙不错');
/*!40000 ALTER TABLE `jc_user_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_role`
--

DROP TABLE IF EXISTS `jc_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_role`
--

LOCK TABLES `jc_user_role` WRITE;
/*!40000 ALTER TABLE `jc_user_role` DISABLE KEYS */;
INSERT INTO `jc_user_role` VALUES (1,1),(2,2),(4,3),(5,4),(5,5),(5,6),(5,7),(5,8);
/*!40000 ALTER TABLE `jc_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_site`
--

DROP TABLE IF EXISTS `jc_user_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_site`
--

LOCK TABLES `jc_user_site` WRITE;
/*!40000 ALTER TABLE `jc_user_site` DISABLE KEYS */;
INSERT INTO `jc_user_site` VALUES (1,1,1,2,1),(2,2,1,1,1),(3,3,1,1,1),(4,4,1,1,1),(5,5,1,1,1),(6,6,1,1,1),(7,7,1,1,1),(8,8,1,1,1);
/*!40000 ALTER TABLE `jc_user_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_item`
--

DROP TABLE IF EXISTS `jc_vote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_item`
--

LOCK TABLES `jc_vote_item` WRITE;
/*!40000 ALTER TABLE `jc_vote_item` DISABLE KEYS */;
INSERT INTO `jc_vote_item` VALUES (13,3,'1111111111111111111',0,1,1),(14,3,'1111111111111122222222',0,4,1),(15,3,'111111111133333333333',0,5,1),(16,3,'22222222222222',0,2,2),(17,3,'222222222222222222',0,6,2),(18,3,'2222222222222222222222',0,7,2),(19,3,'33333333333333333333',0,3,3),(20,3,'3333333333333333333333',0,8,3),(21,3,'3333333333333333333333333333333333333333333333333',0,9,3),(85,4,'不喜欢',1,5,35),(86,4,'很喜欢',12,1,35),(87,4,'喜欢',5,4,35),(88,4,'改进很大',10,5,37),(89,4,'有改进',5,6,37),(90,4,'没有改进',2,8,37),(91,4,'差不多',1,7,37),(92,4,'还不够，很多功能都没有体现',3,10,39),(93,4,'很好的体现了系统的功能点',12,3,39),(94,4,'马马虎虎，比原来好点',3,9,39),(95,4,'留言本',0,15,36),(96,4,'排行榜',1,18,36),(97,4,'在线调查',2,16,36),(98,4,'视频',7,13,36),(99,4,'下载',1,14,36),(100,4,'图库',7,12,36),(101,4,'新闻',9,11,36),(102,4,'招聘',1,17,36);
/*!40000 ALTER TABLE `jc_vote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_record`
--

DROP TABLE IF EXISTS `jc_vote_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_record`
--

LOCK TABLES `jc_vote_record` WRITE;
/*!40000 ALTER TABLE `jc_vote_record` DISABLE KEYS */;
INSERT INTO `jc_vote_record` VALUES (1,NULL,4,'2013-07-05 09:19:46','127.0.0.1','1679939421824ee69ecffa3c6f5d56bd');
/*!40000 ALTER TABLE `jc_vote_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_reply`
--

DROP TABLE IF EXISTS `jc_vote_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='投票文本题目回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_reply`
--

LOCK TABLES `jc_vote_reply` WRITE;
/*!40000 ALTER TABLE `jc_vote_reply` DISABLE KEYS */;
INSERT INTO `jc_vote_reply` VALUES (6,'希望能开发更多的功能模块来',38),(7,'希望能开发更多的功能模块来',38),(8,'希望能开发更多的功能模块来',38),(9,'希望能开发更多的功能模块来',38),(10,'希望能开发更多的功能模块来',38),(11,'121',38),(12,'121',38),(13,'11',38),(14,'感觉差不多',38),(15,'43er',38);
/*!40000 ALTER TABLE `jc_vote_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_subtopic`
--

DROP TABLE IF EXISTS `jc_vote_subtopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT '0' COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT '1' COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`),
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='投票子题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_subtopic`
--

LOCK TABLES `jc_vote_subtopic` WRITE;
/*!40000 ALTER TABLE `jc_vote_subtopic` DISABLE KEYS */;
INSERT INTO `jc_vote_subtopic` VALUES (1,'444444444444',3,3,1),(2,'333333333333',3,2,2),(3,'222222222222222',3,2,3),(4,'1111111111',3,1,4),(35,'V5版本演示站网页的设计风格您喜欢吗？',4,1,1),(36,'您觉得V5演示站哪些模块做的比较好',4,2,5),(37,'V5版本比V2012sp1版的设计风格有改进吗？',4,1,2),(38,'我觉得这里完善一下：',4,3,4),(39,'V5版本演示站的体现出来系统的功能点吗？',4,1,3);
/*!40000 ALTER TABLE `jc_vote_subtopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_topic`
--

DROP TABLE IF EXISTS `jc_vote_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_topic`
--

LOCK TABLES `jc_vote_topic` WRITE;
/*!40000 ALTER TABLE `jc_vote_topic` DISABLE KEYS */;
INSERT INTO `jc_vote_topic` VALUES (3,1,'腾讯新闻频道首页用户调查问卷','1212',NULL,NULL,NULL,0,1,0,0,1,0,0),(4,1,'JEECMS演示站改版用户问卷调查','JEECMSv5版正式发布了，伴随着系统的完善，jeecms演示站的模板也一直在不断的改版，针对此次改版，jeecms美工团队特邀您参与“JEECMS演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！',NULL,NULL,NULL,23,1,0,0,0,0,1);
/*!40000 ALTER TABLE `jc_vote_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_authentication`
--

DROP TABLE IF EXISTS `jo_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_authentication`
--

LOCK TABLES `jo_authentication` WRITE;
/*!40000 ALTER TABLE `jo_authentication` DISABLE KEYS */;
INSERT INTO `jo_authentication` VALUES ('0fde3cd2a57d404cb8a794b905abe1b1',1,'admin','youchouxia@163.com','2016-12-19 21:02:36','0:0:0:0:0:0:0:1','2016-12-19 23:16:12'),('1bc6fe9062204ae9849ac3c35431ca87',1,'admin','youchouxia@163.com','2016-12-22 02:38:05','0:0:0:0:0:0:0:1','2016-12-22 03:03:47'),('5bd11a5b2e154af6aba80cdc10e17fcc',1,'admin','youchouxia@163.com','2016-12-19 18:14:31','10.101.20.152','2016-12-19 18:23:29'),('6fd97d108cba47a9a75c6a1e75e66979',1,'admin','youchouxia@163.com','2016-12-19 14:30:55','10.101.21.154','2016-12-19 18:40:44'),('83895aa03d684432b66fcb1dc88b606e',1,'admin','youchouxia@163.com','2016-12-21 20:07:48','0:0:0:0:0:0:0:1','2016-12-21 23:35:39'),('8405b32824f24c69ab9adc2d9c4282f5',1,'admin','youchouxia@163.com','2016-12-19 14:06:01','10.101.20.152','2016-12-19 18:06:09'),('e046e0e97e4b48738c59a37abd55f099',1,'admin','youchouxia@163.com','2016-12-19 13:40:26','192.168.17.29','2016-12-19 19:09:44'),('e92f71fd58194208bc8e9192901e09c2',1,'admin','youchouxia@163.com','2016-12-21 23:45:07','0:0:0:0:0:0:0:1','2016-12-22 02:36:16');
/*!40000 ALTER TABLE `jo_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_config`
--

DROP TABLE IF EXISTS `jo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_config`
--

LOCK TABLES `jo_config` WRITE;
/*!40000 ALTER TABLE `jo_config` DISABLE KEYS */;
INSERT INTO `jo_config` VALUES ('email_encoding',''),('email_host','smtp.qq.com'),('email_password','chenfazhun1314'),('email_personal','cfz'),('email_port',NULL),('email_username','75489737@qq.com'),('login_error_interval','30'),('login_error_times','3'),('message_forgotpassword_subject','找回密码'),('message_forgotpassword_text','请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:port/name/member/password_reset.jspx?uid=${uid}&key=${resetKey}'),('message_register_subject','欢迎您注册'),('message_register_text','${username}您好：\r\n请点击以下链接进行激活\r\nhttp://localhost:port/name/active.jspx?username=${username}&key=${activationCode}'),('message_subject','JEECMS会员密码找回信息'),('message_text','感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
/*!40000 ALTER TABLE `jo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_ftp`
--

DROP TABLE IF EXISTS `jo_ftp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_ftp`
--

LOCK TABLES `jo_ftp` WRITE;
/*!40000 ALTER TABLE `jo_ftp` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_ftp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_template`
--

DROP TABLE IF EXISTS `jo_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_template`
--

LOCK TABLES `jo_template` WRITE;
/*!40000 ALTER TABLE `jo_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_upload`
--

DROP TABLE IF EXISTS `jo_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_upload`
--

LOCK TABLES `jo_upload` WRITE;
/*!40000 ALTER TABLE `jo_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_user`
--

DROP TABLE IF EXISTS `jo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_user`
--

LOCK TABLES `jo_user` WRITE;
/*!40000 ALTER TABLE `jo_user` DISABLE KEYS */;
INSERT INTO `jo_user` VALUES (1,'admin','youchouxia@163.com','e10adc3949ba59abbe56e057f20f883e','2011-01-03 00:00:00','127.0.0.1','2016-12-22 02:38:05','0:0:0:0:0:0:0:1',773,NULL,NULL,NULL,0,NULL,1,NULL),(2,'xunjian','','e10adc3949ba59abbe56e057f20f883e','2014-10-22 14:37:31','0:0:0:0:0:0:0:1','2016-10-06 07:04:23','0:0:0:0:0:0:0:1',7,NULL,NULL,NULL,0,NULL,1,NULL),(3,'20030092','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:30:08','10.101.21.154','2016-12-19 16:30:08','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL),(4,'20100422','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:30:46','10.101.21.154','2016-12-19 16:30:46','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL),(5,'20070525','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:31:23','10.101.21.154','2016-12-19 16:31:23','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL),(6,'20110192','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:31:54','10.101.21.154','2016-12-19 16:31:54','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL),(7,'20131829','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:32:30','10.101.21.154','2016-12-19 16:32:30','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL),(8,'20070498','','e10adc3949ba59abbe56e057f20f883e','2016-12-19 16:33:05','10.101.21.154','2016-12-19 16:33:05','10.101.21.154',0,NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `jo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_content`
--

DROP TABLE IF EXISTS `xj_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL DEFAULT '0',
  `templet_id` int(11) NOT NULL,
  `templet_name` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `point_id` int(11) NOT NULL,
  `point_name` varchar(100) NOT NULL DEFAULT '',
  `point_no` varchar(50) NOT NULL DEFAULT '',
  `point_addr` varchar(255) DEFAULT '',
  `c_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `xj_status` varchar(50) DEFAULT '',
  `banci` varchar(11) DEFAULT '0',
  `p_status` varchar(50) NOT NULL DEFAULT '',
  `zipai` varchar(255) DEFAULT NULL,
  `adminname` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20916 DEFAULT CHARSET=utf8 COMMENT='内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_content`
--

LOCK TABLES `xj_content` WRITE;
/*!40000 ALTER TABLE `xj_content` DISABLE KEYS */;
INSERT INTO `xj_content` VALUES (20880,3,8,'公司领导巡检记录 月检',1,'管理员',1,'焊装车间（含大件吊运区域及生产线）','001','焊装车间','2016-12-21 22:35:55','准时','1','正常','',NULL,NULL),(20881,1,7,'运营管理部巡检 月检',1,'管理员',6,'配电室间巡检表','006','配电室间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20882,1,7,'运营管理部巡检 月检',1,'管理员',7,'总装车间巡检表（木工房）','007','总装车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20883,1,7,'运营管理部巡检 月检',1,'管理员',8,'调检车间巡检表（调检地沟）','008','调检车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20884,1,7,'运营管理部巡检 月检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20885,1,7,'运营管理部巡检 月检',1,'管理员',2,'试验检测中心巡检表','002','试验检测中心','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20886,1,7,'运营管理部巡检 月检',1,'管理员',3,'涂装车间巡检表（电泳、涂装）','003','涂装车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20887,1,7,'运营管理部巡检 月检',1,'管理员',4,'调漆间巡检表','004','调漆间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20888,1,7,'运营管理部巡检 月检',1,'管理员',5,'锅炉房巡检表','005','锅炉房','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20889,1,7,'运营管理部巡检 月检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20890,1,7,'运营管理部巡检 月检',1,'管理员',1,'焊装车间（含大件吊运区域及生产线）','001','焊装车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20891,2,1,'焊装车间巡检表 周检',1,'管理员',1,'焊装车间（含大件吊运区域及生产线）','001','焊装车间','2016-12-19 23:06:01','准时','1','正常','',NULL,NULL),(20892,3,8,'公司领导巡检记录 月检',1,'管理员',6,'配电室间巡检表','006','配电室间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20893,3,8,'公司领导巡检记录 月检',1,'管理员',7,'总装车间巡检表（木工房）','007','总装车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20894,3,8,'公司领导巡检记录 月检',1,'管理员',8,'调检车间巡检表（调检地沟）','008','调检车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20895,3,8,'公司领导巡检记录 月检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20896,3,8,'公司领导巡检记录 月检',1,'管理员',2,'试验检测中心巡检表','002','试验检测中心','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20897,3,8,'公司领导巡检记录 月检',1,'管理员',3,'涂装车间巡检表（电泳、涂装）','003','涂装车间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20898,3,8,'公司领导巡检记录 月检',1,'管理员',4,'调漆间巡检表','004','调漆间','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20899,3,8,'公司领导巡检记录 月检',1,'管理员',5,'锅炉房巡检表','005','锅炉房','2016-12-19 23:15:12','准时','1','正常','',NULL,NULL),(20900,3,8,'公司领导巡检记录 月检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-01 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20901,4,6,'物流中心巡检表 周检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-19 02:00:00','漏巡','1','漏巡','',NULL,NULL),(20902,4,6,'物流中心巡检表 周检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-19 02:00:00','漏巡','1','漏巡','',NULL,NULL),(20903,5,5,'总装车间巡检表 周检',1,'管理员',7,'总装车间巡检表（木工房）','007','总装车间','2016-12-19 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20904,5,5,'总装车间巡检表 周检',1,'管理员',8,'调检车间巡检表（调检地沟）','008','调检车间','2016-12-19 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20905,6,4,'运营管理部巡检 周检',1,'管理员',6,'配电室间巡检表','006','配电室间','2016-12-19 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20906,6,4,'运营管理部巡检 周检',1,'管理员',5,'锅炉房巡检表','005','锅炉房','2016-12-19 00:00:00','漏巡','1','漏巡','',NULL,NULL),(20907,8,2,'试验检测中心巡检表 周检',1,'管理员',2,'试验检测中心巡检表','002','试验检测中心','2016-12-19 23:06:41','准时','1','正常','',NULL,NULL),(20908,9,6,'物流中心巡检表 周检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-19 00:00:00','漏巡','2','漏巡','',NULL,NULL),(20909,9,6,'物流中心巡检表 周检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-19 00:00:00','漏巡','2','漏巡','',NULL,NULL),(20910,10,6,'物流中心巡检表 周检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-19 00:00:00','漏巡','2','漏巡','',NULL,NULL),(20911,10,6,'物流中心巡检表 周检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-19 00:00:00','漏巡','2','漏巡','',NULL,NULL),(20912,26,6,'物流中心巡检表 周检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-21 20:00:00','漏巡','19','漏巡','',NULL,NULL),(20913,26,6,'物流中心巡检表 周检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-21 20:00:00','漏巡','19','漏巡','',NULL,NULL),(20914,27,6,'物流中心巡检表 周检',1,'管理员',9,'危化品库巡检表','009','危化品库','2016-12-21 21:00:00','漏巡','20','漏巡','',NULL,NULL),(20915,27,6,'物流中心巡检表 周检',1,'管理员',10,'物流卸货平台巡检表','010','物流卸货平台','2016-12-21 21:00:00','漏巡','20','漏巡','',NULL,NULL);
/*!40000 ALTER TABLE `xj_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_content_event`
--

DROP TABLE IF EXISTS `xj_content_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_content_event` (
  `content_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `event_name` varchar(100) NOT NULL DEFAULT '',
  `event_item` varchar(50) DEFAULT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `zipai` varchar(255) DEFAULT NULL,
  `adminname` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `xj_content_event_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `xj_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_content_event`
--

LOCK TABLES `xj_content_event` WRITE;
/*!40000 ALTER TABLE `xj_content_event` DISABLE KEYS */;
INSERT INTO `xj_content_event` VALUES (20880,1,'焊装车间',171,'吊带是否有吨位标示或破损','正常',0,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',172,'大件吊运时吊带是否牢固可靠','正常',1,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',173,'大件吊运时是否有两人一起操作','正常',2,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',174,'车辆转序时推车人员是否在两旁进行推车','正常',3,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',167,'天车运行警报器是否有效','zhengchang',4,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',167,'天车运行警报器是否有效','正常',5,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',168,'天车大、小车刹车是否有效','正常',6,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',169,'天车限重器、防拖扣是否是否有效','正常',7,1,'管理员','',NULL,NULL),(20880,1,'焊装车间',170,'天车操作手柄紧急按钮开关是否有效','正常',8,1,'管理员','',NULL,NULL);
/*!40000 ALTER TABLE `xj_content_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_content_meter`
--

DROP TABLE IF EXISTS `xj_content_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_content_meter` (
  `content_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `meter_id` int(11) NOT NULL DEFAULT '0',
  `meter_name` varchar(100) NOT NULL DEFAULT '',
  `meter_c_value` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `username` varchar(255) DEFAULT NULL,
  `zipai` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `adminname` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `xj_content_meter_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `xj_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_content_meter`
--

LOCK TABLES `xj_content_meter` WRITE;
/*!40000 ALTER TABLE `xj_content_meter` DISABLE KEYS */;
/*!40000 ALTER TABLE `xj_content_meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_content_picture`
--

DROP TABLE IF EXISTS `xj_content_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `zipai` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `xj_content_picture_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `xj_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_content_picture`
--

LOCK TABLES `xj_content_picture` WRITE;
/*!40000 ALTER TABLE `xj_content_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `xj_content_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_cycle`
--

DROP TABLE IF EXISTS `xj_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_cycle` (
  `cycle_id` int(11) NOT NULL AUTO_INCREMENT,
  `templet_id` int(11) NOT NULL,
  `cycle_type` varchar(5) NOT NULL DEFAULT '0',
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `banci` varchar(11) DEFAULT '0',
  PRIMARY KEY (`cycle_id`),
  KEY `templet_id` (`templet_id`),
  CONSTRAINT `xj_cycle_ibfk_1` FOREIGN KEY (`templet_id`) REFERENCES `xj_templet` (`templet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='周期表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_cycle`
--

LOCK TABLES `xj_cycle` WRITE;
/*!40000 ALTER TABLE `xj_cycle` DISABLE KEYS */;
INSERT INTO `xj_cycle` VALUES (1,7,'2','00:00:00','23:59:59','1'),(2,1,'1','00:00:00','23:59:59','1'),(3,8,'2','00:00:00','23:59:59','1'),(4,6,'1','02:00:00','02:59:59','1'),(5,5,'1','00:00:00','23:59:59','1'),(6,4,'1','00:00:00','23:59:59','1'),(7,3,'1','00:00:00','23:59:59','1'),(8,2,'1','00:00:00','23:59:59','1'),(9,6,'1','00:00:00','23:59:59','2'),(10,6,'1','00:00:00','23:59:59','2'),(11,6,'0','05:00:00','05:59:59','4'),(12,6,'0','06:00:00','06:59:59','5'),(13,6,'0','07:00:00','07:59:59','6'),(14,6,'0','08:00:00','08:59:59','7'),(15,6,'0','09:00:00','09:59:59','8'),(16,6,'0','10:00:00','10:59:59','9'),(17,6,'0','11:00:00','11:59:59','10'),(18,6,'0','12:00:00','12:59:59','11'),(19,6,'0','13:00:00','13:59:59','12'),(20,6,'0','14:00:00','14:59:59','13'),(21,6,'0','15:00:00','15:59:59','14'),(22,6,'0','16:00:00','16:59:59','15'),(23,6,'0','17:00:00','17:59:59','16'),(24,6,'0','18:00:00','18:59:59','17'),(25,6,'0','19:00:00','19:59:59','18'),(26,6,'0','20:00:00','20:59:59','19'),(27,6,'0','21:00:00','21:59:59','20');
/*!40000 ALTER TABLE `xj_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_data`
--

DROP TABLE IF EXISTS `xj_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `templet_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `c_date` datetime DEFAULT NULL,
  `xj_status` varchar(50) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_data`
--

LOCK TABLES `xj_data` WRITE;
/*!40000 ALTER TABLE `xj_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `xj_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_event`
--

DROP TABLE IF EXISTS `xj_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL DEFAULT '',
  `event_remark` varchar(255) DEFAULT NULL,
  `event_item` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COMMENT='事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_event`
--

LOCK TABLES `xj_event` WRITE;
/*!40000 ALTER TABLE `xj_event` DISABLE KEYS */;
INSERT INTO `xj_event` VALUES (1,'东勾外过卷','','正常或异常'),(2,'东勾内过卷','','正常或异常'),(3,'西勾外过卷',' ','正常或异常'),(4,'西勾内过卷','西勾内过卷','正常或异常'),(5,'紧急信号','','正常或异常'),(6,'信号与井口闭锁','','正常或异常'),(8,'减速功能失效保护','','正常或异常'),(9,'限速保护装置的试验','','正常或异常'),(10,'深度指示器失效保护装置','','正常或异常'),(11,'过负荷、欠电压保护装置','','正常或异常'),(12,'防过速保护装置','','正常或异常'),(13,'满仓保护装置','','正常或异常'),(14,'闸间隙保护装置','','正常或异常'),(16,'吊具（楔形环）（1/2）1','吊具（楔形环）（1/2）1','正常或异常'),(17,'吊具（楔形环）（1/2）2','吊具（楔形环）（1/2）2','正常或异常'),(18,'吊具（楔形环）（1/2）3','吊具（楔形环）（1/2）3','正常或异常'),(19,'吊具（楔形环）（1/2）4','吊具（楔形环）（1/2）4','正常或异常'),(20,'钢丝绳 （上、中、下）1-1','钢丝绳 （上、中、下）1-1','正常或异常'),(21,'钢丝绳 （上、中、下）1-2','钢丝绳 （上、中、下）1-2','正常或异常'),(22,'钢丝绳 （上、中、下）1-3','钢丝绳 （上、中、下）1-3','正常或异常'),(23,'钢丝绳 （上、中、下）1-4','钢丝绳 （上、中、下）1-4','正常或异常'),(24,'钢丝绳 （上、中、下）1-5','钢丝绳 （上、中、下）1-5','正常或异常'),(25,'钢丝绳 （上、中、下）2-1','钢丝绳 （上、中、下）2-1','正常或异常'),(26,'钢丝绳 （上、中、下）2-2','钢丝绳 （上、中、下）2-2','正常或异常'),(27,'钢丝绳 （上、中、下）2-3','钢丝绳 （上、中、下）2-3','正常或异常'),(28,'钢丝绳 （上、中、下）2-4','钢丝绳 （上、中、下）2-4','正常或异常'),(29,'钢丝绳 （上、中、下）2-5','钢丝绳 （上、中、下）2-5','正常或异常'),(30,'钢丝绳 （上、中、下）3-1','钢丝绳 （上、中、下）3-1','正常或异常'),(31,'钢丝绳 （上、中、下）3-2','钢丝绳 （上、中、下）3-2','正常或异常'),(32,'钢丝绳 （上、中、下）3-3','钢丝绳 （上、中、下）3-3','正常或异常'),(33,'钢丝绳 （上、中、下）3-4','钢丝绳 （上、中、下）3-4','正常或异常'),(34,'钢丝绳 （上、中、下）3-5','钢丝绳 （上、中、下）3-5','正常或异常'),(35,'钢丝绳 （上、中、下）4-1','钢丝绳 （上、中、下）4-1','正常或异常'),(36,'钢丝绳 （上、中、下）4-2','钢丝绳 （上、中、下）4-2','正常或异常'),(37,'钢丝绳 （上、中、下）4-3','钢丝绳 （上、中、下）4-3','正常或异常'),(38,'钢丝绳 （上、中、下）4-4','钢丝绳 （上、中、下）4-4','正常或异常'),(39,'钢丝绳 （上、中、下）4-5','钢丝绳 （上、中、下）4-5','正常或异常'),(40,'隔离木（1次）','隔离木（1次）','正常或异常'),(41,'隔离木（2次）','隔离木（2次）','正常或异常'),(42,'尾绳 1','尾绳 1','正常或异常'),(43,'尾绳 2','尾绳 2','正常或异常'),(44,'井眼管路','井眼管路','正常或异常'),(45,'井眼托梁','井眼托梁','正常或异常'),(46,'井眼井筒','井眼井筒','正常或异常'),(47,'井眼梁窝','井眼梁窝','正常或异常'),(48,'液压系统 （1/2 ）压力','液压系统 （1/2 ）压力','正常或异常'),(49,'液压系统 （1/2 ）油温','液压系统 （1/2 ）油温','正常或异常'),(50,'液压系统 （1/2 ）密封','液压系统 （1/2 ）密封','正常或异常'),(51,'液压系统 （1/2 ）闸','液压系统 （1/2 ）闸','正常或异常'),(52,'液压系统 （1/2 ）管路','液压系统 （1/2 ）管路','正常或异常'),(53,'液压系统 （1/2 ）过滤器','液压系统 （1/2 ）过滤器','正常或异常'),(54,'液压系统 （1/2 ）油质','液压系统 （1/2 ）油质','正常或异常'),(55,'润滑系统压力','润滑系统压力','正常或异常'),(56,'润滑系统油温','润滑系统油温','正常或异常'),(57,'润滑系统密封','润滑系统密封','正常或异常'),(58,'润滑系统管路','润滑系统管路','正常或异常'),(59,'润滑系统过滤器','润滑系统过滤器','正常或异常'),(60,'润滑系统油质','润滑系统油质','正常或异常'),(61,'滚筒主轴承左','滚筒主轴承左','正常或异常'),(62,'滚筒主轴承右','滚筒主轴承右','正常或异常'),(63,'滚筒主轴','滚筒主轴','正常或异常'),(64,'滚筒外观','滚筒外观','正常或异常'),(65,'滚筒螺栓','滚筒螺栓','正常或异常'),(66,'滚筒闸盘','滚筒闸盘','正常或异常'),(67,'天轮外观','天轮外观','正常或异常'),(68,'天轮轴润滑情况','天轮轴润滑情况','正常或异常'),(69,'天轮螺栓','天轮螺栓','正常或异常'),(70,'吊具平衡油缸（东）1','吊具平衡油缸（东）1','正常或异常'),(71,'吊具平衡油缸（东）2','吊具平衡油缸（东）2','正常或异常'),(72,'吊具平衡油缸（东）3','吊具平衡油缸（东）3','正常或异常'),(73,'吊具平衡油缸（东）4','吊具平衡油缸（东）4','正常或异常'),(74,'吊具平衡油缸（西）1','吊具平衡油缸（西）1','正常或异常'),(75,'吊具平衡油缸（西）2','吊具平衡油缸（西）2','正常或异常'),(76,'吊具平衡油缸（西）3','吊具平衡油缸（西）3','正常或异常'),(77,'吊具平衡油缸（西）4','吊具平衡油缸（西）4','正常或异常'),(78,'吊具罐位','吊具罐位','正常或异常'),(79,'防过放过卷缓冲装置外观','防过放过卷缓冲装置外观','正常或异常'),(80,'防过放过卷缓冲装置连接螺栓','防过放过卷缓冲装置连接螺栓','正常或异常'),(81,'防过放过卷缓冲装置承接梁','防过放过卷缓冲装置承接梁','正常或异常'),(82,'防过放过卷缓冲装置框架','防过放过卷缓冲装置框架','正常或异常'),(83,'罐耳滚动罐耳','罐耳滚动罐耳','正常或异常'),(84,'罐耳滑动罐耳','罐耳滑动罐耳','正常或异常'),(85,'罐耳四角罐耳','罐耳四角罐耳','正常或异常'),(86,'罐道外观','罐道外观','正常或异常'),(87,'罐道螺栓','罐道螺栓','正常或异常'),(88,'罐道水平偏差','罐道水平偏差','正常或异常'),(89,'罐道罐道梁','罐道罐道梁','正常或异常'),(90,'卸载闸板','卸载闸板','正常或异常'),(91,'卸载曲轨轮','卸载曲轨轮','正常或异常'),(92,'卸载轴瓦','卸载轴瓦','正常或异常'),(93,'（箕斗）外观','（箕斗）外观','正常或异常'),(94,'（箕斗）安全门','（箕斗）安全门','正常或异常'),(95,'（箕斗）清理情况','（箕斗）清理情况','正常或异常'),(96,'（箕斗）衬板螺栓','（箕斗）衬板螺栓','正常或异常'),(97,'上井口 煤仓 外观','上井口 煤仓 外观','正常或异常'),(98,'上井口 煤仓 衬板','上井口 煤仓 衬板','正常或异常'),(99,'上井口 煤仓 紧固螺栓','上井口 煤仓 紧固螺栓','正常或异常'),(100,'上井口 煤仓 框架','上井口 煤仓 框架','正常或异常'),(101,'天轮润滑','天轮润滑','正常或异常'),(102,'天轮地脚螺栓','天轮地脚螺栓','正常或异常'),(103,'天轮绳槽1','天轮绳槽1','正常或异常'),(104,'天轮绳槽2','天轮绳槽2','正常或异常'),(105,'天轮绳槽3','天轮绳槽3','正常或异常'),(106,'天轮绳槽4','天轮绳槽4','正常或异常'),(107,'天轮轴承左','天轮轴承左','正常或异常'),(108,'天轮轴承右','天轮轴承右','正常或异常'),(109,'天轮外观','天轮外观','正常或异常'),(110,'滚筒绳槽（在用 / 备用）1','滚筒绳槽（在用 / 备用）1','正常或异常'),(111,'滚筒绳槽（在用 / 备用）2','滚筒绳槽（在用 / 备用）2','正常或异常'),(112,'滚筒绳槽（在用 / 备用）3','滚筒绳槽（在用 / 备用）3','正常或异常'),(113,'滚筒绳槽（在用 / 备用）4','滚筒绳槽（在用 / 备用）4','正常或异常'),(114,'液压站（ 1/2 ）过滤器','液压站（ 1/2 ）过滤器','正常或异常'),(115,'液压站（ 1/2 ）闸间隙','液压站（ 1/2 ）闸间隙','正常或异常'),(116,'液压站（ 1/2 ）油质','液压站（ 1/2 ）油质','正常或异常'),(117,'液压站（ 1/2 ）二级制动延时时间','液压站（ 1/2 ）二级制动延时时间','正常或异常'),(118,'箕斗 （左/ 右）紧固螺栓','箕斗 （左/ 右）紧固螺栓','正常或异常'),(119,'箕斗 （左/ 右）耐磨板','箕斗 （左/ 右）耐磨板','正常或异常'),(120,'箕斗 （左/ 右）配重','箕斗 （左/ 右）配重','正常或异常'),(121,'箕斗 （左/ 右）外观','箕斗 （左/ 右）外观','正常或异常'),(122,'主轴','主轴','正常或异常'),(123,'主轴轴承左','主轴轴承左','正常或异常'),(124,'检查及试验情况信号','检查及试验情况信号','正常或异常'),(125,'检查及试验情况过卷','检查及试验情况过卷','正常或异常'),(126,'检查及试验情况其他安全及闭锁保护装置','检查及试验情况其他安全及闭锁保护装置','正常或异常'),(127,'低压配电柜1#','低压配电柜1#','正常或异常'),(128,'低压配电柜2#','低压配电柜2#','正常或异常'),(129,'闸控闸控柜','闸控闸控柜','正常或异常'),(130,'闸控1# 站','闸控1# 站','正常或异常'),(131,'闸控2# 站','闸控2# 站','正常或异常'),(132,'闸控闸开关','闸控闸开关','正常或异常'),(133,'闸控恒减速','闸控恒减速','正常或异常'),(134,'闸控二级制动','闸控二级制动','正常或异常'),(135,'主控柜','主控柜','正常或异常'),(136,'SD柜','SD柜','正常或异常'),(137,'变频柜YA','变频柜YA','正常或异常'),(138,'变频柜YB','变频柜YB','正常或异常'),(139,'励磁柜','励磁柜','正常或异常'),(140,'风机1#','风机1#','正常或异常'),(141,'风机2#','风机2#','正常或异常'),(142,'井筒开关','井筒开关','正常或异常'),(143,'主电机','主电机','正常或异常'),(144,'测速机1#','测速机1#','正常或异常'),(145,'测速机2#','测速机2#','正常或异常'),(146,'轴角编码器1#','轴角编码器1#','正常或异常'),(147,'轴角编码器2#','轴角编码器2#','正常或异常'),(148,'轴角编码器3#','轴角编码器3#','正常或异常'),(149,'高压柜1# 变频柜','高压柜1# 变频柜','正常或异常'),(150,'高压柜2# 变频柜','高压柜2# 变频柜','正常或异常'),(151,'高压柜励磁','高压柜励磁','正常或异常'),(152,'高压柜低压','高压柜低压','正常或异常'),(153,'变压器1#变频柜','变压器1#变频柜','正常或异常'),(154,'变压器2#变频柜','变压器2#变频柜','正常或异常'),(155,'变压器励磁','变压器励磁','正常或异常'),(156,'变压器低压','变压器低压','正常或异常'),(157,'润滑控制柜','润滑控制柜','正常或异常'),(158,'润滑润滑站','润滑润滑站','正常或异常'),(159,'信号信号柜','信号信号柜','正常或异常'),(160,'信号1#信号箱','信号1#信号箱','正常或异常'),(161,'風機運行有无抖动','','无或有'),(162,'外殼及風管有无破損','','无或有'),(163,'皮帶有无抖动','','无或有'),(164,'机房5S清洁有无杂物','','无或有'),(165,'純水箱液位','','高或中或低'),(166,'阻垢劑液位','','高或中或低'),(167,'天车运行警报器是否有效','天车运行警报器是否有效','正常或异常'),(168,'天车大、小车刹车是否有效','天车大、小车刹车是否有效','正常或异常'),(169,'天车限重器、防拖扣是否是否有效','天车限重器、防拖扣是否是否有效','正常或异常'),(170,'天车操作手柄紧急按钮开关是否有效','天车操作手柄紧急按钮开关是否有效','正常或异常'),(171,'吊带是否有吨位标示或破损','吊带是否有吨位标示或破损','正常或异常'),(172,'大件吊运时吊带是否牢固可靠','大件吊运时吊带是否牢固可靠','正常或异常'),(173,'大件吊运时是否有两人一起操作','大件吊运时是否有两人一起操作','正常或异常'),(174,'车辆转序时推车人员是否在两旁进行推车','车辆转序时推车人员是否在两旁进行推车','正常或异常'),(175,'试验过程中人员与试验区域是否隔离','试验过程中人员与试验区域是否隔离','正常或异常'),(176,'试验人员是否存在有“三违”现象','试验人员是否存在有“三违”现象','正常或异常'),(177,'物料摆放规范无堵塞消防、安全通道现象','物料摆放规范无堵塞消防、安全通道现象','正常或异常'),(178,'设备设施安全防护装置完好','设备设施安全防护装置完好','正常或异常'),(179,'各种警示标识是否齐全、有效','各种警示标识是否齐全、有效','正常或异常'),(180,'点检记录规范、齐全','点检记录规范、齐全','正常或异常'),(181,'作业人员是否按要求佩戴好劳动防护用品','作业人员是否按要求佩戴好劳动防护用品','正常或异常'),(182,'作业人员是否存在有违章现象','作业人员是否存在有违章现象','正常或异常'),(183,'车间物料摆放规范无堵塞消防、安全通道现象','车间物料摆放规范无堵塞消防、安全通道现象','正常或异常'),(184,'车间点检记录规范、齐全','车间点检记录规范、齐全','正常或异常'),(185,'消防器材无遮挡，在有效期范围内。','消防器材无遮挡，在有效期范围内。','正常或异常'),(186,'物料分类存放并摆放整齐，码单与实物相符。','物料分类存放并摆放整齐，码单与实物相符。','正常或异常'),(187,'温、湿度记录准确','温、湿度记录准确','正常或异常'),(188,'物料不超量，包装严密，无泄漏。（油漆、稀','物料不超量，包装严密，无泄漏。（油漆、稀释剂开封后必须盖上盖子）','正常或异常'),(189,'隔热、通风设施完好并正常开启，','隔热、通风设施完好并正常开启，','正常或异常'),(190,'物料安全技术说明齐全','物料安全技术说明齐全','正常或异常'),(191,'锅炉无天燃气泄漏引起的异味','锅炉无天燃气泄漏引起的异味','正常或异常'),(192,'操作工员是否存在有违章现象','操作工员是否存在有违章现象','正常或异常'),(193,'消防器材无遮挡，在有效期范围内','消防器材无遮挡，在有效期范围内','正常或异常'),(194,'锅炉点检记录规范、齐全','锅炉点检记录规范、齐全','正常或异常'),(195,'作业人员操作时需佩戴好劳动防护用品','作业人员操作时需佩戴好劳动防护用品','正常或异常'),(196,'配电室内干净、整洁','配电室内干净、整洁','正常或异常'),(197,'防护用品是否在有效范围内使用','防护用品是否在有效范围内使用','正常或异常'),(198,'配电室记录规范、齐全','配电室记录规范、齐全','正常或异常'),(199,'配电柜开关和指示灯正常','配电柜开关和指示灯正常','正常或异常'),(200,'现场是否有“三违现象”','现场是否有“三违现象”','正常或异常'),(201,'物料分类存放并摆放整齐，无占道现象','物料分类存放并摆放整齐，无占道现象','正常或异常'),(202,'作业人员劳动防护用品是否穿戴标准','作业人员劳动防护用品是否穿戴标准','正常或异常'),(203,'设备、设施，安全防护装置是否完好','设备、设施，安全防护装置是否完好','正常或异常'),(204,'车间点检表单是否齐全、记录是否规范','车间点检表单是否齐全、记录是否规范','正常或异常'),(205,'物料包装严密，无泄漏。（开封后必须盖上盖','物料包装严密，无泄漏。（开封后必须盖上盖子）','正常或异常'),(206,'物流通道是否通畅','物流通道是否通畅','正常或异常'),(207,'登车桥、龙门吊设备是否完好、是否点检','登车桥、龙门吊设备是否完好、是否点检','正常或异常'),(208,'卸货搬运作业是否规范（特种作业、高空作业','卸货搬运作业是否规范（特种作业、高空作业、劳保穿戴）','正常或异常');
/*!40000 ALTER TABLE `xj_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_item`
--

DROP TABLE IF EXISTS `xj_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `item_fatherid` varchar(11) NOT NULL DEFAULT '0',
  `item_orderid` varchar(11) NOT NULL DEFAULT '0',
  `item_remark` varchar(255) DEFAULT '',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='包和项级联菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_item`
--

LOCK TABLES `xj_item` WRITE;
/*!40000 ALTER TABLE `xj_item` DISABLE KEYS */;
INSERT INTO `xj_item` VALUES (1,'焊装车间','0','1','焊装车间'),(2,'试验检测中心','0','2','试验检测中心'),(3,'涂装车间巡检表（电泳、涂装）','0','3','涂装车间'),(4,'调漆间巡检表','0','4','调漆间'),(5,'锅炉房巡检表','0','5','锅炉房'),(6,'配电室间巡检表','0','6','配电室间'),(7,'总装车间巡检表（木工房）','0','7','总装车间'),(8,'调检车间巡检表（调检地沟）','0','8','调检车间'),(9,'危化品库巡检表','0','9','危化品库'),(10,'物流卸货平台巡检表','0','10','物流卸货平台');
/*!40000 ALTER TABLE `xj_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_item_event`
--

DROP TABLE IF EXISTS `xj_item_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_item_event` (
  `item_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `xj_item_event_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `xj_item` (`item_id`),
  CONSTRAINT `xj_item_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `xj_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_item_event`
--

LOCK TABLES `xj_item_event` WRITE;
/*!40000 ALTER TABLE `xj_item_event` DISABLE KEYS */;
INSERT INTO `xj_item_event` VALUES (1,167,0),(1,168,0),(1,169,0),(1,170,0),(1,171,0),(1,172,0),(1,173,0),(1,174,0),(2,175,0),(2,176,0),(2,177,0),(2,178,0),(2,179,0),(2,180,0),(3,178,0),(3,181,0),(3,182,0),(3,183,0),(3,184,0),(4,185,0),(4,186,0),(4,187,0),(4,188,0),(4,189,0),(4,190,0),(5,178,0),(5,191,0),(5,192,0),(5,193,0),(5,194,0),(6,182,0),(6,195,0),(6,196,0),(6,197,0),(6,198,0),(6,199,0),(7,185,0),(7,200,0),(7,201,0),(7,202,0),(7,203,0),(7,204,0),(8,185,0),(8,200,0),(8,201,0),(8,202,0),(8,203,0),(8,204,0),(9,185,0),(9,186,0),(9,187,0),(9,189,0),(9,190,0),(9,205,0),(10,206,0),(10,207,0),(10,208,0);
/*!40000 ALTER TABLE `xj_item_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_item_meter`
--

DROP TABLE IF EXISTS `xj_item_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_item_meter` (
  `item_id` int(11) NOT NULL,
  `meter_id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`meter_id`),
  KEY `meter_id` (`meter_id`),
  CONSTRAINT `xj_item_meter_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `xj_item` (`item_id`),
  CONSTRAINT `xj_item_meter_ibfk_2` FOREIGN KEY (`meter_id`) REFERENCES `xj_meter` (`meter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_item_meter`
--

LOCK TABLES `xj_item_meter` WRITE;
/*!40000 ALTER TABLE `xj_item_meter` DISABLE KEYS */;
/*!40000 ALTER TABLE `xj_item_meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_meter`
--

DROP TABLE IF EXISTS `xj_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_meter` (
  `meter_id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_name` varchar(100) NOT NULL DEFAULT '',
  `meter_unit` varchar(10) DEFAULT NULL,
  `meter_type` varchar(2) DEFAULT '0',
  `meter_remark` varchar(255) DEFAULT NULL,
  `meter_c_value` varchar(100) DEFAULT NULL,
  `meter_max_value` varchar(100) DEFAULT NULL,
  `meter_max_description` varchar(255) DEFAULT NULL,
  `meter_min_value` varchar(100) DEFAULT NULL,
  `meter_min_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='抄表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_meter`
--

LOCK TABLES `xj_meter` WRITE;
/*!40000 ALTER TABLE `xj_meter` DISABLE KEYS */;
INSERT INTO `xj_meter` VALUES (1,'1号全绳断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(2,'1号捻距断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(3,'2号全绳断丝','根','0',' ',' ','35','请尽快更换','0','输入错误，请仔细查看'),(4,'2号捻距断丝','根','0','','','35','请尽快更换','0',' 输入错误，请仔细查看'),(5,'3号全绳断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(6,'3号捻距断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(7,'4号全绳断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(8,'4号捻距断丝','根','0','','','35','请尽快更换','0','输入错误，请仔细查看'),(9,'运转情况提升次数','次','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(10,'运转情况电机温度','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(11,'运转情况润滑油压','帕','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(12,'运转情况制动油压','帕','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(13,'运转情况制动油温','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(14,'各部位轴承温度℃主轴左','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(15,'各部位轴承温度℃主轴右','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(16,'各部位轴承温度℃天轮上','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(17,'各部位轴承温度℃天轮下','℃','0',' ',' ','35','越界','0','输入错误，请仔细查看'),(18,'本班发生的事故或故障记录','','1','','','','','',''),(19,'本班检修记录','','1',' ',' ',' ',' ','',''),(20,'下班应注意的事项及上级的特别指示','','1','','','','','',''),(21,'交 班 人','','1','','','','','',''),(22,'接 班 人','','1','','','','','',''),(23,'钢丝绳 （上、中、下）1/1',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(24,'钢丝绳 （上、中、下）1/2',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(25,'钢丝绳 （上、中、下）1/3',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(26,'钢丝绳 （上、中、下）1/4',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(27,'钢丝绳 （上、中、下）1/5',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(28,'钢丝绳 （上、中、下）2/1',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(29,'钢丝绳 （上、中、下）2/2',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(30,'钢丝绳 （上、中、下）2/3',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(31,'钢丝绳 （上、中、下）2/4',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(32,'钢丝绳 （上、中、下）2/5',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(33,'钢丝绳 （上、中、下）3/1',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(34,'钢丝绳 （上、中、下）3/2',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(35,'钢丝绳 （上、中、下）3/3',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(36,'钢丝绳 （上、中、下）3/4',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(37,'钢丝绳 （上、中、下）3/5',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(38,'钢丝绳 （上、中、下）4/1',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(39,'钢丝绳 （上、中、下）4/2',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(40,'钢丝绳 （上、中、下）4/3',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(41,'钢丝绳 （上、中、下）4/4',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(42,'钢丝绳 （上、中、下）4/5',' ','0',' ',' ','44.0','越界','43.0','输入错误，请仔细查看'),(43,'液压系统 （1/2 ）压力','帕','0','液压系统 （1/2 ）压力','0','40.0','越界','0.0','输入错误，请仔细查看'),(44,'液压系统 （1/2 ）油温','℃','0','液压系统 （1/2 ）油温','0','6.0','越界','0.0','输入错误，请仔细查看'),(45,'润滑系统压力','帕','0','润滑系统压力','0','40.0','越界','0.0','输入错误，请仔细查看'),(46,'润滑系统油温','℃','0','润滑系统油温','0','6.0','越界','0.0','输入错误，请仔细查看'),(47,'电压','伏','0','','','420','电压过大','',''),(48,'电流','安','0','','','7','电流过大','',''),(49,'總有功電量读数KWH','KWH','0','','','','','',''),(50,'峰有功電量读数KWH','KWH','0','','','','','',''),(51,'平1有功電量读数KWH','KWH','0','','','','','',''),(52,'平2有功電量读数KWH','KWH','0','','','','','',''),(53,'谷有功電量读数KWH','KWH','0','','','','','',''),(54,'峰最大需量KW','KW','0','*4000','','','','',''),(55,'平1最大需量KW','KW','0','*4000','','','','',''),(56,'平2最大需量KW','KW','0','*4000','','','','',''),(57,'穀最大需量KW','KW','0','*4000','','','','',''),(58,'總感性無功電量读数Kvarh','Kvarh','0','','','','','',''),(59,'總容性無功電量读数Kvarh','Kvarh','0','','','','','',''),(60,'用電量KWH','KWH','0','','','','','',''),(61,'進口壓力(Mpa)','Mpa','0','','','','','',''),(62,'出口壓力(Mpa)','Mpa','0','','','','','',''),(63,'阻垢劑液位','','1','高/中/低','','','','',''),(64,'保安过滤器進口壓力(Mpa)','Mpa','0','','','','','',''),(65,'RO進口壓力(Mpa)','Mpa','0','','','','','',''),(66,'RO出口壓力(Mpa)','Mpa','0','','','','','',''),(67,'產水流量(LPM)','LPM','0','','','','','',''),(68,'廢水流量(LPM)','LPM','0','','','','','',''),(69,'電導率（us/cm)','us/cm','0','','','','','',''),(70,'溫度（℃）','℃','0','','','','','',''),(71,'累计运行时间','H','0','','','','','',''),(72,'紫外線殺菌燈狀況','','0','2000H','','','','',''),(73,'穩壓泵出口壓力(Mpa)','Mpa','0','≥0.10','','','','','');
/*!40000 ALTER TABLE `xj_meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_point`
--

DROP TABLE IF EXISTS `xj_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_point` (
  `point_id` int(11) NOT NULL AUTO_INCREMENT,
  `point_no` varchar(50) NOT NULL DEFAULT '',
  `point_name` varchar(100) NOT NULL DEFAULT '',
  `serial_no` varchar(50) NOT NULL DEFAULT '',
  `point_addr` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `order_id` int(11) DEFAULT '0',
  `s_time` int(11) DEFAULT '0',
  `b_time` int(11) DEFAULT '0',
  PRIMARY KEY (`point_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='点位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_point`
--

LOCK TABLES `xj_point` WRITE;
/*!40000 ALTER TABLE `xj_point` DISABLE KEYS */;
INSERT INTO `xj_point` VALUES (1,'001','焊装车间（含大件吊运区域及生产线）','3136e322048107e0','焊装车间','',1,0,0),(2,'002','试验检测中心巡检表','5bd56d4d','试验检测中心','',2,0,0),(3,'003','涂装车间巡检表（电泳、涂装）','bb72564d','涂装车间','',3,0,0),(4,'004','调漆间巡检表','0bf35a4d','调漆间','',4,0,0),(5,'005','锅炉房巡检表','7bf8714d','锅炉房','',5,0,0),(6,'006','配电室间巡检表','7b17554d','配电室间','',6,0,0),(7,'007','总装车间巡检表（木工房）','bbba664d','总装车间','',7,0,0),(8,'008','调检车间巡检表（调检地沟）','4b095a4d','调检车间','',8,0,0),(9,'009','危化品库巡检表','0bee714d','危化品库','',9,0,0),(10,'010','物流卸货平台巡检表','ab54714d','物流卸货平台','',10,0,0);
/*!40000 ALTER TABLE `xj_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_point_item`
--

DROP TABLE IF EXISTS `xj_point_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_point_item` (
  `point_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`point_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `xj_point_item_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `xj_point` (`point_id`),
  CONSTRAINT `xj_point_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `xj_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_point_item`
--

LOCK TABLES `xj_point_item` WRITE;
/*!40000 ALTER TABLE `xj_point_item` DISABLE KEYS */;
INSERT INTO `xj_point_item` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `xj_point_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_setting`
--

DROP TABLE IF EXISTS `xj_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `warn_setting` int(11) NOT NULL DEFAULT '0',
  `warn_time_setting` int(11) DEFAULT '0',
  `warn_error_setting` int(11) DEFAULT '0',
  `sms_url` varchar(256) DEFAULT NULL,
  `sms_username` varchar(45) DEFAULT NULL,
  `sms_password` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_setting`
--

LOCK TABLES `xj_setting` WRITE;
/*!40000 ALTER TABLE `xj_setting` DISABLE KEYS */;
INSERT INTO `xj_setting` VALUES (1,0,1,0,'asdf','12sd','123s',NULL);
/*!40000 ALTER TABLE `xj_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_templet`
--

DROP TABLE IF EXISTS `xj_templet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_templet` (
  `templet_id` int(11) NOT NULL AUTO_INCREMENT,
  `templet_name` varchar(100) NOT NULL DEFAULT '',
  `templet_isTrue` varchar(2) NOT NULL DEFAULT '0',
  `templet_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`templet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='样板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_templet`
--

LOCK TABLES `xj_templet` WRITE;
/*!40000 ALTER TABLE `xj_templet` DISABLE KEYS */;
INSERT INTO `xj_templet` VALUES (1,'焊装车间巡检表 周检','1',''),(2,'试验检测中心巡检表 周检','1',''),(3,'涂装车间巡检表 周检','1',''),(4,'运营管理部巡检 周检','1',''),(5,'总装车间巡检表 周检','1',''),(6,'物流中心巡检表 周检','1',''),(7,'运营管理部巡检 月检','1',''),(8,'公司领导巡检记录 月检','1',''),(9,'测试表格','0','');
/*!40000 ALTER TABLE `xj_templet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_templet_point`
--

DROP TABLE IF EXISTS `xj_templet_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_templet_point` (
  `templet_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  PRIMARY KEY (`templet_id`,`point_id`),
  KEY `point_id` (`point_id`),
  CONSTRAINT `xj_templet_point_ibfk_1` FOREIGN KEY (`templet_id`) REFERENCES `xj_templet` (`templet_id`),
  CONSTRAINT `xj_templet_point_ibfk_2` FOREIGN KEY (`point_id`) REFERENCES `xj_point` (`point_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_templet_point`
--

LOCK TABLES `xj_templet_point` WRITE;
/*!40000 ALTER TABLE `xj_templet_point` DISABLE KEYS */;
INSERT INTO `xj_templet_point` VALUES (1,1),(7,1),(8,1),(2,2),(7,2),(8,2),(7,3),(8,3),(7,4),(8,4),(4,5),(7,5),(8,5),(4,6),(7,6),(8,6),(5,7),(7,7),(8,7),(5,8),(7,8),(8,8),(6,9),(7,9),(8,9),(9,9),(6,10),(7,10),(8,10);
/*!40000 ALTER TABLE `xj_templet_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_templet_role`
--

DROP TABLE IF EXISTS `xj_templet_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_templet_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `templet_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_templet_role`
--

LOCK TABLES `xj_templet_role` WRITE;
/*!40000 ALTER TABLE `xj_templet_role` DISABLE KEYS */;
INSERT INTO `xj_templet_role` VALUES (14,8,1,1),(15,8,2,2);
/*!40000 ALTER TABLE `xj_templet_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_test`
--

DROP TABLE IF EXISTS `xj_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_test` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_test`
--

LOCK TABLES `xj_test` WRITE;
/*!40000 ALTER TABLE `xj_test` DISABLE KEYS */;
INSERT INTO `xj_test` VALUES (1,'aa','12'),(2,'陈','123'),(3,'test',NULL),(4,'test',NULL),(5,'test',NULL),(6,'test',NULL),(7,'test',NULL);
/*!40000 ALTER TABLE `xj_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xj_weixun`
--

DROP TABLE IF EXISTS `xj_weixun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xj_weixun` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `templet_id` int(11) NOT NULL DEFAULT '0',
  `templet_name` varchar(100) NOT NULL DEFAULT '',
  `weixun_num` int(11) NOT NULL DEFAULT '0',
  `detail` varchar(10000) DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xj_weixun`
--

LOCK TABLES `xj_weixun` WRITE;
/*!40000 ALTER TABLE `xj_weixun` DISABLE KEYS */;
/*!40000 ALTER TABLE `xj_weixun` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-05 22:42:07
