DROP TABLE IF EXISTS `xj_setting`;
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

LOCK TABLES `xj_setting` WRITE;
INSERT INTO `xj_setting` VALUES (1,0,1,0,'asdf','12sd','123s',NULL);
UNLOCK TABLES;
