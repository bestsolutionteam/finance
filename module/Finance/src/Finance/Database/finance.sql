-- Database: `finance`
DROP DATABASE finance;
CREATE DATABASE finance
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE finance;

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdTime` int(11) unsigned NOT NULL DEFAULT '0',
  `createdUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedTime` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeStart` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeEnd` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `userUid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `artist`, `title`) VALUES
(3, 'artist3', 'test2'),
(4, 'artist6', 'test'),
(8, 'artist3', 'test2'),
(9, 'artist6', 'test9');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE IF NOT EXISTS `histories` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdTime` int(11) unsigned NOT NULL DEFAULT '0',
  `createdUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedTime` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeStart` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeEnd` int(11) unsigned NOT NULL DEFAULT '0',
  `transferedAmount` int(11) NOT NULL DEFAULT '0',
  `accountUid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE IF NOT EXISTS `rights` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdTime` int(11) unsigned NOT NULL DEFAULT '0',
  `createdUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedTime` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeStart` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeEnd` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test` varchar(50) NOT NULL DEFAULT '',
  `result` varchar(50) NOT NULL DEFAULT '',
  `result1` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `test`, `result`, `result1`) VALUES
(1, 'test1', 'result1', ''),
(2, 'test2', 'result2', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `display_name`, `password`, `state`) VALUES
(1, NULL, 'speeder.nfh@gmail.com', NULL, '$2y$14$IhJplUXeTqc1N8LRbDWi2uitU3nOHWo6OAMaTUQYTjNssaY4pxVay', NULL),
(2, NULL, 'chheang.oeng@gmail.com', NULL, '$2y$14$YtQbth4nICE65BDK8KXFduJcS68f0EBJp37y.y2b7pBNOi.yvxWEK', NULL),
(3, NULL, 'chheang.oeng1@gmail.com', NULL, '$2y$14$2NxpUeg1ScQ.LqMy3v5PeuxNqac.w1XtgjRpND07lIRfpBZgO1OOe', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdTime` int(11) unsigned NOT NULL DEFAULT '0',
  `createdUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedTime` int(11) unsigned NOT NULL DEFAULT '0',
  `lastModifiedUserUid` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeStart` int(11) unsigned NOT NULL DEFAULT '0',
  `validTimeEnd` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `lastLoginTime` int(11) unsigned NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `pid`, `hidden`, `disabled`, `deleted`, `createdTime`, `createdUserUid`, `lastModifiedTime`, `lastModifiedUserUid`, `validTimeStart`, `validTimeEnd`, `username`, `password`, `email`, `lastLoginTime`, `firstname`, `lastname`) VALUES
(1, 0, 0, 0, 0, 1353407722, 0, 1353407722, 0, 1353407722, 1353407722, 'speeder', 'password', 'speeder.nfh@gmail.com', 1353407722, 'Speeder', 'NFH'),
(2, 0, 0, 0, 0, 1353407722, 0, 1353407722, 0, 1353407722, 1353407722, 'username', 'password', 'username@gmail.com', 1353407722, 'Firstname', 'Lastname');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `role_id` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `default`, `parent`) VALUES
('admin', 0, 'user'),
('guest', 1, NULL),
('user', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_linker`
--

CREATE TABLE IF NOT EXISTS `user_role_linker` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role_linker`
--

INSERT INTO `user_role_linker` (`user_id`, `role_id`) VALUES
(1, 'user'),
(2, 'user'),
(3, 'user');
