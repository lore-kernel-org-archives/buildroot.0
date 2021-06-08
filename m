From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:27:00 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/php-imagick: add
 CPE variables
Message-ID: <20210608075705.3734D7FE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5603394b97d749c40218055f4dd18187c0d1e4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:php:imagick is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aphp%3Aimagick

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5022410324a4c1bcc9873c3ef2060c570a7ea31b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-imagick/php-imagick.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index ca0cbc7492..6fb43de0ca 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -13,6 +13,8 @@ PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
 PHP_IMAGICK_LICENSE = PHP-3.01
 PHP_IMAGICK_LICENSE_FILES = LICENSE
+PHP_IMAGICK_CPE_ID_VENDOR = php
+PHP_IMAGICK_CPE_ID_PRODUCT = imagick
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
