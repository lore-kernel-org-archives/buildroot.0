From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 16:54:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: bump version to 8.8.3
Message-ID: <20191006145417.7445-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvips/libvips.hash | 3 ++-
 package/libvips/libvips.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index 54d838bb9b..ba40e6dbbe 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  a0ee255a2a1ebfea5b2dff2a780824d7157a78c010d7ddd531279aacefbf2539  vips-8.8.1.tar.gz
+sha256 c5e4dd5a5c6a777c129037d19ca606769b3f1d405fcc9c8eeda906a61491f790  vips-8.8.3.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 3e6af4131d..001a148a7e 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.8.1
+LIBVIPS_VERSION = 8.8.3
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
-- 
2.20.1
