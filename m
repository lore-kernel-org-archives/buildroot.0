From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 16:56:52 +0100
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.22.5
Message-ID: <20161212155708.1F2D2802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e8858f723be39581394c6f7c6299413227bd0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index e1d93b3..d589b40 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.4.sha256sum
-sha256 7094a6fcfe133d01c578358bd5d3e499715f1a0206e87bd5cf6c834e301f387f  gtk+-3.22.4.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.5.sha256sum
+sha256 693fa0ac643c59ccd51db99cabe476b4e0a41fd4f0c3c8b3e3ef38f94b2e7334  gtk+-3.22.5.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 4a686e0..5380111 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).4
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).5
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
