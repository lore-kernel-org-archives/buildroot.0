From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 29 Jun 2021 09:50:46 -0700
Subject: [Buildroot] [PATCH 03/11] package/php-imagick: bump version to 3.5.0
In-Reply-To: <20210629165054.3831930-1-aduskett@gmail.com>
References: <20210629165054.3831930-1-aduskett@gmail.com>
Message-ID: <20210629165054.3831930-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index 8b62ed1d9a..e915808585 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1f3c5b5eeaa02800ad22f506cd100e8889a66b2ec937e192eaaa30d74562567c  imagick-3.4.3.tgz
+sha256  795db7c36fbacd3d33a4f53ff2d38584c846e80a04dcd04c55e9e46c28f5d229  imagick-3.5.0.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 6fb43de0ca..2dc055f0b3 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.4.3
+PHP_IMAGICK_VERSION = 3.5.0
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.31.1
