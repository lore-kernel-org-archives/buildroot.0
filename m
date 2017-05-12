From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 13:45:18 +0100
Subject: [Buildroot] [PATCH next 5/8] php-imagick: bump version to 3.4.3
In-Reply-To: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
References: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512124521.4619-5-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index e991237..abb29d4 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 50bbc46e78cd6e1ea5d7660be1722258e60b1729483ca14b02da7cf9f5ed3e6a  imagick-3.4.3RC1.tgz
+sha256 1f3c5b5eeaa02800ad22f506cd100e8889a66b2ec937e192eaaa30d74562567c  imagick-3.4.3.tgz
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index c8c2b85..9c47244 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.4.3RC1
+PHP_IMAGICK_VERSION = 3.4.3
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.10.2
