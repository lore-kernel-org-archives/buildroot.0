From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 19:51:19 -0300
Subject: [Buildroot] [PATCH] cairo: bump to version 1.14.6
Message-ID: <1458600679-17791-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.hash | 6 ++++--
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 1440185..225850f 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,2 +1,4 @@
-# From http://cairographics.org/releases/cairo-1.14.4.tar.xz.sha1
-sha1	5b44471e7c328f96de6830baf8ea65030de797f9	cairo-1.14.4.tar.xz
+# From http://cairographics.org/releases/cairo-1.14.6.tar.xz.sha1
+sha1	0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5	cairo-1.14.6.tar.xz
+# Calculated based on the hash above
+sha256	613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252	cairo-1.14.6.tar.xz
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index b6ab54e..ab0c2e8 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.14.4
+CAIRO_VERSION = 1.14.6
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
-- 
2.7.3
