From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 12:39:01 -0300
Subject: [Buildroot] [PATCH] geoip: bump to version 1.6.5
Message-ID: <1428507541-28002-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/geoip/geoip.hash | 2 +-
 package/geoip/geoip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index 6f1b909..d410c2f 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  36b31c9b8447bd0a56a70b651022e918d0a0654e140cc2492948e6f2175ff5b1  GeoIP-1.6.4.tar.gz
+sha256  0ae1c95e69ad627d3a45cb897f79ce0c30f13fcd4b4a0dda073be0c9552521b3  GeoIP-1.6.5.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index ac88a3b..0496de1 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GEOIP_VERSION = 1.6.4
+GEOIP_VERSION = 1.6.5
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
 GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
-- 
2.0.5
