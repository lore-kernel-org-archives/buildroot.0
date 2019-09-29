From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:26:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_fonttosfnt: bump version
 to 1.0.5
Message-ID: <20190929182656.32463-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 9 +++++++--
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index e76c5c8856..8e1237b2fd 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2008-May/000543.html
-sha1	a609fba513947e5267c924f85774c0e44a076a7d	fonttosfnt-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-July/002910.html
+md5 70b785f2063643049bffb31ba4772619  fonttosfnt-1.0.5.tar.bz2
+sha1 acc1c8e47ba0fdc872442bf4fb087074b40ae618  fonttosfnt-1.0.5.tar.bz2
+sha256 c80a5ff516aa06da2e90df044b8e28715f7d9e451feac8030951d9ff828d8503  fonttosfnt-1.0.5.tar.bz2
+sha512 dba990098c95b07bc7240699a5c9ea11f056fbfddd70f669ae283548cbf20d756b28d817a99548c23ba81de9792877296ab6f35ee3c630e5c3cd8f14650ce297  fonttosfnt-1.0.5.tar.bz2
+# Locally computed
+sha256 f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 1571a3baf3..0e392e959a 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.0.4
+XAPP_FONTTOSFNT_VERSION = 1.0.5
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
-- 
2.20.1
