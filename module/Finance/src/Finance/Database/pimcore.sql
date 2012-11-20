-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2012 at 12:15 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pimcore`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `customSettings` text,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `path` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cache_tags`
--

CREATE TABLE IF NOT EXISTS `cache_tags` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `tag` varchar(165) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `id` (`id`),
  KEY `tag` (`tag`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `allowInherit` tinyint(1) unsigned DEFAULT '0',
  `allowVariants` tinyint(1) unsigned DEFAULT '0',
  `parentClass` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `propertyVisibility` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dependencies`
--

CREATE TABLE IF NOT EXISTS `dependencies` (
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sourcetype`,`sourceid`,`targetid`,`targettype`),
  KEY `sourceid` (`sourceid`),
  KEY `targetid` (`targetid`),
  KEY `sourcetype` (`sourcetype`),
  KEY `targettype` (`targettype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email') DEFAULT NULL,
  `key` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT NULL,
  `index` int(11) unsigned DEFAULT '999999',
  `published` tinyint(1) unsigned DEFAULT '1',
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `path` (`path`),
  KEY `published` (`published`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `documents_doctypes`
--

CREATE TABLE IF NOT EXISTS `documents_doctypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `type` enum('page','snippet','email') DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `documents_elements`
--

CREATE TABLE IF NOT EXISTS `documents_elements` (
  `documentId` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_email`
--

CREATE TABLE IF NOT EXISTS `documents_email` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_hardlink`
--

CREATE TABLE IF NOT EXISTS `documents_hardlink` (
  `id` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childsFromSource` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_link`
--

CREATE TABLE IF NOT EXISTS `documents_link` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset') DEFAULT NULL,
  `internal` int(11) unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_page`
--

CREATE TABLE IF NOT EXISTS `documents_page` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `prettyUrl` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_snippet`
--

CREATE TABLE IF NOT EXISTS `documents_snippet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edit_lock`
--

CREATE TABLE IF NOT EXISTS `edit_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `requestUri` varchar(255) DEFAULT NULL,
  `params` text,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `sentDate` bigint(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `glossary`
--

CREATE TABLE IF NOT EXISTS `glossary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `http_error_log`
--

CREATE TABLE IF NOT EXISTS `http_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(1000) DEFAULT NULL,
  `code` int(3) DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`(255)),
  KEY `code` (`code`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locks`
--

CREATE TABLE IF NOT EXISTS `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notes_data`
--

CREATE TABLE IF NOT EXISTS `notes_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE IF NOT EXISTS `objects` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int(11) unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) DEFAULT '',
  `o_path` varchar(255) DEFAULT NULL,
  `o_index` int(11) unsigned DEFAULT '0',
  `o_published` tinyint(1) unsigned DEFAULT '1',
  `o_creationDate` bigint(20) unsigned DEFAULT NULL,
  `o_modificationDate` bigint(20) unsigned DEFAULT NULL,
  `o_userOwner` int(11) unsigned DEFAULT NULL,
  `o_userModification` int(11) unsigned DEFAULT NULL,
  `o_classId` int(11) unsigned DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `key` (`o_key`),
  KEY `path` (`o_path`),
  KEY `type` (`o_type`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE IF NOT EXISTS `properties` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` enum('text','date','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `cpath` (`cpath`),
  KEY `inheritable` (`inheritable`),
  KEY `ctype` (`ctype`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `properties_predefined`
--

CREATE TABLE IF NOT EXISTS `properties_predefined` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `description` text,
  `key` varchar(255) DEFAULT NULL,
  `type` enum('text','document','asset','bool','select','object') DEFAULT NULL,
  `data` text,
  `config` text,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `inheritable` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `id` (`id`),
  KEY `key` (`key`),
  KEY `type` (`type`),
  KEY `ctype` (`ctype`),
  KEY `inheritable` (`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recyclebin`
--

CREATE TABLE IF NOT EXISTS `recyclebin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `redirects`
--

CREATE TABLE IF NOT EXISTS `redirects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `sourceEntireUrl` tinyint(1) DEFAULT NULL,
  `sourceSite` int(11) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int(11) DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `expiry` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sanitycheck`
--

CREATE TABLE IF NOT EXISTS `sanitycheck` (
  `id` int(11) unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_tasks`
--

CREATE TABLE IF NOT EXISTS `schedule_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` bigint(20) unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `search_backend_data`
--

CREATE TABLE IF NOT EXISTS `search_backend_data` (
  `id` int(11) NOT NULL,
  `fullpath` varchar(510) DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `published` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) DEFAULT NULL,
  `modificationDate` bigint(20) DEFAULT NULL,
  `userOwner` int(11) DEFAULT NULL,
  `userModification` int(11) DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `id` (`id`),
  KEY `fullpath` (`fullpath`(333)),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `data` (`data`),
  FULLTEXT KEY `properties` (`properties`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domains` text,
  `rootId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staticroutes`
--

CREATE TABLE IF NOT EXISTS `staticroutes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `reverse` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `variables` varchar(255) DEFAULT NULL,
  `defaults` varchar(255) DEFAULT NULL,
  `siteId` int(11) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `targeting`
--

CREATE TABLE IF NOT EXISTS `targeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_documentId` (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `translations_admin`
--

CREATE TABLE IF NOT EXISTS `translations_admin` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `date` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translations_website`
--

CREATE TABLE IF NOT EXISTS `translations_website` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `date` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tree_locks`
--

CREATE TABLE IF NOT EXISTS `tree_locks` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) unsigned DEFAULT '0',
  `active` tinyint(1) unsigned DEFAULT '1',
  `permissions` varchar(1000) DEFAULT NULL,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_permission_definitions`
--

CREATE TABLE IF NOT EXISTS `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_workspaces_asset`
--

CREATE TABLE IF NOT EXISTS `users_workspaces_asset` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(255) DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_workspaces_document`
--

CREATE TABLE IF NOT EXISTS `users_workspaces_document` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(255) DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_workspaces_object`
--

CREATE TABLE IF NOT EXISTS `users_workspaces_object` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(255) DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `note` text,
  `date` bigint(1) unsigned DEFAULT NULL,
  `public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
