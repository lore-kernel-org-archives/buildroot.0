From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Oct 2020 12:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version to
 18.1.21
Message-ID: <20201018102501.685536-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 5e1454eff6..13201a4292 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  36dedc8bc6b95aa6036d0e5aa94d90f7d965f57325cc858ad6bcc401f371d3ed  kodi-pvr-zattoo-18.1.19-Leia.tar.gz
+sha256  19de7bc58bcf37bbcff5ad2cb2f095cb15a4217f9abec5c9ff30d0489dab89d2  kodi-pvr-zattoo-18.1.21-Leia.tar.gz
 sha256  d3670aef89085fd6b97665967a8422c89324afbc4720daa0975696a2ee92e236  debian/copyright
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 3644751034..66aff690ff 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 18.1.19-Leia
+KODI_PVR_ZATTOO_VERSION = 18.1.21-Leia
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = debian/copyright
-- 
2.27.0
