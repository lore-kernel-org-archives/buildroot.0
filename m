From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:47:59 +0200
Subject: [Buildroot] [git commit] php-imagick: add version to license string
Message-ID: <20170403124803.D374282548@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9362e3def0b705e0a37fb7cebb6fee87431450e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file refers to PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
