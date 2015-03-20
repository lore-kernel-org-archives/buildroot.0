From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:02:40 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.23
Message-ID: <20150320130300.858DB817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c88be8ef755c8714ad05821c66555f6544f4794
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-0231 - Use After Free Vulnerability in unserialize()
CVE-2015-2305 - heap overflow vulnerability in regcomp.c
CVE-2015-2331 - ZIP Integer Overflow leads to writing past heap boundary

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index f8a1715..0794db8 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	fb1704131d495f5b3e6ab3b087a8dbe6	php-5.5.22.tar.xz
+md5	692f9bc5649806f2053eee1e7323b7ea	php-5.5.23.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index b5daeb6..055bc0b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.22
+PHP_VERSION = 5.5.23
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
