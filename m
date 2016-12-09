From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 10:40:49 -0300
Subject: [Buildroot] [PATCH] cairo: bump to version 1.14.8
Message-ID: <1481290849-24333-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.hash | 6 +++---
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 225850f..dd5365b 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,4 +1,4 @@
-# From http://cairographics.org/releases/cairo-1.14.6.tar.xz.sha1
-sha1	0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5	cairo-1.14.6.tar.xz
+# From http://cairographics.org/releases/cairo-1.14.8.tar.xz.sha1
+sha1	c6f7b99986f93c9df78653c3e6a3b5043f65145e	cairo-1.14.8.tar.xz
 # Calculated based on the hash above
-sha256	613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252	cairo-1.14.6.tar.xz
+sha256	d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20	cairo-1.14.8.tar.xz
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index d7e370a..761c6f4 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.14.6
+CAIRO_VERSION = 1.14.8
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
-- 
2.7.3
