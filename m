From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 18:26:26 -0300
Subject: [Buildroot] [PATCH 1/6] php: security bump to version 5.5.8
Message-ID: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-6712.
Note that there's no xz format tarball for 5.5.8.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 54d6e05..de02f4b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.7
-PHP_SOURCE = php-$(PHP_VERSION).tar.xz
+PHP_VERSION = 5.5.8
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
-- 
1.8.3.2
