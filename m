From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:23:21 +0100
Subject: [Buildroot] [git commit] package/geoip: bump to version 1.6.12
Message-ID: <20190113132303.391AC884F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c37ee85639b03b7b34342c0a836f52b1a1355ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/geoip/geoip.hash | 3 ++-
 package/geoip/geoip.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index 2b1f7433c9..c2ddf390e6 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b0e5a92200b5ab540d118983f7b7191caf4faf1ae879c44afa3ff2a2abcdb0f5  GeoIP-1.6.11.tar.gz
+sha256 1dfb748003c5e4b7fd56ba8c4cd786633d5d6f409547584f6910398389636f80  GeoIP-1.6.12.tar.gz
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index 030c7b3683..cbd4282321 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GEOIP_VERSION = 1.6.11
+GEOIP_VERSION = 1.6.12
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
 GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
