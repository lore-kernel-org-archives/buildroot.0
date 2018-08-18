From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Aug 2018 11:09:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version 7.2.9
Message-ID: <20180818090933.17376-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 7.2.8 fixed CVE-2018-12882, CVE-2018-14883 & CVE-2018-14851:
http://www.php.net/ChangeLog-7.php#7.2.8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4ddef44274..6e401dec00 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 af70a33b3f7a51510467199b39af151333fbbe4cc21923bad9c7cf64268cddb2  php-7.2.5.tar.xz
+sha256 3585c1222e00494efee4f5a65a8e03a1e6eca3dfb834814236ee7f02c5248ae0  php-7.2.9.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 028fa6fc55..04a32283c8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.5
+PHP_VERSION = 7.2.9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.18.0
