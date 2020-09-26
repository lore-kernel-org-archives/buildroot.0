From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Sep 2020 17:06:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: bump version to 2.9.0
Message-ID: <20200926150626.908337-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://github.com/intel/libva/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 083c949147..f40599c719 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.8.0/libva-2.8.0.tar.bz2.sha1sum
-sha1  9fb5df0e511c4aa918f9e8cd2be072cb3bb5040c  libva-2.8.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.9.0/libva-2.9.0.tar.bz2.sha1sum
+sha1  3e20605243096b4e935e1ef6ac7797efbacc44f6  libva-2.9.0.tar.bz2
 # Locally computed
-sha256  adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3  libva-2.8.0.tar.bz2
+sha256  e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b  libva-2.9.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index c4778e9d73..75d26fa7fa 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.8.0
+LIBVA_VERSION = 2.9.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.27.0
