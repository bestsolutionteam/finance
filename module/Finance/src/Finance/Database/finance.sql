use finance;

DROP TABLE `tests`;
CREATE TABLE `tests` (
	`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`test` varchar(50) NOT NULL DEFAULT '',
	`result` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `finance`.`tests` (`id`, `test`, `result`) VALUES ('1', 'test1', 'result1');
INSERT INTO `finance`.`tests` (`id`, `test`, `result`) VALUES ('2', 'test2', 'result2');

DROP TALBE `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL auto_increment,
  `artist` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `finance`.`album` (`id`, `artist`, `title`) VALUES 
('8', 'artist3', 'test2'), 
('9', 'artist6', 'test9');

DROP TABLE `users`;
CREATE TABLE `users` (
	`uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid`  int(11) UNSIGNED NOT NULL DEFAULT '0',
	`hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`createdTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`createdUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeStart` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeEnd` int(11) UNSIGNED NOT NULL DEFAULT '0',

	`username` varchar(50) NOT NULL DEFAULT '',
	`password` varchar(50) NOT NULL DEFAULT '',
	`email` varchar(50) NOT NULL DEFAULT '',
	`lastLoginTime` int(11) UNSIGNED NOT NULL DEFAULT '0',

	`firstname` varchar(50) NOT NULL DEFAULT '',
	`lastname` varchar(50) NOT NULL DEFAULT '',

	PRIMARY KEY (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `finance`.`users` (`uid`, `pid`, `hidden`, `disabled`, `deleted`, `createdTime`, `createdUserUid`, `lastModifiedTime`, `lastModifiedUserUid`, `validTimeStart`, `validTimeEnd`, `username`, `password`, `email`, `lastLoginTime`, `firstname`, `lastname`) 
VALUES 
('1', '0', '0', '0', '0', '1353407722', '0', '1353407722', '0', '1353407722', '1353407722', 'speeder', 'password', 'speeder.nfh@gmail.com', '1353407722', 'Speeder', 'NFH'),
('2', '0', '0', '0', '0', '1353407722', '0', '1353407722', '0', '1353407722', '1353407722', 'username', 'password', 'username@gmail.com', '1353407722', 'Firstname', 'Lastname');

DROP TABLE `rights`;
CREATE TABLE `rights` (
	`uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid`  int(11) UNSIGNED NOT NULL DEFAULT '0',
	`hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`createdTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`createdUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeStart` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeEnd` int(11) UNSIGNED NOT NULL DEFAULT '0',

	`title` varchar(50) NOT NULL DEFAULT '',

	PRIMARY KEY (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE `accounts`;
CREATE TABLE `accounts` (
	`uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid`  int(11) UNSIGNED NOT NULL DEFAULT '0',
	`hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`createdTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`createdUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeStart` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeEnd` int(11) UNSIGNED NOT NULL DEFAULT '0',

	`amount` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`userUid` int(11) UNSIGNED NOT NULL DEFAULT '0',

	PRIMARY KEY (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE `histories`;
CREATE TABLE `histories` (
	`uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid`  int(11) UNSIGNED NOT NULL DEFAULT '0',
	`hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	`createdTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`createdUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedTime` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`lastModifiedUserUid` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeStart` int(11) UNSIGNED NOT NULL DEFAULT '0',
	`validTimeEnd` int(11) UNSIGNED NOT NULL DEFAULT '0',

	`transferedAmount` int(11) NOT NULL DEFAULT '0',
	`accountUid` int(11) UNSIGNED NOT NULL DEFAULT '0',

	PRIMARY KEY (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;