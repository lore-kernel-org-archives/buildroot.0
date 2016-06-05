From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:02:22 +0200
Subject: [Buildroot] [git commit] package/php-geoip: bump version
Message-ID: <20160605200530.E013D81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1644b942a5cbf95f8cd6125949bf2fb75c058be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-geoip/php-geoip.hash | 2 +-
 package/php-geoip/php-geoip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
index 61945cf..3729880 100644
--- a/package/php-geoip/php-geoip.hash
+++ b/package/php-geoip/php-geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8b5e8dec6353c437809e58d798627927ae659682b5bbdad023e9e569c278bfed  php-geoip-1fd53288458100e9e30acf5a62bc9ef8426513d3.tar.gz
+sha256 63167b717f624580b93f3c6c050d8d64ebc6cbe1377069646eb387534c7a2f7e  php-geoip-ebb68228ad94298a305710f701b2ade9acff985d.tar.gz
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index cda8d4e..c39c95c 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_GEOIP_VERSION = 1fd53288458100e9e30acf5a62bc9ef8426513d3
+PHP_GEOIP_VERSION = ebb68228ad94298a305710f701b2ade9acff985d
 PHP_GEOIP_SITE = $(call github,php7-extensions,ext-php7-geoip,$(PHP_GEOIP_VERSION))
 PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
