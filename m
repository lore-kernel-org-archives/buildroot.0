From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Mar 2021 07:21:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-zattoo: bump version to
 19.7.8.1-Matrix
In-Reply-To: <20210315062124.120447-1-bernd.kuhls@t-online.de>
References: <20210315062124.120447-1-bernd.kuhls@t-online.de>
Message-ID: <20210315062124.120447-2-bernd.kuhls@t-online.de>
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
index 10e50fccb8..a5a56f6db6 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a10b268071a28397e48fd4ec4127a4b533f96cf430aaa88f5148e38ceffe60a3  kodi-pvr-zattoo-19.7.8-Matrix.tar.gz
+sha256  25dc4ea72b5315a65286ba606e6e26d281fb8eb830d5e0164b66b8d7ae90319a  kodi-pvr-zattoo-19.7.8.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 8c3d574cb0..1ae1e884b0 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 19.7.8-Matrix
+KODI_PVR_ZATTOO_VERSION = 19.7.8.1-Matrix
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.29.2
