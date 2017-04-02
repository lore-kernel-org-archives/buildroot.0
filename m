From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon,  3 Apr 2017 00:13:03 +0530
Subject: [Buildroot] [PATCH 2/7] php-geoip: add version to license string
In-Reply-To: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491158588-6698-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License header in geoip.c refers to PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/php-geoip/php-geoip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index c39c95c..8f4e3bf 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -10,7 +10,7 @@ PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_GEOIP_DEPENDENCIES = geoip php host-autoconf
-PHP_GEOIP_LICENSE = PHP
+PHP_GEOIP_LICENSE = PHP-3.01
 PHP_GEOIP_LICENSE_FILES = geoip.c
 
 define PHP_GEOIP_PHPIZE
-- 
2.7.4
