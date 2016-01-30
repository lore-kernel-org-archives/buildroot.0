From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:17:12 +0100
Subject: [Buildroot] [PATCH 1/5] package/libraw: bump version to 0.17.1
Message-ID: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libraw/libraw.hash | 2 +-
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 98d3c12..e23ca9c 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	588caf5324c76240d6370852691e05ac8ef89428ee8d45168f15ce47422bc36b  LibRaw-0.13.4.tar.gz
+sha256	e599651a4cc37e00cfc2d2b56be87c3a4e4dae2c360b680fe9ab3f93d07cdea1	LibRaw-0.17.1.tar.gz
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 9c3522b..2f8643d 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.13.4
+LIBRAW_VERSION = 0.17.1
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-- 
2.7.0.rc3
