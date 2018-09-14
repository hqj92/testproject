/*
MySQL Data Transfer
Source Host: localhost
Source Database: ems
Target Host: localhost
Target Database: ems
Date: 2014/12/5 0:45:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for anthorty_info
-- ----------------------------
CREATE TABLE `anthorty_info` (
  `anthorty_id` int(11) NOT NULL auto_increment,
  `anthorty_pid` int(11) default NULL,
  `anthorty_name` varchar(100) default NULL,
  `anthorty_desc` varchar(1000) default NULL,
  `anthorty_url` varchar(1000) default NULL,
  PRIMARY KEY  (`anthorty_id`),
  KEY `FK_Reference_2` (`anthorty_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attendance_info
-- ----------------------------
CREATE TABLE `attendance_info` (
  `attendance_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `attendance_desc` varchar(100) default NULL,
  `attendance_state` varchar(10) default NULL,
  `attendance_time` datetime default NULL,
  `attendance_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`attendance_id`),
  KEY `FK_Reference_22` (`student_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for audition_info
-- ----------------------------
CREATE TABLE `audition_info` (
  `audition_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `audition_time` datetime default NULL,
  `audition_addr` varchar(300) default NULL,
  `audition_course` varchar(100) default NULL,
  `audition_desc` varchar(2000) default NULL,
  PRIMARY KEY  (`audition_id`),
  KEY `FK_Reference_10` (`student_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL auto_increment,
  `discipline_id` int(11) default NULL,
  `syllabus_id` int(11) default NULL,
  `classroom_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `class_name` varchar(100) default NULL,
  `class_number` int(11) default NULL,
  `class_start_time` datetime default NULL,
  `class_end_time` datetime default NULL,
  `class_isuesd` varchar(10) default NULL,
  `class_state` varchar(10) default NULL,
  `class_desc` varchar(1000) default NULL,
  PRIMARY KEY  (`class_id`),
  KEY `FK_Reference_17` (`discipline_id`),
  KEY `FK_Reference_18` (`syllabus_id`),
  KEY `FK_Reference_19` (`classroom_id`),
  KEY `FK_Reference_20` (`staff_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`discipline_id`) REFERENCES `discipline_info` (`discipline_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus_info` (`syllabus_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_info` (`classroom_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_transaction_info
-- ----------------------------
CREATE TABLE `class_transaction_info` (
  `class_transaction_id` int(11) NOT NULL auto_increment,
  `class_id` int(11) default NULL,
  `class_transaction_title` varchar(100) default NULL,
  `class_transaction_content` varchar(2000) default NULL,
  `class_transaction_person` varchar(100) default NULL,
  `class_transaction_time` datetime default NULL,
  `class_transaction_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`class_transaction_id`),
  KEY `FK_Reference_21` (`class_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for classroom_info
-- ----------------------------
CREATE TABLE `classroom_info` (
  `classroom_id` int(11) NOT NULL auto_increment,
  `classroom_name` varchar(100) default NULL,
  `classroom_max` int(11) default NULL,
  `classroom_info` varchar(1000) default NULL,
  `classroom_remark` varchar(1000) default NULL,
  `classroom_mark` varchar(10) default NULL,
  PRIMARY KEY  (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for communicate_info
-- ----------------------------
CREATE TABLE `communicate_info` (
  `communicate_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `communicate_time` datetime default NULL,
  `communicate_content` varchar(2000) default NULL,
  PRIMARY KEY  (`communicate_id`),
  KEY `FK_Reference_12` (`student_id`),
  KEY `FK_Reference_13` (`staff_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
CREATE TABLE `data_dictionary` (
  `data_id` int(11) NOT NULL auto_increment,
  `data_content` varchar(100) default NULL,
  `data_type` varchar(100) default NULL,
  `data_desc` varchar(1000) default NULL,
  PRIMARY KEY  (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discipline_info
-- ----------------------------
CREATE TABLE `discipline_info` (
  `discipline_id` int(11) NOT NULL auto_increment,
  `discipline_name` varchar(100) default NULL,
  `discipline_tuition` int(11) default NULL,
  `discipline_bring` int(11) default NULL,
  `discipline_desc` varchar(2000) default NULL,
  `discipline_isuesd` varchar(10) default NULL,
  PRIMARY KEY  (`discipline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
CREATE TABLE `email_info` (
  `email_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `email_title` varchar(1000) default NULL,
  `email_content` varchar(2000) default NULL,
  `email_time` datetime default NULL,
  `email_man` varchar(100) default NULL,
  `email_addr` varchar(300) default NULL,
  `email_state` varchar(10) default NULL,
  PRIMARY KEY  (`email_id`),
  KEY `FK_Reference_7` (`staff_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for evaluation_info
-- ----------------------------
CREATE TABLE `evaluation_info` (
  `evaluation_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `evaluation_title` varchar(100) default NULL,
  `evaluation_content` varchar(2000) default NULL,
  `evaluation_course` varchar(100) default NULL,
  `evaluation_teacher` varchar(100) default NULL,
  `evaluation_time` datetime default NULL,
  PRIMARY KEY  (`evaluation_id`),
  KEY `FK_Reference_11` (`student_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for market_active
-- ----------------------------
CREATE TABLE `market_active` (
  `active_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `active_name` varchar(300) default NULL,
  `active_state` int(11) default NULL,
  `active_start` datetime default NULL,
  `active_end` datetime default NULL,
  `active_type` int(11) default NULL,
  `active_coste_emtimate` double default NULL,
  `active_coste` double default NULL,
  `active_refect_estimate` int(11) default NULL,
  `active_student` varchar(300) default NULL,
  `active_content` varchar(2000) default NULL,
  PRIMARY KEY  (`active_id`),
  KEY `FK_Reference_5` (`staff_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for messafe_info
-- ----------------------------
CREATE TABLE `messafe_info` (
  `messafe_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `messafe_content` varchar(1000) default NULL,
  `messafe_man` varchar(50) default NULL,
  `messafe_phone` varchar(50) default NULL,
  `messafe_time` datetime default NULL,
  `messafe_state` varchar(10) default NULL,
  PRIMARY KEY  (`messafe_id`),
  KEY `FK_Reference_6` (`staff_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_anthority_info
-- ----------------------------
CREATE TABLE `role_anthority_info` (
  `role_anthority_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `anthorty_id` int(11) default NULL,
  PRIMARY KEY  (`role_anthority_id`),
  KEY `FK_Reference_3` (`role_id`),
  KEY `FK_Reference_4` (`anthorty_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`anthorty_id`) REFERENCES `anthorty_info` (`anthorty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(100) default NULL,
  `role_desc` varchar(1000) default NULL,
  `role_state` varchar(10) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
CREATE TABLE `staff_info` (
  `staff_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `staff_name` varchar(100) default NULL,
  `staff_sex` varchar(10) default NULL,
  `staff_age` int(10) default NULL,
  `staff_native_place` varchar(10) default NULL,
  `staff_idcard` varchar(100) default NULL,
  `staff_brithday` datetime default NULL,
  `staff_office_phone` varchar(50) default NULL,
  `staff_mobile_phone` varchar(50) default NULL,
  `staff_eamil` varchar(100) default NULL,
  `staff_addr` varchar(200) default NULL,
  `staff_qq` varchar(30) default NULL,
  `staff_entry_time` datetime default NULL,
  `staff_eduction_level` varchar(20) default NULL,
  `staff_remark` varchar(2000) default NULL,
  `staff_state` varchar(10) default NULL COMMENT '1 有效 员工\r\n            0 无效\r\n            2 教师\r\n            ',
  `user_number` varchar(100) default NULL,
  `user_passowrd` varchar(100) default NULL,
  PRIMARY KEY  (`staff_id`),
  UNIQUE KEY `unq_user_number` (`user_number`),
  KEY `FK_Reference_1` (`role_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff_salary
-- ----------------------------
CREATE TABLE `staff_salary` (
  `staff_salary_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `sta_staff_id` int(11) default NULL,
  `total_salary` double default NULL,
  `deduct_salary` double default NULL,
  `real_salary` double default NULL,
  `is_uesd` varchar(10) default NULL,
  `staff_salary_time` datetime default NULL,
  `staff_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`staff_salary_id`),
  KEY `FK_Reference_25` (`staff_id`),
  KEY `FK_Reference_26` (`sta_staff_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`sta_staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `class_id` int(11) default NULL,
  `student_name` varchar(100) default NULL,
  `student_sex` varchar(10) default NULL,
  `student_age` int(11) default NULL,
  `student_tellphone` varchar(100) default NULL,
  `student_email` varchar(200) default NULL,
  `student_idcard` varchar(30) default NULL,
  `student_address` varchar(300) default NULL,
  `student_birthday` varchar(100) default NULL,
  `student_school` varchar(100) default NULL,
  `student_qq` varchar(100) default NULL,
  `student_parents_name` varchar(100) default NULL,
  `student_parents_phone` varchar(100) default NULL,
  `student_pro` varchar(100) default NULL,
  `student_pro_city` varchar(100) default NULL,
  `student_type` varchar(10) default NULL,
  `student_ispay` varchar(10) default NULL,
  `student_sate` int(10) default NULL,
  `student_mark` varchar(10) default NULL,
  `student_desc` varchar(2000) default NULL,
  `student_number` varchar(100) default NULL,
  `student_password` varchar(100) default NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `FK_stu_number` (`student_number`),
  KEY `FK_Reference_16` (`class_id`),
  KEY `FK_Reference_8` (`staff_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_payment
-- ----------------------------
CREATE TABLE `student_payment` (
  `payment_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `payment_situation` varchar(1000) default NULL,
  `payment_method` int(11) default NULL,
  `payment_time` datetime default NULL,
  `discount_amount` double default NULL,
  `should_amount` double default NULL,
  `real_amount` double default NULL,
  `debt_amount` double default NULL,
  `payment_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_Reference_23` (`student_id`),
  KEY `FK_Reference_24` (`staff_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_write_grade
-- ----------------------------
CREATE TABLE `student_write_grade` (
  `write_grade_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `write_grade_subject` varchar(1000) default NULL,
  `write_grade` varchar(50) default NULL,
  `write_grade_time` datetime default NULL,
  `write_grade_note` varchar(2000) default NULL,
  PRIMARY KEY  (`write_grade_id`),
  KEY `FK_Reference_14` (`student_id`),
  KEY `FK_Reference_15` (`staff_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for syllabus_info
-- ----------------------------
CREATE TABLE `syllabus_info` (
  `syllabus_id` int(11) NOT NULL auto_increment,
  `syllabus_yi` varchar(50) default NULL,
  `syllabus_er` varchar(50) default NULL,
  `syllabus_san` varchar(50) default NULL,
  `syllabus_si` varchar(50) default NULL,
  `syllabus_wu` varchar(50) default NULL,
  `syllabus_liu` varchar(50) default NULL,
  `syllabus_qi` varchar(50) default NULL,
  `is_uesd` varchar(50) default NULL,
  `syllabus_name` varchar(100) default NULL,
  PRIMARY KEY  (`syllabus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for template_info
-- ----------------------------
CREATE TABLE `template_info` (
  `template_id` int(11) NOT NULL auto_increment,
  `template_title` varchar(200) default NULL,
  `template_content` varchar(2000) default NULL,
  `template_type` varchar(20) default NULL,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for track_record_info
-- ----------------------------
CREATE TABLE `track_record_info` (
  `track_record_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `track_record_title` varchar(200) default NULL,
  `track_record_content` varchar(2000) default NULL,
  `track_record_time` datetime default NULL,
  `enrollment` int(11) default NULL,
  `next_record_time` datetime default NULL,
  PRIMARY KEY  (`track_record_id`),
  KEY `FK_Reference_9` (`student_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `anthorty_info` VALUES ('1', '-1', '鏍圭洰褰�', '', '');
INSERT INTO `anthorty_info` VALUES ('2', '1', '绯荤粺绠＄悊', '绠＄悊ixinxi', null);
INSERT INTO `anthorty_info` VALUES ('9', '1', '钀ラ攢绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('11', '2', '鍛樺伐绠＄悊', 'system/list.do', 'system/list.do');
INSERT INTO `anthorty_info` VALUES ('12', '2', '瑙掕壊绠＄悊', 'roleinfo/list.do', 'roleinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('13', '2', '瑙掕壊鍙樻洿', 'roleinfo/staffinforolelist.do', 'roleinfo/staffinforolelist.do');
INSERT INTO `anthorty_info` VALUES ('14', '2', '鏉冮檺绠＄悊', 'anthorty/list.do', 'anthorty/list.do');
INSERT INTO `anthorty_info` VALUES ('15', '2', '鏉冮檺鍙樻洿', 'anthotychange/list.do', 'anthotychange/list.do');
INSERT INTO `anthorty_info` VALUES ('16', '2', '鏁版嵁瀛楀吀', 'datadictionary/list.do', 'datadictionary/list.do');
INSERT INTO `anthorty_info` VALUES ('17', '9', '妯℃澘绠＄悊', 'template/list.do', 'template/list.do');
INSERT INTO `anthorty_info` VALUES ('18', '9', '鐭俊绠＄悊', 'messafeinfo/list.do', 'messafeinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('19', '9', '閭欢绠＄悊', 'email/list.do', 'email/list.do');
INSERT INTO `anthorty_info` VALUES ('20', '9', '钀ラ攢娲诲姩', 'marketactive/list.do', 'marketactive/list.do');
INSERT INTO `anthorty_info` VALUES ('21', '1', '鎷涚敓绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('22', '21', '瀛﹀憳姹�', 'studentpool/list.do', 'studentpool/list.do');
INSERT INTO `anthorty_info` VALUES ('23', '21', '鎷涚敓绾跨储', 'recruitstudent/list.do', 'recruitstudent/list.do');
INSERT INTO `anthorty_info` VALUES ('24', '21', '璺熻釜璁板綍', 'trackrecordinfo/list.do', 'trackrecordinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('25', '21', '璇曞惉璁板綍', 'auditioninfo/list.do', 'auditioninfo/list.do');
INSERT INTO `anthorty_info` VALUES ('26', '1', '鐝骇绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('27', '26', '瀛︾淇℃伅', 'disciplineinfo/list.do', 'disciplineinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('28', '26', '鏁欏绠＄悊', 'classroominfo/list.do', 'classroominfo/list.do');
INSERT INTO `anthorty_info` VALUES ('29', '26', '璇剧▼琛�', 'syllabusinfo/list.do', 'syllabusinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('30', '26', '鏁欏笀绠＄悊', 'teacher/list.do', 'teacher/list.do');
INSERT INTO `anthorty_info` VALUES ('31', '26', '鐝骇绠＄悊', 'classinfo/list.do', 'classinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('32', '1', '瀛﹀憳绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('33', '32', '瀛﹀憳璇勪环', 'evaluationinfo/list.do', 'evaluationinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('34', '32', '瀛﹀憳娌熼��', 'communicateinfo/list.do', 'communicateinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('35', '32', '瀛﹀憳鎴愮哗', 'studentwritegrade/list.do', 'studentwritegrade/list.do');
INSERT INTO `anthorty_info` VALUES ('36', '32', '瀛﹀憳绠＄悊', 'student/list.do', 'student/list.do');
INSERT INTO `anthorty_info` VALUES ('37', '1', '鏁欏姟绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('38', '37', '鐝骇浜嬪姟', 'classtransactioninfo/list.do', 'classtransactioninfo/list.do');
INSERT INTO `anthorty_info` VALUES ('39', '37', '瀛﹀憳鑰冨嫟', 'attendanceinfo/list.do', 'attendanceinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('40', '1', '璐㈠姟绠＄悊', '', '');
INSERT INTO `anthorty_info` VALUES ('41', '40', '瀛﹀憳缂磋垂', 'studentpayment/list.do', 'studentpayment/list.do');
INSERT INTO `anthorty_info` VALUES ('42', '40', '鍛樺伐钖按鍙戞斁', 'staffsalary/list.do', 'staffsalary/list.do');
INSERT INTO `attendance_info` VALUES ('1', '1', '鍫佃溅浜�1', '杩熷埌+鏃╅��', '2014-12-02 00:00:00', '涓嬫娉ㄦ剰1');
INSERT INTO `attendance_info` VALUES ('2', '2', 'a\'a', '鏃╅��', '2014-12-02 00:00:00', '鍟�');
INSERT INTO `audition_info` VALUES ('1', '1', '2014-11-25 00:00:00', '涓婃捣鍒嗛儴鍩硅瀹や竴', 'javaSE鍩虹', '瀹屽叏鍚笉鎳�11111111111');
INSERT INTO `audition_info` VALUES ('2', '1', '2014-11-25 00:00:00', '鍩硅瀹や竴', 'PHP', '鍚噦浜�');
INSERT INTO `audition_info` VALUES ('3', '2', '2014-11-25 00:00:00', '澶у攼瀵哄簷', 'JSP', '瀹屽叏涓嶆兂鍚�');
INSERT INTO `class_info` VALUES ('1', '1', '1', '1', '17', 'java涓�鐝�', '20', '2014-10-31 00:00:00', '2014-11-29 00:00:00', null, '1', '1111111111');
INSERT INTO `class_info` VALUES ('2', '2', '2', '2', '15', 'C++', '20', '2014-11-07 00:00:00', '2014-11-28 00:00:00', null, '1', 'www');
INSERT INTO `class_info` VALUES ('3', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('4', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('5', '1', '1', '1', '17', '11', null, null, null, null, '1', '11');
INSERT INTO `class_info` VALUES ('6', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('7', '2', '2', '2', '15', 'C++浜岀彮', null, '2014-11-12 00:00:00', '2014-11-28 00:00:00', null, '1', '11111111');
INSERT INTO `class_transaction_info` VALUES ('1', '2', '鍦ｈ癁鑺�1', '鍦ｈ癁鑺�1', '寮犱笁1', '2014-12-26 00:00:00', '鍦ｈ癁鑺�1');
INSERT INTO `class_transaction_info` VALUES ('3', '1', '骞冲畨澶�', '骞冲畨澶�', '骞冲畨澶�', '2014-12-31 00:00:00', '骞冲畨澶�');
INSERT INTO `classroom_info` VALUES ('1', '鍩硅涓�', '28', '鐢佃剳銆佹姇褰变华', '鍩硅涓�', '1');
INSERT INTO `classroom_info` VALUES ('2', '鍩硅浜�', '45', '鐢佃剳銆佹姇褰变华', '鍩硅涓�', '1');
INSERT INTO `classroom_info` VALUES ('3', '澶у煿璁�', '111', '鐢佃剳銆佹姇褰变华', 'a鍗曠畻', '1');
INSERT INTO `classroom_info` VALUES ('4', '', null, '', '', '0');
INSERT INTO `communicate_info` VALUES ('1', '1', '15', '2014-11-20 00:00:00', '闃夸笁澶ц嫃鎵�');
INSERT INTO `communicate_info` VALUES ('2', '3', '15', '2014-11-20 00:00:00', '鍟婂疄鎵撳疄鐨剆ss');
INSERT INTO `communicate_info` VALUES ('3', '1', '15', '2014-11-20 00:00:00', 'asda鏄痙');
INSERT INTO `data_dictionary` VALUES ('5', '璁″垝涓�', 'active_state', '钀ラ攢娲诲姩鐘舵��');
INSERT INTO `data_dictionary` VALUES ('6', '婵�娲�', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('7', '瀹屾垚', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('8', '鍙栨秷', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('9', '缃戠粶骞垮憡', 'active_type', '钀ラ攢娲诲姩绫诲瀷');
INSERT INTO `data_dictionary` VALUES ('10', '鐢佃瘽钀ラ攢', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('11', '閭欢钀ラ攢', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('12', '寰俊钀ラ攢', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('13', '闈炲父濂�', 'active_refect_estimate', '棰勬湡鍙嶅簲');
INSERT INTO `data_dictionary` VALUES ('14', '濂�', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('15', '涓�鑸�', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('16', '宸�', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('17', '鎰忓悜闈炲父寮�', 'student_sate', '瀛︾敓鎰忓悜鐘舵��');
INSERT INTO `data_dictionary` VALUES ('18', '鎰忓悜寮�', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('19', '鎰忓悜涓�', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('20', '鎰忓悜浣�', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('21', '瀹屽叏娌″叴瓒�', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('22', '鐜伴噾', 'payment_method', '缂磋垂鏂瑰紡');
INSERT INTO `data_dictionary` VALUES ('23', '淇＄敤鍗�', 'payment_method', 'payment_method');
INSERT INTO `data_dictionary` VALUES ('24', '閾惰鍗�', 'payment_method', '缂磋垂鏂瑰紡');
INSERT INTO `discipline_info` VALUES ('1', 'java鍩虹璇剧▼', '10200', '120', '闈㈠悜瀵硅薄', '1');
INSERT INTO `discipline_info` VALUES ('2', 'C++璇剧▼', '10200', '11', '11', '1');
INSERT INTO `discipline_info` VALUES ('3', '.Net鍩虹璇剧▼', '1580', '30', '瀛︿範鍩虹  瀛︿範妗嗘灦 鍩虹', '1');
INSERT INTO `discipline_info` VALUES ('4', '11', '11', '111', '111', '0');
INSERT INTO `email_info` VALUES ('3', '15', '鍥藉簡鑺傞�佺ぜ', '鍥藉簡鑺傚浗搴嗚妭鍥藉簡鑺傚浗搴嗚妭', '2014-11-22 17:07:46', '寮犱笁', 'beifeng1003@163.com', null);
INSERT INTO `email_info` VALUES ('4', '15', '浠婂ぉ鏅氫笂鍘诲悆鐏攨', '浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨浠婂ぉ鏅氫笂鍘诲悆鐏攨', '2014-11-22 17:08:42', '鐜嬮夯瀛�', 'beifeng1003@163.com', null);
INSERT INTO `email_info` VALUES ('6', '15', '鏄庡ぉ鍘荤埇灞�', '鏄庡ぉ鍘荤埇灞辨槑澶╁幓鐖北鏄庡ぉ鍘荤埇灞辨槑澶╁幓鐖北鏄庡ぉ鍘荤埇灞�', '2014-11-22 17:28:58', '寮犱笁', 'beifeng1003@163.com', null);
INSERT INTO `evaluation_info` VALUES ('1', '1', '涓婅鍐呭', '寰堝ソ', 'java鍩虹', '鐧介緳椹�', '2014-11-30 01:36:13');
INSERT INTO `evaluation_info` VALUES ('2', null, '鍟婂晩鍟�', '寰堜笉鍝堝摝', 'java', '鐗涜�佸笀', '2014-11-30 00:00:00');
INSERT INTO `evaluation_info` VALUES ('3', null, '鍟婂晩鍟�', '浜嬪疄涓�', 'java', '鐗涜�佸笀', '2014-11-07 00:00:00');
INSERT INTO `evaluation_info` VALUES ('4', '3', '鍟婂晩鍟�1', '3333333333', 'java1', '鐗涜�佸笀1', '2014-12-01 00:00:00');
INSERT INTO `evaluation_info` VALUES ('6', '1', '鍟婂晩鍟�', '', 'java', '鐗涜�佸笀', '2014-12-04 00:00:00');
INSERT INTO `evaluation_info` VALUES ('7', '1', '椤圭洰瀹炴垬瀛︿範璇勪环', '寰堝ソ寰堜笉閿�', 'java', '寮犱笁', '2014-12-04 22:28:01');
INSERT INTO `evaluation_info` VALUES ('8', '1', '11', '111', '11', '11', '2014-12-04 22:28:13');
INSERT INTO `market_active` VALUES ('1', '15', '鎷涚敓淇℃伅', '6', '2014-10-31 00:00:00', '2014-11-27 00:00:00', '11', '200', '150', '13', '150涓�', '123131');
INSERT INTO `market_active` VALUES ('3', '15', '寰堝ソ鐨勭殑娲诲姩', '5', '2014-11-18 00:00:00', '2014-11-26 00:00:00', '9', '11', '11', '14', '11', '11');
INSERT INTO `messafe_info` VALUES ('1', '13', '鐢熸棩蹇箰', '鏉庡洓', '111111111', '2014-11-20 15:29:01', null);
INSERT INTO `messafe_info` VALUES ('15', '13', '绁濇偍鐢熸棩蹇箰222222222222', '鐜嬩簲', '2222222', '2014-11-20 16:07:40', null);
INSERT INTO `messafe_info` VALUES ('16', '15', '鏄ヨ妭瑕侀�佺ぜ', '寮犲皬涓�', '123443309', '2014-11-20 16:12:24', null);
INSERT INTO `messafe_info` VALUES ('17', '15', '绁濇偍鐢熸棩蹇箰', '45', '1521111111', '2014-11-20 16:13:04', null);
INSERT INTO `messafe_info` VALUES ('18', '15', '绁濇偍鐢熸棩蹇箰', '12321', '1234433094', '2014-11-20 16:13:34', null);
INSERT INTO `messafe_info` VALUES ('20', null, '绁濇偍鐢熸棩蹇箰', '123', '213213123', null, null);
INSERT INTO `messafe_info` VALUES ('21', '15', '鏄ヨ妭瑕侀�佺ぜ11111111111111111', '1111111111', '11111111', '2014-11-20 16:22:46', null);
INSERT INTO `role_anthority_info` VALUES ('12', '2', '9');
INSERT INTO `role_anthority_info` VALUES ('419', '1', '2');
INSERT INTO `role_anthority_info` VALUES ('420', '1', '11');
INSERT INTO `role_anthority_info` VALUES ('421', '1', '12');
INSERT INTO `role_anthority_info` VALUES ('422', '1', '13');
INSERT INTO `role_anthority_info` VALUES ('423', '1', '14');
INSERT INTO `role_anthority_info` VALUES ('424', '1', '15');
INSERT INTO `role_anthority_info` VALUES ('425', '1', '16');
INSERT INTO `role_anthority_info` VALUES ('426', '1', '9');
INSERT INTO `role_anthority_info` VALUES ('427', '1', '17');
INSERT INTO `role_anthority_info` VALUES ('428', '1', '18');
INSERT INTO `role_anthority_info` VALUES ('429', '1', '19');
INSERT INTO `role_anthority_info` VALUES ('430', '1', '20');
INSERT INTO `role_anthority_info` VALUES ('431', '1', '21');
INSERT INTO `role_anthority_info` VALUES ('432', '1', '22');
INSERT INTO `role_anthority_info` VALUES ('433', '1', '23');
INSERT INTO `role_anthority_info` VALUES ('434', '1', '24');
INSERT INTO `role_anthority_info` VALUES ('435', '1', '25');
INSERT INTO `role_anthority_info` VALUES ('436', '1', '26');
INSERT INTO `role_anthority_info` VALUES ('437', '1', '27');
INSERT INTO `role_anthority_info` VALUES ('438', '1', '28');
INSERT INTO `role_anthority_info` VALUES ('439', '1', '29');
INSERT INTO `role_anthority_info` VALUES ('440', '1', '30');
INSERT INTO `role_anthority_info` VALUES ('441', '1', '31');
INSERT INTO `role_anthority_info` VALUES ('442', '1', '32');
INSERT INTO `role_anthority_info` VALUES ('443', '1', '33');
INSERT INTO `role_anthority_info` VALUES ('444', '1', '34');
INSERT INTO `role_anthority_info` VALUES ('445', '1', '35');
INSERT INTO `role_anthority_info` VALUES ('446', '1', '36');
INSERT INTO `role_anthority_info` VALUES ('447', '1', '37');
INSERT INTO `role_anthority_info` VALUES ('448', '1', '38');
INSERT INTO `role_anthority_info` VALUES ('449', '1', '39');
INSERT INTO `role_anthority_info` VALUES ('450', '1', '40');
INSERT INTO `role_anthority_info` VALUES ('451', '1', '41');
INSERT INTO `role_anthority_info` VALUES ('452', '1', '42');
INSERT INTO `role_info` VALUES ('1', '瓒呯骇绠＄悊鍛�', '澶╁ぉ绠″鐢�', '1');
INSERT INTO `role_info` VALUES ('2', '鎷涚敓浜哄憳', '鎵句汉鍩硅 ', '1');
INSERT INTO `role_info` VALUES ('3', '缃戝ぇ绠�', '澶╁ぉ淇數鑴戯紝澶╁ぉ鎺ョ綉绾�', '1');
INSERT INTO `role_info` VALUES ('4', 'java鑰佸笀', '涓妀avaSE 璇剧▼', '1');
INSERT INTO `staff_info` VALUES ('13', '1', '鎮熺┖', '淇濆瘑', null, '', '', null, '', '', '', '', '', null, '淇濆瘑', '', '1', 'admin2', '');
INSERT INTO `staff_info` VALUES ('14', '1', '鍞愬儳123', '濂�', '25', '澶у攼', '5001420198820203xxxxx', '2014-11-08 00:00:00', '123-12313213111', '2234567890', 'xxxxx123@qq.com', '闀垮畨瀵哄簷123', '123123', '2014-11-18 00:00:00', '纭曞＋', '蹇电粡鐨� 蹇电粡鐨� 蹇电粡鐨� ', '1', 'admin1', '1231');
INSERT INTO `staff_info` VALUES ('15', '1', '鐧介緳椹�', '鐢�', '400', '', '', '2014-11-06 00:00:00', '', '', '', '', '', '2014-11-01 00:00:00', '淇濆瘑', '    ', '2', 'admin', '123');
INSERT INTO `staff_info` VALUES ('16', null, '绠＄悊鍛�', '淇濆瘑', null, '', '', null, '', '', '', '', '', null, '淇濆瘑', '', '1', 'admin1001', '123');
INSERT INTO `staff_info` VALUES ('17', null, '寮犱笁', '淇濆瘑', '123', '澶у攼', '5001420198820203432', '2014-11-29 00:00:00', '123-12313213111', '1234567890', '1321313', '12', '21313', '2014-11-29 00:00:00', '鍗氬＋', ' ', '2', 'admin123', '123123');
INSERT INTO `staff_salary` VALUES ('1', '13', '15', '100', '200', '800', '0', null, '钀ㄨ揪');
INSERT INTO `staff_salary` VALUES ('2', '17', '15', '1000', '200', '800', '1', '2014-12-02 21:21:35', '姘存按姘存按姘存按姘�');
INSERT INTO `staff_salary` VALUES ('3', '13', '15', '1000', '200', '800', '1', '2014-12-02 21:21:59', '111');
INSERT INTO `student_info` VALUES ('1', '15', null, '鏈卞叓鎴�', '鐢�', '1500', '3213131231231', '11231313@qq.com', '324234242234242x', '楂樿�佸簞x', '', '绀句細澶уx', '10001', '涓嶇煡閬搙', '123445611', '涓婃捣x', '涓婃捣x', null, '1', '17', '2', '钀ㄨ揪鐨剎', 'admin', '123456');
INSERT INTO `student_info` VALUES ('2', '15', '1', '123456', '鐢�', '3500', '1231313', '1231313@qq.com', '5020310230213xxxx', '涓婃捣', '2014-11-05', '绀句細澶у', '12111', '澶╁湴', '11111', '鑺辨灉灞�', '姘村笜娲�', null, null, '18', '2', '1111111111111111111', '1231313@qq.com', null);
INSERT INTO `student_info` VALUES ('3', null, null, '111111', '淇濆瘑', null, '', '', '', '', '', '', '', '', '', '', '', null, null, '17', '-1', '', null, null);
INSERT INTO `student_info` VALUES ('4', '15', null, '111', '淇濆瘑', null, '', '', '', '', '', '', '', '', '', '', '', null, null, null, '-1', '', null, null);
INSERT INTO `student_info` VALUES ('5', '15', null, '寮犱笁', '淇濆瘑', null, '13423333333', '', '', '', '', '', '31231313', '', '', '骞垮窞', '', null, null, '17', '1', '', null, null);
INSERT INTO `student_info` VALUES ('6', null, null, '111', '淇濆瘑', null, '', '', '', '', '', '', '', '', '', '閲嶅簡', '', null, null, '20', '0', '', null, null);
INSERT INTO `student_info` VALUES ('7', '15', null, '13213', '淇濆瘑', null, '13422222222', '', '', '', '', '', '13422222222', '', '', '閲嶅簡', '', null, null, '19', '1', '', null, null);
INSERT INTO `student_info` VALUES ('8', '15', null, '21321', '淇濆瘑', null, '', '', '', '', '', '', '', '', '', '涓婃捣', '', null, null, '19', '1', '', null, null);
INSERT INTO `student_info` VALUES ('9', '15', null, '231313', '淇濆瘑', null, '', '', '', '', '', '', '', '', '', '鍖椾含', '', null, null, '21', '1', '', null, null);
INSERT INTO `student_payment` VALUES ('1', '1', '15', '浠婂ぉ缂磋垂', null, '2014-12-02 00:00:00', '200', '1000', '600', '200', '闃胯开浠�');
INSERT INTO `student_payment` VALUES ('3', '1', '15', 'java鍩虹璐圭敤', '22', '2014-12-04 00:00:00', '200', '1000', '600', '200', '闃挎柉椤挎拻');
INSERT INTO `student_payment` VALUES ('4', '1', '15', 'java鍩虹璐圭敤', '22', '2014-12-04 00:00:00', '200', '1000', '600', '200', '闃挎柉椤挎拻');
INSERT INTO `student_write_grade` VALUES ('1', '1', '15', 'java', '60', '2014-11-18 00:00:00', 'aaaaaaaaaaaa');
INSERT INTO `student_write_grade` VALUES ('2', '1', '15', 'C++', '80', '2014-11-30 00:00:00', 'cccccccccccc');
INSERT INTO `student_write_grade` VALUES ('3', '3', '15', 'java', '79', '2014-11-30 00:00:00', '');
INSERT INTO `syllabus_info` VALUES ('1', '涓婂崍涓婅', '涓婁笅涓婅', '涓婁笅涓婅', '涓婁笅涓婅', '涓婁笅涓婅', '涓嶄笂璇�', '涓嶄笂璇�', '1', 'java璇剧▼');
INSERT INTO `syllabus_info` VALUES ('2', '涓婂崍涓婅', '涓婁笅涓婅', '', '', '', '', '', '1', 'C++璇剧▼');
INSERT INTO `syllabus_info` VALUES ('3', '', '', '', '', '', '', '', '0', '');
INSERT INTO `template_info` VALUES ('1', '鐢熸棩鎻愰啋', '绁濇偍鐢熸棩蹇箰', '鐭俊');
INSERT INTO `template_info` VALUES ('3', '鏄ヨ妭', '鏄ヨ妭瑕侀�佺ぜ', '鐭俊');
INSERT INTO `template_info` VALUES ('4', '鍥藉簡鑺傞�佺ぜ', '鍥藉簡鑺傚浗搴嗚妭鍥藉簡鑺傚浗搴嗚妭', '閭欢');
INSERT INTO `track_record_info` VALUES ('1', '1', '鐚叓鎴掓姤鍚峧ava绋嬪簭鍛�', 'java浼佷笟绾у紑鍙戜汉鍛�', '2014-11-25 00:00:00', '19', '2014-11-30 00:00:00');
INSERT INTO `track_record_info` VALUES ('2', '2', 'PHP瀛︿範', 'ssada1111111', '2014-11-24 00:00:00', '17', '2014-11-26 00:00:00');
INSERT INTO `track_record_info` VALUES ('5', '1', 'java椤圭洰瀛︿範', 'java椤圭洰瀛︿範java椤圭洰瀛︿範java椤圭洰瀛︿範java椤圭洰瀛︿範', '2014-11-26 00:00:00', '18', '2014-11-28 00:00:00');
INSERT INTO `track_record_info` VALUES ('6', '5', 'java椤圭洰瀛︿範', 'java椤圭洰瀛︿範java椤圭洰瀛︿範', '2014-12-03 00:00:00', '17', '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('7', '7', 'java椤圭洰瀛︿範', 'java椤圭洰瀛︿範', '2014-12-16 00:00:00', '18', '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('8', '8', '', 'java椤圭洰瀛︿範', null, null, '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('9', '9', '', 'java椤圭洰瀛︿範java椤圭洰瀛︿範', null, null, '2014-12-04 00:00:00');
