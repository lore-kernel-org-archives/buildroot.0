From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] libglib2: bump to version 2.46.2
Message-ID: <20151201232115.3A3F4821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=739d2b41b99a1dc2a44c49cee2fa99efa7c613a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6032c30..7bce911 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.46/glib-2.46.1.sha256sum
-sha256  5a1f03b952ebc3a7e9f612b8724f70898183e31503db329b4f15d07163c8fdfb  glib-2.46.1.tar.xz
+# https://download.gnome.org/sources/glib/2.46/glib-2.46.2.sha256sum
+sha256  5031722e37036719c1a09163cc6cf7c326e4c4f1f1e074b433c156862bd733db  glib-2.46.2.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8f6ca83..c3c9cf8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.46
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
