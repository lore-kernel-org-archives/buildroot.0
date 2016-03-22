From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:04:49 +0100
Subject: [Buildroot] [git commit] cairo: bump to version 1.14.6
Message-ID: <20160322090550.928B5800C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2273ee0f3aa372e3de87ff2466b865e8f5708b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
