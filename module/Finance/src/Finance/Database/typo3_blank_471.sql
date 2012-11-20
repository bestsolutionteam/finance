-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2012 at 01:02 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `typo3_blank_471`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_layout`
--

CREATE TABLE IF NOT EXISTS `backend_layout` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `config` text NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `be_groups`
--

CREATE TABLE IF NOT EXISTS `be_groups` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `non_exclude_fields` text,
  `explicit_allowdeny` text,
  `allowed_languages` varchar(255) NOT NULL DEFAULT '',
  `custom_options` text,
  `db_mountpoints` varchar(255) NOT NULL DEFAULT '',
  `pagetypes_select` varchar(255) NOT NULL DEFAULT '',
  `tables_select` text,
  `tables_modify` text,
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `groupMods` text,
  `file_mountpoints` varchar(255) NOT NULL DEFAULT '',
  `fileoper_perms` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inc_access_lists` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `lockToDomain` varchar(50) NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text,
  `subgroup` varchar(255) NOT NULL DEFAULT '',
  `hide_in_lists` tinyint(4) NOT NULL DEFAULT '0',
  `workspace_perms` tinyint(3) NOT NULL DEFAULT '1',
  `tx_templavoila_access` text,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `be_sessions`
--

CREATE TABLE IF NOT EXISTS `be_sessions` (
  `ses_id` varchar(32) NOT NULL DEFAULT '',
  `ses_name` varchar(32) NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) NOT NULL DEFAULT '',
  `ses_hashlock` int(11) NOT NULL DEFAULT '0',
  `ses_userid` int(11) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `ses_data` longtext,
  `ses_backuserid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`,`ses_name`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `be_users`
--

CREATE TABLE IF NOT EXISTS `be_users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL DEFAULT '',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `usergroup` varchar(255) NOT NULL DEFAULT '',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` char(2) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `db_mountpoints` varchar(255) NOT NULL DEFAULT '',
  `options` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `realName` varchar(80) NOT NULL DEFAULT '',
  `userMods` varchar(255) NOT NULL DEFAULT '',
  `allowed_languages` varchar(255) NOT NULL DEFAULT '',
  `uc` mediumtext,
  `file_mountpoints` varchar(255) NOT NULL DEFAULT '',
  `fileoper_perms` tinyint(4) NOT NULL DEFAULT '0',
  `workspace_perms` tinyint(3) NOT NULL DEFAULT '1',
  `lockToDomain` varchar(50) NOT NULL DEFAULT '',
  `disableIPlock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `createdByAction` int(11) NOT NULL DEFAULT '0',
  `usergroup_cached_list` varchar(255) NOT NULL DEFAULT '',
  `workspace_id` int(11) NOT NULL DEFAULT '0',
  `workspace_preview` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `cache_extensions`
--

CREATE TABLE IF NOT EXISTS `cache_extensions` (
  `extkey` varchar(60) NOT NULL DEFAULT '',
  `repository` int(11) unsigned NOT NULL DEFAULT '1',
  `version` varchar(10) NOT NULL DEFAULT '',
  `alldownloadcounter` int(11) unsigned NOT NULL DEFAULT '0',
  `downloadcounter` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` mediumtext,
  `state` int(4) NOT NULL DEFAULT '0',
  `reviewstate` int(4) NOT NULL DEFAULT '0',
  `category` int(4) NOT NULL DEFAULT '0',
  `lastuploaddate` int(11) unsigned NOT NULL DEFAULT '0',
  `dependencies` mediumtext,
  `authorname` varchar(100) NOT NULL DEFAULT '',
  `authoremail` varchar(100) NOT NULL DEFAULT '',
  `ownerusername` varchar(50) NOT NULL DEFAULT '',
  `t3xfilemd5` varchar(35) NOT NULL DEFAULT '',
  `uploadcomment` mediumtext,
  `authorcompany` varchar(100) NOT NULL DEFAULT '',
  `intversion` int(11) NOT NULL DEFAULT '0',
  `lastversion` int(3) NOT NULL DEFAULT '0',
  `lastreviewedversion` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`extkey`,`version`,`repository`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_imagesizes`
--

CREATE TABLE IF NOT EXISTS `cache_imagesizes` (
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `md5filename` varchar(32) NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `imagewidth` mediumint(11) unsigned NOT NULL DEFAULT '0',
  `imageheight` mediumint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_md5params`
