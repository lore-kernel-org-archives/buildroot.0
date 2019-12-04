From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  4 Dec 2019 14:49:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.4
Message-ID: <20191204124950.998118-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release contains two minor improvements (smaller library size, and
updates to the GL registry), plus a couple of build fixes which are not
relevant for Buildroot (one for Solaris; another for unit tests, which
we do not build):

  https://github.com/anholt/libepoxy/releases/tag/1.5.4

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index d574a04455..a37e3949a6 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.3.sha256sum
-sha256 002958c5528321edd53440235d3c44e71b5b1e09b9177e8daf677450b6c4433d  libepoxy-1.5.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.4.sha256sum
+sha256 0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2  libepoxy-1.5.4.tar.xz
 
 # Hashes for license files:
 sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index deb3c1ecbb..efc23a7636 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).3
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).4
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.24.0
