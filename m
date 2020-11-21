From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:26 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/x11r7/xapp_fonttosfnt: bump
 version to 1.2.0
Message-ID: <20201121112131.756930-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 10 ++++------
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index 7a13a01a15..abd3d16f73 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-January/003035.html
-md5 bf8086aa878f0d1bb7715e5865183cc4  fonttosfnt-1.1.0.tar.bz2
-sha1 0e0ea8c92941bf9126b87fae5bb723c8e1035ae2  fonttosfnt-1.1.0.tar.bz2
-sha256 7283fd477e3de75cce40b91b5012953e30b862975555d4482435e2ee7b0f46dc  fonttosfnt-1.1.0.tar.bz2
-sha512 f4fb9814c23bfd6f83771959444d2c37eb4ba32edee43c37cf21f0181be80c6e278307641b0f4dae4ee5d10db3289e95194f99757ea4bbca343fff15498e7173  fonttosfnt-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-October/003062.html
+sha256  79f35ace377c5409c05ed71f0e8b75f8ca6ddf0a2f6b6d7ecb770ee10072a621  fonttosfnt-1.2.0.tar.bz2
+sha512  a360bd8535beaef89afa6c0678a40f7c554e9d631e0fcb80bb1363ab72288e27a5e106521610f61c95b8101f79c7f02492a2068411b5f5b695de780d8a1c1b25  fonttosfnt-1.2.0.tar.bz2
 # Locally computed
-sha256 f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
+sha256  f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index ab1d955771..8e48234e29 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.1.0
+XAPP_FONTTOSFNT_VERSION = 1.2.0
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
-- 
2.27.0
