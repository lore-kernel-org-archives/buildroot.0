From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:54:35 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_ico: bump version to
 1.0.5
Message-ID: <20180324210427.9DE668379F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=425c8a9a63b7875ba8ad2f6e241358311d8dbe54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_ico/xapp_ico.hash | 9 +++++++--
 package/x11r7/xapp_ico/xapp_ico.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_ico/xapp_ico.hash b/package/x11r7/xapp_ico/xapp_ico.hash
index 055e85ea67..693aff65f7 100644
--- a/package/x11r7/xapp_ico/xapp_ico.hash
+++ b/package/x11r7/xapp_ico/xapp_ico.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002135.html
-sha256	2932767098f95ca129a0c7f0fecb0a18c789a79c1747f7423fdfe9f4e0c53590	ico-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002880.html
+md5 7895f2d109f4206b6d2db37257e07d12  ico-1.0.5.tar.bz2
+sha1 8759ec954375f3a1b37dc920a12790bfbfb0cad3  ico-1.0.5.tar.bz2
+sha256 d73b62f29eb98d850f16b76d759395180b860b613fbe1686b18eee99a6e3773f  ico-1.0.5.tar.bz2
+sha512 93a94a66d4a41b39d4b3657050e58f8269d352dae5d5916c9ecdda1cb14f23b9d159d67c50fdfa654b4b1c2ad11434bed140ace70703c82b05d3fe8686aab8f6  ico-1.0.5.tar.bz2
+# Locally computed
+sha256 97ef3a622f2f385cabfc8ab7aff13dc46468c10a5520670b5edfa33f2c3999eb COPYING
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 621d1e489e..8b0d4f90f3 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_ICO_VERSION = 1.0.4
+XAPP_ICO_VERSION = 1.0.5
 XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICO_LICENSE = MIT
