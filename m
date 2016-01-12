From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:39:47 +0100
Subject: [Buildroot] [git commit] geoip: bump to version 1.6.9
Message-ID: <20160112204022.D9C0981ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f0d0ad2fdc664db759773bef295e71348611dec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/geoip/geoip.hash | 2 +-
 package/geoip/geoip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index d410c2f..505c38f 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0ae1c95e69ad627d3a45cb897f79ce0c30f13fcd4b4a0dda073be0c9552521b3  GeoIP-1.6.5.tar.gz
+sha256  4b446491843de67c1af9b887da17a3e5939e0aeed4826923a5f4bf09d845096f  GeoIP-1.6.9.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index 0496de1..cf3bc1a 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GEOIP_VERSION = 1.6.5
+GEOIP_VERSION = 1.6.9
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
 GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
