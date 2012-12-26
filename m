From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Dec 2012 14:36:27 -0300
Subject: [Buildroot] [PATCH 2/3] php: bump to version 5.3.20
In-Reply-To: <1356543388-23649-1-git-send-email-gustavo@zacarias.com.ar>
References: <buildroot@busybox.net>
 <1356543388-23649-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356543388-23649-2-git-send-email-gustavo@zacarias.com.ar>
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
index 4290170..a1badab 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.19
+PHP_VERSION = 5.3.20
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.8.6
