/*
MySQL - 5.6.30-log : Database - java_demo
*/
CREATE DATABASE IF NOT EXISTS `java_demo`  DEFAULT CHARACTER SET utf8 ;
USE `java_demo`;

CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL COMMENT '名字',
  `age` INT(3) NOT NULL COMMENT '年龄',
  `sex` CHAR(1) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

COMMIT;