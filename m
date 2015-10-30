From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 21:05:58 -0300
Subject: [Buildroot] [PATCH] cairo: bump to version 1.14.4
Message-ID: <1446163558-6773-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.hash | 4 ++--
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 79b2ec6..1440185 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,2 +1,2 @@
-# From http://cairographics.org/releases/cairo-1.14.2.tar.xz.sha1
-sha1	c8da68aa66ca0855b5d0ff552766d3e8679e1d24	cairo-1.14.2.tar.xz
+# From http://cairographics.org/releases/cairo-1.14.4.tar.xz.sha1
+sha1	5b44471e7c328f96de6830baf8ea65030de797f9	cairo-1.14.4.tar.xz
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 098f249..9018b29 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.14.2
+CAIRO_VERSION = 1.14.4
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
-- 
2.4.10
