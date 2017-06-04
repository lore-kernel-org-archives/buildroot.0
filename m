From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:49:36 +0200
Subject: [Buildroot] [git commit] package/geoip: bump version to 1.6.11
Message-ID: <20170604075142.E391882889@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2db2d92708466e60a63e3429ff934ea1d7aa8ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/geoip/geoip.hash | 2 +-
 package/geoip/geoip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index 505c38f..2b1f743 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4b446491843de67c1af9b887da17a3e5939e0aeed4826923a5f4bf09d845096f  GeoIP-1.6.9.tar.gz
+sha256 b0e5a92200b5ab540d118983f7b7191caf4faf1ae879c44afa3ff2a2abcdb0f5  GeoIP-1.6.11.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index 5ba4c1e..030c7b3 100644
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
