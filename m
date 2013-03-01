From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:23:26 -0300
Subject: [Buildroot] [PATCH 6/7] php: bump to version 5.3.22
In-Reply-To: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362133407-5840-6-git-send-email-gustavo@zacarias.com.ar>
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
index c89b467..a417939 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.20
+PHP_VERSION = 5.3.22
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.12.4
