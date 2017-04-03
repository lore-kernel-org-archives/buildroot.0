From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:47:33 +0200
Subject: [Buildroot] [git commit] php-geoip: add version to license string
Message-ID: <20170403124803.C4F2982548@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c34f04f8e83e540dd2d8191601b10face6b89339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License header in geoip.c refers to PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
