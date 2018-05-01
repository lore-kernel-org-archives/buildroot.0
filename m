From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:48:09 +0200
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.22.30
Message-ID: <20180501095048.6102283471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a63e1019d62cf308527a448c3cf59d81bfb942c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
