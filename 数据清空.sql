TRUNCATE `xunjian`.`xj_content_event`;
TRUNCATE `xunjian`.`xj_content_meter`;
TRUNCATE `xunjian`.`xj_content_picture`;
DELETE FROM `xunjian`.`xj_content` WHERE `content_id`>0;
