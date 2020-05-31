From: =?UTF-8?q?Gon=C3=A7alo=20Salazar?= <glbsalazar@gmail.com>
Date: Sun, 31 May 2020 13:11:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/xr819-xradio: bumped to version
 6bf0e2e2
Message-ID: <20200531121125.1985843-1-glbsalazar@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumped xr819-xradio package to the latest version to fix some compilation issues when using kernel 5.6 for the orangepi-zero 

Signed-off-by: Gon?alo Salazar <glbsalazar@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 393780fb30..efff92ab7d 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 2f61f2db78d46440819af2d8191f9b5ed2bb3e5404b739f68fb0af7917d0d222 xr819-xradio-aa01ba77b9360dd734b50f5b937960a50c5a0825.tar.gz
+sha256 5900821a777b9008d7cf9b8128e0cb75a4623ecb608b45438e17c7a056cde1bf xr819-xradio-6bf0e2e21c80456e2a3d4ad1267caecde7165871.tar.gz
 # Locally computed
 sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73 LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index ae3e4fbd34..c1fe3295b6 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = aa01ba77b9360dd734b50f5b937960a50c5a0825
+XR819_XRADIO_VERSION = 6bf0e2e21c80456e2a3d4ad1267caecde7165871
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.26.2
