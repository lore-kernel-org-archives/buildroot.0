From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:03 -0300
Subject: [Buildroot] [PATCH 05/14] php: bump to version 5.3.19
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 0dfb6db..4290170 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.18
+PHP_VERSION = 5.3.19
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.8.6
