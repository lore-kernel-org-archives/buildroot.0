From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:38:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/geoip: bump version to 1.6.11
Message-ID: <20170603173813.7253-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/geoip/geoip.hash | 2 +-
 package/geoip/geoip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index 505c38f94..2b1f7433c 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4b446491843de67c1af9b887da17a3e5939e0aeed4826923a5f4bf09d845096f  GeoIP-1.6.9.tar.gz
+sha256 b0e5a92200b5ab540d118983f7b7191caf4faf1ae879c44afa3ff2a2abcdb0f5  GeoIP-1.6.11.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index 5ba4c1e7a..030c7b368 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GEOIP_VERSION = 1.6.9
+GEOIP_VERSION = 1.6.11
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
 GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
-- 
2.11.0
