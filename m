From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 13:11:06 +0100
Subject: [Buildroot] [PATCH] php: bump to version 7.1.2
Message-ID: <20170310121106.11034-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

7.1.2 is a bugfix release, fixing a number of issues:

http://www.php.net/ChangeLog-7.php#7.1.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9c94b9e4c..47e99d480 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 b3565b0c1441064eba204821608df1ec7367abff881286898d900c2c2a5ffe70  php-7.1.1.tar.xz
+sha256 d815a0c39fd57bab1434a77ff0610fb507c22f790c66cd6f26e27030c4b3e971  php-7.1.2.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1379ad571..5b113d1b3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.1
+PHP_VERSION = 7.1.2
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.11.0
