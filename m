From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 17 Jun 2012 11:06:03 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.3.14
Message-ID: <1339941963-30572-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump php to version 5.3.14 to fix CVE-2012-2143 and other assorted bugs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index af041c9..fee2c92 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.13
+PHP_VERSION = 5.3.14
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.3.4