--

CREATE TABLE IF NOT EXISTS `cache_md5params` (
  `md5hash` varchar(20) NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_treelist`
--

CREATE TABLE IF NOT EXISTS `cache_treelist` (
  `md5hash` char(32) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `treelist` text,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_typo3temp_log`
--

CREATE TABLE IF NOT EXISTS `cache_typo3temp_log` (
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `orig_filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_hash`
--

CREATE TABLE IF NOT EXISTS `cf_cache_hash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_hash_tags`
--

CREATE TABLE IF NOT EXISTS `cf_cache_hash_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_pages`
--

CREATE TABLE IF NOT EXISTS `cf_cache_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_pagesection`
--

CREATE TABLE IF NOT EXISTS `cf_cache_pagesection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_pagesection_tags`
--

CREATE TABLE IF NOT EXISTS `cf_cache_pagesection_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_cache_pages_tags`
--

CREATE TABLE IF NOT EXISTS `cf_cache_pages_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_extbase_object`
--

CREATE TABLE IF NOT EXISTS `cf_extbase_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_extbase_object_tags`
--

CREATE TABLE IF NOT EXISTS `cf_extbase_object_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_extbase_reflection`
--

CREATE TABLE IF NOT EXISTS `cf_extbase_reflection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_extbase_reflection_tags`
--

CREATE TABLE IF NOT EXISTS `cf_extbase_reflection_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_news_categorycache`
--

CREATE TABLE IF NOT EXISTS `cf_news_categorycache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  `lifetime` int(11) unsigned NOT NULL DEFAULT '0',
  `expires` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cf_news_categorycache_tags`
--

CREATE TABLE IF NOT EXISTS `cf_news_categorycache_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fe_groups`
--

CREATE TABLE IF NOT EXISTS `fe_groups` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lockToDomain` varchar(50) NOT NULL DEFAULT '',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `subgroup` tinytext,
  `TSconfig` text,
  `tx_extbase_type` varchar(255) NOT NULL DEFAULT '',
  `felogin_redirectPid` tinytext,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fe_sessions`
--

CREATE TABLE IF NOT EXISTS `fe_sessions` (
  `ses_id` varchar(32) NOT NULL DEFAULT '',
  `ses_name` varchar(32) NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) NOT NULL DEFAULT '',
  `ses_hashlock` int(11) NOT NULL DEFAULT '0',
  `ses_userid` int(11) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `ses_data` blob,
  `ses_permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`,`ses_name`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fe_session_data`
--

CREATE TABLE IF NOT EXISTS `fe_session_data` (
  `hash` varchar(32) NOT NULL DEFAULT '',
  `content` mediumblob,
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hash`),
  KEY `tstamp` (`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fe_users`
--

CREATE TABLE IF NOT EXISTS `fe_users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL DEFAULT '',
  `usergroup` tinytext,
  `disable` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `fax` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lockToDomain` varchar(50) NOT NULL DEFAULT '',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uc` blob,
  `title` varchar(40) NOT NULL DEFAULT '',
  `zip` varchar(10) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(40) NOT NULL DEFAULT '',
  `www` varchar(80) NOT NULL DEFAULT '',
  `company` varchar(80) NOT NULL DEFAULT '',
  `image` tinytext,
  `TSconfig` text,
  `fe_cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `is_online` int(10) unsigned NOT NULL DEFAULT '0',
  `tx_extbase_type` varchar(255) NOT NULL DEFAULT '',
  `felogin_redirectPid` tinytext,
  `felogin_forgotHash` varchar(80) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`),
  KEY `username` (`username`),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_swapmode` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `perms_userid` int(11) unsigned NOT NULL DEFAULT '0',
  `perms_groupid` int(11) unsigned NOT NULL DEFAULT '0',
  `perms_user` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `perms_group` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `perms_everybody` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `editlock` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `doktype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text,
  `storage_pid` int(11) NOT NULL DEFAULT '0',
  `is_siteroot` tinyint(4) NOT NULL DEFAULT '0',
  `php_tree_stop` tinyint(4) NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `urltype` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
  `no_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(100) NOT NULL DEFAULT '0',
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `layout` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `url_scheme` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target` varchar(80) NOT NULL DEFAULT '',
  `media` text,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` text,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `newUntil` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `no_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT '0',
  `abstract` text,
  `module` varchar(10) NOT NULL DEFAULT '',
  `extendToSubpages` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_email` varchar(80) NOT NULL DEFAULT '',
  `nav_title` varchar(255) NOT NULL DEFAULT '',
  `nav_hide` tinyint(4) NOT NULL DEFAULT '0',
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid_ol` tinyint(4) NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL DEFAULT '',
  `l18n_cfg` tinyint(4) NOT NULL DEFAULT '0',
  `fe_login_mode` tinyint(4) NOT NULL DEFAULT '0',
  `backend_layout` int(10) NOT NULL DEFAULT '0',
  `backend_layout_next_level` int(10) NOT NULL DEFAULT '0',
  `tx_templavoila_ds` varchar(100) NOT NULL DEFAULT '',
  `tx_templavoila_to` int(11) NOT NULL DEFAULT '0',
  `tx_templavoila_next_ds` varchar(100) NOT NULL DEFAULT '',
  `tx_templavoila_next_to` int(11) NOT NULL DEFAULT '0',
  `tx_templavoila_flex` mediumtext,
  `image_icon` varchar(255) NOT NULL DEFAULT '',
  `link_to_page` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`sorting`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages_language_overlay`
--

CREATE TABLE IF NOT EXISTS `pages_language_overlay` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `doktype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `nav_title` varchar(255) NOT NULL DEFAULT '',
  `media` text,
  `keywords` text,
  `description` text,
  `abstract` text,
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_email` varchar(80) NOT NULL DEFAULT '',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  `l18n_diffsource` mediumblob,
  `url` varchar(255) NOT NULL DEFAULT '',
  `urltype` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_countries`
--

CREATE TABLE IF NOT EXISTS `static_countries` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cn_iso_2` char(2) DEFAULT '',
  `cn_iso_3` char(3) DEFAULT '',
  `cn_iso_nr` int(11) unsigned DEFAULT '0',
  `cn_parent_tr_iso_nr` int(11) unsigned DEFAULT '0',
  `cn_official_name_local` varchar(128) DEFAULT '',
  `cn_official_name_en` varchar(128) DEFAULT '',
  `cn_capital` varchar(45) DEFAULT '',
  `cn_tldomain` char(2) DEFAULT '',
  `cn_currency_iso_3` char(3) DEFAULT '',
  `cn_currency_iso_nr` int(10) unsigned DEFAULT '0',
  `cn_phone` int(10) unsigned DEFAULT '0',
  `cn_eu_member` tinyint(3) unsigned DEFAULT '0',
  `cn_address_format` tinyint(3) unsigned DEFAULT '0',
  `cn_zone_flag` tinyint(4) DEFAULT '0',
  `cn_short_local` varchar(70) DEFAULT '',
  `cn_short_en` varchar(50) DEFAULT '',
  `cn_uno_member` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=253 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_country_zones`
--

CREATE TABLE IF NOT EXISTS `static_country_zones` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `zn_country_iso_2` char(2) DEFAULT '',
  `zn_country_iso_3` char(3) DEFAULT '',
  `zn_country_iso_nr` int(11) unsigned DEFAULT '0',
  `zn_code` varchar(45) DEFAULT '',
  `zn_name_local` varchar(128) DEFAULT '',
  `zn_name_en` varchar(50) DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=689 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_currencies`
--

CREATE TABLE IF NOT EXISTS `static_currencies` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `cu_iso_3` char(3) DEFAULT '',
  `cu_iso_nr` int(11) unsigned DEFAULT '0',
  `cu_name_en` varchar(50) DEFAULT '',
  `cu_symbol_left` varchar(12) DEFAULT '',
  `cu_symbol_right` varchar(12) DEFAULT '',
  `cu_thousands_point` char(1) DEFAULT '',
  `cu_decimal_point` char(1) DEFAULT '',
  `cu_decimal_digits` tinyint(3) unsigned DEFAULT '0',
  `cu_sub_name_en` varchar(20) DEFAULT '',
  `cu_sub_divisor` int(11) DEFAULT '1',
  `cu_sub_symbol_left` varchar(12) DEFAULT '',
  `cu_sub_symbol_right` varchar(12) DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=177 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_languages`
--

CREATE TABLE IF NOT EXISTS `static_languages` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `lg_iso_2` char(2) DEFAULT '',
  `lg_name_en` varchar(50) DEFAULT '',
  `lg_typo3` char(2) DEFAULT '',
  `lg_country_iso_2` char(2) DEFAULT '',
  `lg_collate_locale` varchar(5) DEFAULT '',
  `lg_name_local` varchar(99) DEFAULT '',
  `lg_sacred` tinyint(3) unsigned DEFAULT '0',
  `lg_constructed` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=193 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_territories`
--

CREATE TABLE IF NOT EXISTS `static_territories` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `tr_iso_nr` int(11) unsigned DEFAULT '0',
  `tr_parent_iso_nr` int(11) unsigned DEFAULT '0',
  `tr_name_en` varchar(50) DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_tsconfig_help`
--

CREATE TABLE IF NOT EXISTS `static_tsconfig_help` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `guide` int(11) NOT NULL DEFAULT '0',
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `description` text,
  `obj_string` varchar(255) NOT NULL DEFAULT '',
  `appdata` blob,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `guide` (`guide`,`md5hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_be_shortcuts`
--

CREATE TABLE IF NOT EXISTS `sys_be_shortcuts` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `url` text,
  `description` varchar(255) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sc_group` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_collection`
--

CREATE TABLE IF NOT EXISTS `sys_collection` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `fe_group` int(11) NOT NULL DEFAULT '0',
  `title` tinytext,
  `description` text,
  `type` varchar(32) NOT NULL DEFAULT 'static',
  `table_name` tinytext,
  `items` int(11) NOT NULL DEFAULT '0',
  `criteria` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_collection_entries`
--

CREATE TABLE IF NOT EXISTS `sys_collection_entries` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_domain`
--

CREATE TABLE IF NOT EXISTS `sys_domain` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `domainName` varchar(80) NOT NULL DEFAULT '',
  `redirectTo` varchar(255) NOT NULL DEFAULT '',
  `redirectHttpStatusCode` int(4) unsigned NOT NULL DEFAULT '301',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `prepend_params` int(10) NOT NULL DEFAULT '0',
  `forced` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_filemounts`
--

CREATE TABLE IF NOT EXISTS `sys_filemounts` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `path` varchar(120) NOT NULL DEFAULT '',
  `base` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_history`
--

CREATE TABLE IF NOT EXISTS `sys_history` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sys_log_uid` int(11) NOT NULL DEFAULT '0',
  `history_data` mediumtext,
  `fieldlist` text,
  `recuid` int(11) NOT NULL DEFAULT '0',
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `history_files` mediumtext,
  `snapshot` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`,`recuid`),
  KEY `recordident_2` (`tablename`,`tstamp`),
  KEY `sys_log_uid` (`sys_log_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_language`
--

CREATE TABLE IF NOT EXISTS `sys_language` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `flag` varchar(20) NOT NULL DEFAULT '',
  `static_lang_isocode` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_lockedrecords`
--

CREATE TABLE IF NOT EXISTS `sys_lockedrecords` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `record_table` varchar(255) NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT '0',
  `record_pid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `feuserid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_log`
--

CREATE TABLE IF NOT EXISTS `sys_log` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `recuid` int(11) unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT '0',
  `error` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `details_nr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IP` varchar(39) NOT NULL DEFAULT '',
  `log_data` varchar(255) NOT NULL DEFAULT '',
  `event_pid` int(11) NOT NULL DEFAULT '-1',
  `workspace` int(11) NOT NULL DEFAULT '0',
  `NEWid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`,`uid`),
  KEY `user_auth` (`type`,`action`,`tstamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2933 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_news`
--

CREATE TABLE IF NOT EXISTS `sys_news` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_note`
--

CREATE TABLE IF NOT EXISTS `sys_note` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser` int(11) unsigned NOT NULL DEFAULT '0',
  `author` varchar(80) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text,
  `personal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `category` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_preview`
--

CREATE TABLE IF NOT EXISTS `sys_preview` (
  `keyword` varchar(32) NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `config` text,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_refindex`
--

CREATE TABLE IF NOT EXISTS `sys_refindex` (
  `hash` varchar(32) NOT NULL DEFAULT '',
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT '0',
  `field` varchar(40) NOT NULL DEFAULT '',
  `flexpointer` varchar(255) NOT NULL DEFAULT '',
  `softref_key` varchar(30) NOT NULL DEFAULT '',
  `softref_id` varchar(40) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ref_table` varchar(255) NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT '0',
  `ref_string` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`,`recuid`),
  KEY `lookup_uid` (`ref_table`,`ref_uid`),
  KEY `lookup_string` (`ref_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_registry`
--

CREATE TABLE IF NOT EXISTS `sys_registry` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) NOT NULL DEFAULT '',
  `entry_key` varchar(128) NOT NULL DEFAULT '',
  `entry_value` blob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_template`
--

CREATE TABLE IF NOT EXISTS `sys_template` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sitetitle` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `root` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `include_static_file` text,
  `constants` text,
  `config` text,
  `resources` text,
  `nextLevel` varchar(5) NOT NULL DEFAULT '',
  `description` text,
  `basedOn` tinytext,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `includeStaticAfterBasedOn` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `static_file_mode` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`hidden`,`sorting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_ter`
--

CREATE TABLE IF NOT EXISTS `sys_ter` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` mediumtext,
  `wsdl_url` varchar(100) NOT NULL DEFAULT '',
  `mirror_url` varchar(100) NOT NULL DEFAULT '',
  `lastUpdated` int(11) unsigned NOT NULL DEFAULT '0',
  `extCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tt_content`
--

CREATE TABLE IF NOT EXISTS `tt_content` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `CType` varchar(30) NOT NULL DEFAULT '',
  `header` varchar(255) NOT NULL DEFAULT '',
  `header_position` varchar(6) NOT NULL DEFAULT '',
  `bodytext` mediumtext,
  `image` text,
  `imagewidth` mediumint(11) unsigned NOT NULL DEFAULT '0',
  `imageorient` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `imagecaption` text,
  `imagecols` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `imageborder` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `media` text,
  `layout` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `cols` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `records` text,
  `pages` tinytext,
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `colPos` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subheader` varchar(255) NOT NULL DEFAULT '',
  `spaceBefore` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceAfter` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(100) NOT NULL DEFAULT '0',
  `header_link` varchar(255) NOT NULL DEFAULT '',
  `imagecaption_position` varchar(6) NOT NULL DEFAULT '',
  `image_link` text,
  `image_zoom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `image_noRows` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `image_effects` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `image_compression` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `altText` text,
  `titleText` text,
  `longdescURL` text,
  `header_layout` varchar(30) NOT NULL DEFAULT '0',
  `text_align` varchar(6) NOT NULL DEFAULT '',
  `text_face` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text_size` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text_color` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text_properties` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `menu_type` varchar(30) NOT NULL DEFAULT '0',
  `list_type` varchar(255) NOT NULL DEFAULT '0',
  `table_border` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `table_cellspacing` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `table_cellpadding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `table_bgColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `select_key` varchar(80) NOT NULL DEFAULT '',
  `sectionIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linkToTop` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `filelink_size` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target` varchar(30) NOT NULL DEFAULT '',
  `section_frame` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `splash_layout` varchar(30) NOT NULL DEFAULT '0',
  `multimedia` tinytext,
  `image_frames` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recursive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `imageheight` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rte_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  `pi_flexform` mediumtext,
  `accessibility_title` varchar(30) NOT NULL DEFAULT '',
  `accessibility_bypass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `accessibility_bypass_text` varchar(30) NOT NULL DEFAULT '',
  `l18n_parent` int(11) NOT NULL DEFAULT '0',
  `l18n_diffsource` mediumblob,
  `tx_templavoila_ds` varchar(100) NOT NULL DEFAULT '',
  `tx_templavoila_to` int(11) NOT NULL DEFAULT '0',
  `tx_templavoila_flex` mediumtext,
  `tx_templavoila_pito` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `language` (`l18n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_impexp_presets`
--

CREATE TABLE IF NOT EXISTS `tx_impexp_presets` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `item_uid` int(11) NOT NULL DEFAULT '0',
  `preset_data` blob,
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_category`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_category` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) NOT NULL DEFAULT '0',
  `title` tinytext,
  `description` text,
  `image` text,
  `parentcategory` int(11) NOT NULL DEFAULT '0',
  `single_pid` int(11) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(11) NOT NULL DEFAULT '0',
  `import_id` varchar(100) NOT NULL DEFAULT '',
  `import_source` varchar(100) NOT NULL DEFAULT '',
  `is_dummy_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `parentcategory` (`parentcategory`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_file`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_file` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `sorting` int(10) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `title` tinytext,
  `description` text,
  `file` text,
  `is_dummy_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_link`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `sorting` int(10) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `title` tinytext,
  `description` text,
  `uri` text,
  `is_dummy_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_media`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_media` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `sorting` int(10) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `caption` tinytext,
  `alt` tinytext,
  `title` tinytext,
  `image` text,
  `html` text,
  `dam` int(11) NOT NULL DEFAULT '0',
  `multimedia` tinytext,
  `type` int(11) NOT NULL DEFAULT '0',
  `showinpreview` tinyint(4) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `is_dummy_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_news`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_news` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `editlock` tinyint(4) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) NOT NULL DEFAULT '0',
  `title` tinytext,
  `teaser` text,
  `bodytext` text,
  `datetime` int(11) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `author` tinytext,
  `author_email` tinytext,
  `categories` int(11) NOT NULL DEFAULT '0',
  `related` int(11) NOT NULL DEFAULT '0',
  `related_files` tinytext,
  `related_links` tinytext,
  `type` int(11) NOT NULL DEFAULT '0',
  `keywords` text,
  `tags` int(11) NOT NULL DEFAULT '0',
  `media` text,
  `internalurl` text,
  `externalurl` text,
  `istopnews` int(11) NOT NULL DEFAULT '0',
  `content_elements` text,
  `path_segment` tinytext,
  `alternative_title` tinytext,
  `import_id` varchar(100) NOT NULL DEFAULT '',
  `import_source` varchar(100) NOT NULL DEFAULT '',
  `is_dummy_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_news_category_mm`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_news_category_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_news_file_mm`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_news_file_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_news_related_mm`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_news_related_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_news_tag_mm`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_news_tag_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_news_domain_model_tag`
--

CREATE TABLE IF NOT EXISTS `tx_news_domain_model_tag` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `title` tinytext,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_rtehtmlarea_acronym`
--

CREATE TABLE IF NOT EXISTS `tx_rtehtmlarea_acronym` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `term` varchar(255) NOT NULL DEFAULT '',
  `acronym` varchar(255) NOT NULL DEFAULT '',
  `static_lang_isocode` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_scheduler_task`
--

CREATE TABLE IF NOT EXISTS `tx_scheduler_task` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `disable` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `nextexecution` int(11) unsigned NOT NULL DEFAULT '0',
  `lastexecution_time` int(11) unsigned NOT NULL DEFAULT '0',
  `lastexecution_failure` text NOT NULL,
  `lastexecution_context` char(3) NOT NULL DEFAULT '',
  `serialized_task_object` blob,
  `serialized_executions` blob,
  PRIMARY KEY (`uid`),
  KEY `index_nextexecution` (`nextexecution`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_staticinfotables_hotlist`
--

CREATE TABLE IF NOT EXISTS `tx_staticinfotables_hotlist` (
  `uid_local` int(11) unsigned NOT NULL DEFAULT '0',
  `tablenames` varchar(30) NOT NULL DEFAULT '',
  `application` varchar(20) NOT NULL DEFAULT '',
  `sorting` bigint(20) unsigned NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_templavoila_datastructure`
--

CREATE TABLE IF NOT EXISTS `tx_templavoila_datastructure` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `dataprot` mediumtext,
  `scope` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `previewicon` tinytext,
  `belayout` tinytext,
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_templavoila_tmplobj`
--

CREATE TABLE IF NOT EXISTS `tx_templavoila_tmplobj` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fileref_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `datastructure` varchar(100) NOT NULL DEFAULT '',
  `fileref` tinytext,
  `templatemapping` mediumblob,
  `previewicon` tinytext,
  `description` tinytext,
  `rendertype` varchar(32) NOT NULL DEFAULT '',
  `sys_language_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `rendertype_ref` int(11) unsigned NOT NULL DEFAULT '0',
  `localprocessing` text,
  `fileref_md5` varchar(32) NOT NULL DEFAULT '',
  `belayout` tinytext,
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_wehighrise_domain_model_deal`
--

CREATE TABLE IF NOT EXISTS `tx_wehighrise_domain_model_deal` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `id_highrise` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `date_create` int(11) NOT NULL DEFAULT '0',
  `date_last_status_change` int(11) NOT NULL DEFAULT '0',
  `date_last_communication` int(11) NOT NULL DEFAULT '0',
  `status` int(11) unsigned DEFAULT '0',
  `main_party` int(11) unsigned DEFAULT '0',
  `responsible_party` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_wehighrise_domain_model_party`
--

CREATE TABLE IF NOT EXISTS `tx_wehighrise_domain_model_party` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `id_highrise` int(11) NOT NULL DEFAULT '0',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `company_name` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=410 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_wehighrise_domain_model_status`
--

CREATE TABLE IF NOT EXISTS `tx_wehighrise_domain_model_status` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_wehighrise_domain_model_type`
--

CREATE TABLE IF NOT EXISTS `tx_wehighrise_domain_model_type` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_wehighrise_domain_model_user`
--

CREATE TABLE IF NOT EXISTS `tx_wehighrise_domain_model_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `id_highrise` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weproductsslideshow_domain_model_slide`
--

CREATE TABLE IF NOT EXISTS `tx_weproductsslideshow_domain_model_slide` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weproducts_domain_model_category`
--

CREATE TABLE IF NOT EXISTS `tx_weproducts_domain_model_category` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `details` text NOT NULL,
  `img` text NOT NULL,
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weproducts_domain_model_product`
--

CREATE TABLE IF NOT EXISTS `tx_weproducts_domain_model_product` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` double(11,2) NOT NULL DEFAULT '0.00',
  `details` text NOT NULL,
  `img` text NOT NULL,
  `category` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_link`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_membership`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_membership` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `project` int(11) unsigned NOT NULL DEFAULT '0',
  `membership_id` int(11) NOT NULL DEFAULT '0',
  `role` int(11) unsigned DEFAULT '0',
  `user` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_milestone`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_milestone` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `milestone_id` varchar(255) NOT NULL DEFAULT '',
  `due_date` int(11) NOT NULL DEFAULT '0',
  `milestone_name` varchar(255) NOT NULL DEFAULT '',
  `project` int(11) unsigned DEFAULT '0',
  `description` text NOT NULL,
  `milestone_status` varchar(255) NOT NULL DEFAULT '',
  `date_created` int(11) NOT NULL DEFAULT '0',
  `date_modified` int(11) NOT NULL DEFAULT '0',
  `author_created` varchar(255) NOT NULL DEFAULT '',
  `author_modified` varchar(255) NOT NULL DEFAULT '',
  `responsibility` varchar(255) NOT NULL DEFAULT '',
  `release_milestone` varchar(255) NOT NULL DEFAULT '',
  `functionality_tester` int(11) unsigned DEFAULT '0',
  `design_tester` int(11) unsigned DEFAULT '0',
  `code_tester` int(11) unsigned DEFAULT '0',
  `user` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_project`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_project` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `project_i_d` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `linktype` int(11) unsigned NOT NULL DEFAULT '0',
  `membership` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(11) unsigned DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_role`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_role` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_status`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_status` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_url`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_url` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `project` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `link` int(11) unsigned DEFAULT '0',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tx_weprojectview_domain_model_user`
--

CREATE TABLE IF NOT EXISTS `tx_weprojectview_domain_model_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT '',
  `tstamp` int(11) unsigned NOT NULL DEFAULT '0',
  `crdate` int(11) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) NOT NULL DEFAULT '',
  `t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
