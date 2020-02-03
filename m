From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 21:30:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: bump to version 1.17.2
Message-ID: <20200203203039.2437654-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.hash | 6 +++---
 package/cairo/cairo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 949ed3ffee..b647b55491 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,7 @@
-# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
-sha1 00e81842ae5e81bb0343108884eb5205be0eac14 cairo-1.16.0.tar.xz
+# From https://cairographics.org/snapshots/cairo-1.17.2.tar.xz.sha1
+sha1 c5d6f12701f23b2dc2988a5a5586848e70e858fe cairo-1.17.2.tar.xz
 # Calculated based on the hash above
-sha256	5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331	cairo-1.16.0.tar.xz
+sha256	6b70d4655e2a47a22b101c666f4b29ba746eda4aa8a0f7255b32b2e9408801df	cairo-1.17.2.tar.xz
 
 # Hash for license files:
 sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 902f505aaa..10f6a661f8 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.16.0
+CAIRO_VERSION = 1.17.2
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-CAIRO_SITE = http://cairographics.org/releases
+CAIRO_SITE = http://cairographics.org/snapshots
 CAIRO_INSTALL_STAGING = YES
 
 # relocation truncated to fit: R_68K_GOT16O
-- 
2.24.1
