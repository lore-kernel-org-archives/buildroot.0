From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 21:23:47 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-zattoo: bump
 version to 18.1.23-Leia
Message-ID: <20210216200510.89B7A813E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f5ed4159831708168244c09c32f67cea0443f3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 13201a4292..a9e2cd996c 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  19de7bc58bcf37bbcff5ad2cb2f095cb15a4217f9abec5c9ff30d0489dab89d2  kodi-pvr-zattoo-18.1.21-Leia.tar.gz
+sha256  9c3dc2ed9f8c39bcc4f5798439b85f2bdae1a427ffeb1b9d18aa5e2caca29f4e  kodi-pvr-zattoo-18.1.23-Leia.tar.gz
 sha256  d3670aef89085fd6b97665967a8422c89324afbc4720daa0975696a2ee92e236  debian/copyright
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 78fc01f195..cb995c9c78 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 18.1.21-Leia
+KODI_PVR_ZATTOO_VERSION = 18.1.23-Leia
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = debian/copyright
