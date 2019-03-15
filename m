From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:30 +0100
Subject: [Buildroot] [PATCH 04/31] package/x11r7/xapp_xclock: bump version
 to 1.0.8
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xclock/xapp_xclock.hash | 9 +++++++--
 package/x11r7/xapp_xclock/xapp_xclock.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.hash b/package/x11r7/xapp_xclock/xapp_xclock.hash
index 1469077c1b..a0712e9a1a 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.hash
+++ b/package/x11r7/xapp_xclock/xapp_xclock.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002310.html
-sha256	23ceeca94e3e20a6c26a703ac7f789066d4517f8d2cb717ae7cb28a617d97dd0	xclock-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002947.html
+md5 8bd39eb3678ed58a2350794fe13401cc  xclock-1.0.8.tar.bz2
+sha1 980df6958286450cfc1fe6daa7ff912885d728ba  xclock-1.0.8.tar.bz2
+sha256 930820483a36f1f1ce1bf52b648865629a16082641e12c5cf2b5045815fc2255  xclock-1.0.8.tar.bz2
+sha512 1272221ace3657505bae1b22f181e9ecbf1710900c89a860c8ceae47ae31ca5e75b6557c37dc0a881a0a24c9597b9a07f46200926feb1013f1e2e995111a7646  xclock-1.0.8.tar.bz2
+# Locally computed
+sha256 ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 6f8044ef61..b0f74682e0 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCLOCK_VERSION = 1.0.7
+XAPP_XCLOCK_VERSION = 1.0.8
 XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_LICENSE = MIT
-- 
2.20.1
