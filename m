From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 20:43:31 +0200
Subject: [Buildroot] [PATCH 1/1] libgtk3: bump to version 3.22.30
Message-ID: <20180430184331.25875-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgtk3/libgtk3.hash | 7 +++++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 0f259e9a1c..b7a89901dd 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.15.sha256sum
-sha256 c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb  gtk+-3.22.15.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.30.sha256sum
+sha256 a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567  gtk+-3.22.30.tar.xz
+
+# Hash for license file:
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index b4a8b8c517..1b85d00aae 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).15
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).30
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.14.1
