From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Sep 2019 18:44:11 +0200
Subject: [Buildroot] [git commit] package/cairo: bump to version 1.16.0
Message-ID: <20190908164724.5888F8D4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d2a9d089a969909ad2de8acb67ee14ced03de28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to releases

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cairo/cairo.hash | 6 +++---
 package/cairo/cairo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 795a2eeea5..949ed3ffee 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,7 @@
-# From https://www.cairographics.org/snapshots/cairo-1.15.12.tar.xz.sha1
-sha1	4e64c6a48789edb4c60bc3fa95bd3992cc388b88	cairo-1.15.12.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
+sha1 00e81842ae5e81bb0343108884eb5205be0eac14 cairo-1.16.0.tar.xz
 # Calculated based on the hash above
-sha256	7623081b94548a47ee6839a7312af34e9322997806948b6eec421a8c6d0594c9	cairo-1.15.12.tar.xz
+sha256	5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331	cairo-1.16.0.tar.xz
 
 # Hash for license files:
 sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6dffff4b81..902f505aaa 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.15.12
+CAIRO_VERSION = 1.16.0
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-CAIRO_SITE = http://cairographics.org/snapshots
+CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
 # relocation truncated to fit: R_68K_GOT16O
