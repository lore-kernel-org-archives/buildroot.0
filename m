From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Sep 2018 20:51:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version 7.2.10
Message-ID: <20180913185129.461-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://de2.php.net/ChangeLog-7.php#7.2.10

Fixes https://bugs.php.net/bug.php?id=76582, CVE ID pending.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6e401dec00..2774c44d6d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 3585c1222e00494efee4f5a65a8e03a1e6eca3dfb834814236ee7f02c5248ae0  php-7.2.9.tar.xz
+sha256 01c2154a3a8e3c0818acbdbc1a956832c828a0380ce6d1d14fea495ea21804f0  php-7.2.10.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 04a32283c8..f92e9b6565 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.9
+PHP_VERSION = 7.2.10
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.18.0
