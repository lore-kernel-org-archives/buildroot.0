From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue,  8 Jun 2021 13:57:52 +0300
Subject: [Buildroot] [PATCH 1/1] libepoxy: bump to version 1.5.8
Message-ID: <20210608105752.2385837-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to libepoxy 1.5.8, which fixes a few regressions introduced in
the 1.5.7 release:

  https://github.com/anholt/libepoxy/releases/tag/1.5.8

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index 35af7c076b..3457f613f5 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.7.sha256sum
-sha256  9479cc0146ffb395fdecf9bd2a5930834fd0bce490cbcc4681ffd716bb3a0763  libepoxy-1.5.7.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.8.sha256sum
+sha256  cf05e4901778c434aef68bb7dc01bea2bce15440c0cecb777fb446f04db6fe0d  libepoxy-1.5.8.tar.xz
 
 # Hashes for license files:
 sha256  8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 729d1bff92..04fffe4541 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).7
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).8
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.32.0
