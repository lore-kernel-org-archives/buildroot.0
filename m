From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 00:14:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.7
Message-ID: <20210519211439.1273019-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This update includes a build fix for the RaspberryPi 4 (from 1.5.7)
and a fix for the GL library loader when GLX is involved (from 1.5.6)
Release notes:

  https://github.com/anholt/libepoxy/releases/tag/1.5.6
  https://github.com/anholt/libepoxy/releases/tag/1.5.7

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index 79876ad01d..57dd1aaa8f 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.5.sha256sum
-sha256 261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556  libepoxy-1.5.5.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.7.sha256sum
+sha256 9479cc0146ffb395fdecf9bd2a5930834fd0bce490cbcc4681ffd716bb3a0763  libepoxy-1.5.7.tar.xz
 
 # Hashes for license files:
 sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index bb578fb02c..729d1bff92 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).5
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).7
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.31.1
