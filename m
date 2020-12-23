From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 24 Dec 2020 00:35:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.5
Message-ID: <20201223223544.198464-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version removes Python 2 support, the autotools based build system
(not a problem as Buildroot has been using Meson for a while), and some
small fixes.

Full release notes can be found at:

  https://github.com/anholt/libepoxy/releases/tag/1.5.5

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index a37e3949a6..79876ad01d 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.4.sha256sum
-sha256 0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2  libepoxy-1.5.4.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.5.sha256sum
+sha256 261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556  libepoxy-1.5.5.tar.xz
 
 # Hashes for license files:
 sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index efc23a7636..bb578fb02c 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).4
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).5
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.29.2
