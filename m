From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:46:12 +0200
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.20.4
Message-ID: <20160510135145.BD8CD81880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dff83fe2b397096b0e30677576edb59eb67a4b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 72ef366..78bfc86 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.3.sha256sum
-sha256	3834f3bf23b260b3e5ebfea41102e2026a8af29e36c3620edf4a5cf05e82f694	gtk+-3.20.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.4.sha256sum
+sha256	e7e3aaf54a54dd1c1ca0588939254abe31329e0bcd280a12290d5306b41ea03f	gtk+-3.20.4.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 5591262..0ba7928 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.20
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).3
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).4
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
