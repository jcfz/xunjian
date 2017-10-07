ALTER TABLE `xunjian`.`xj_templet_point`
ADD COLUMN `order_by` INT NULL DEFAULT 0 AFTER `point_id`;

ALTER TABLE `xunjian`.`xj_templet_point`
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`, `templet_id`, `point_id`);
