From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 May 2014 08:42:26 -0300
Subject: [Buildroot] [PATCH 2/2] php: bump to version 5.5.12
In-Reply-To: <1399203746-3477-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399203746-3477-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399203746-3477-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ba1200b..c17a623 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.11
+PHP_VERSION = 5.5.12
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
-- 
1.8.3.2
