From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jan 2020 09:51:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_fonttosfnt: bump version
 to 1.1.0
Message-ID: <20200111085139.222050-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 10 +++++-----
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index 8e1237b2fd..7a13a01a15 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002910.html
-md5 70b785f2063643049bffb31ba4772619  fonttosfnt-1.0.5.tar.bz2
-sha1 acc1c8e47ba0fdc872442bf4fb087074b40ae618  fonttosfnt-1.0.5.tar.bz2
-sha256 c80a5ff516aa06da2e90df044b8e28715f7d9e451feac8030951d9ff828d8503  fonttosfnt-1.0.5.tar.bz2
-sha512 dba990098c95b07bc7240699a5c9ea11f056fbfddd70f669ae283548cbf20d756b28d817a99548c23ba81de9792877296ab6f35ee3c630e5c3cd8f14650ce297  fonttosfnt-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-January/003035.html
+md5 bf8086aa878f0d1bb7715e5865183cc4  fonttosfnt-1.1.0.tar.bz2
+sha1 0e0ea8c92941bf9126b87fae5bb723c8e1035ae2  fonttosfnt-1.1.0.tar.bz2
+sha256 7283fd477e3de75cce40b91b5012953e30b862975555d4482435e2ee7b0f46dc  fonttosfnt-1.1.0.tar.bz2
+sha512 f4fb9814c23bfd6f83771959444d2c37eb4ba32edee43c37cf21f0181be80c6e278307641b0f4dae4ee5d10db3289e95194f99757ea4bbca343fff15498e7173  fonttosfnt-1.1.0.tar.bz2
 # Locally computed
 sha256 f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 0e392e959a..ab1d955771 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.0.5
+XAPP_FONTTOSFNT_VERSION = 1.1.0
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
-- 
2.20.1
