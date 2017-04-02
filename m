From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon,  3 Apr 2017 00:13:04 +0530
Subject: [Buildroot] [PATCH 3/7] php-imagick: add version to license string
In-Reply-To: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491158588-6698-3-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/php-imagick/php-imagick.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index ddcefda..c8c2b85 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -11,7 +11,7 @@ PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-imagick=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
-PHP_IMAGICK_LICENSE = PHP
+PHP_IMAGICK_LICENSE = PHP-3.01
 PHP_IMAGICK_LICENSE_FILES = LICENSE
 
 define PHP_IMAGICK_PHPIZE
-- 
2.7.4
