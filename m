From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 17:32:03 +0200
Subject: [Buildroot] [PATCH 1/1] libgtk2: bump to version 2.24.32
Message-ID: <20180430153203.11110-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgtk2/libgtk2.hash | 7 +++++--
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 3388c5cda2..49bec78da1 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.31.sha256sum
-sha256 68c1922732c7efc08df4656a5366dcc3afdc8791513400dac276009b40954658  gtk+-2.24.31.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.32.sha256sum
+sha256 b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e  gtk+-2.24.32.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 0b26d7205b..8f60573a5e 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).31
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).32
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-- 
2.14.1
