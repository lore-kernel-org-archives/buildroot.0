From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Aug 2014 10:49:03 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.16
Message-ID: <1408715343-7706-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3538 - Extensive backtracking in rule regular expression
CVE-2014-3587 - Segfault in cdf.c
CVE-2014-2497 - php-gd 'c_color' NULL pointer dereference
CVE-2014-5120 - Null byte injection possible with imagexxx functions
CVE-2014-3597 - segfault in dns_get_record

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index de7d668..d174533 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.15
+PHP_VERSION = 5.5.16
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
-- 
1.8.5.5
