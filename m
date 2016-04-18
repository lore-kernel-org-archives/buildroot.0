From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Apr 2016 12:53:05 +0100
Subject: [Buildroot] [PATCH v2 2/8] php-imagick: bump version to 3.4.1
In-Reply-To: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1460980391-65336-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index 6173eca..551bed6 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	528769ac304a0bbe9a248811325042188c9d16e06de16f111fee317c85a36c93	imagick-3.1.2.tgz
+sha256 a729fbd69e0aa145824d61dc9225bfb636dcd8421874a5667ac3822e609449e1  imagick-3.4.1.tgz
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 1cd4a48..84cc311 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.1.2
+PHP_IMAGICK_VERSION = 3.4.1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_IMAGICK_SITE = http://sources.buildroot.net
+PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-imagick=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
-- 
2.7.3
