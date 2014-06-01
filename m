From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Jun 2014 18:04:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Bump version to 5.5.13
Message-ID: <1401638685-25141-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index c17a623..a878800 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.12
+PHP_VERSION = 5.5.13
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
-- 
1.7.10.4
