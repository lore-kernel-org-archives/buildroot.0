From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 15:46:52 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.17
Message-ID: <1452192412-29164-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug #70976 (Memory Read via gdImageRotateInterpolated Array Index Out of
Bounds).
Bug #70755 (fpm_log.c memory leak and buffer overflow).
Bug #70661 (Use After Free Vulnerability in WDDX Packet
Deserialization).
Bug #70741 (Session WDDX Packet Deserialization Type Confusion
Vulnerability).
Bug #70728 (Type Confusion Vulnerability in PHP_to_XMLRPC_worker()).

No CVEs assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ec632bf..7a7616f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	8ef43271d9bd8cc8f8d407d3ba569de9fa14a28985ae97c76085bb50d597de98	php-5.6.16.tar.xz
+sha256	ea9d5749380c7c7171e131616466deacd7cb124b5010eafc34e551b0a7b0fb2c	php-5.6.17.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 5a7f952..7575cd9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).16
+PHP_VERSION = $(PHP_VERSION_MAJOR).17
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.4.10
