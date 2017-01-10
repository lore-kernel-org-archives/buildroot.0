From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:02:20 +0100
Subject: [Buildroot] [git commit] php-imagick: bump version to 3.4.3RC1
Message-ID: <20170110200748.724C481916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cfddd92b67dc3208e89395368972d780e4d7cc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is marked as "stable" on php-imagick's website, plus is
necessary for the upcoming php-7.1 version bump.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index 551bed6..e991237 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a729fbd69e0aa145824d61dc9225bfb636dcd8421874a5667ac3822e609449e1  imagick-3.4.1.tgz
+sha256 50bbc46e78cd6e1ea5d7660be1722258e60b1729483ca14b02da7cf9f5ed3e6a  imagick-3.4.3RC1.tgz
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 84cc311..ddcefda 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.4.1
+PHP_IMAGICK_VERSION = 3.4.3RC1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
