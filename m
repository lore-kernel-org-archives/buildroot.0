From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Apr 2017 10:43:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpthread-stubs: bump version to
	0.4
Message-ID: <20170408084325.2830-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libdrm 2.4.77 needs it since
https://cgit.freedesktop.org/mesa/drm/commit/?id=63120172668610cebfd01e89f67e73037037dfd9

Fixes:
http://autobuild.buildroot.net/results/732/732652f34f4865462007a3ebeb40d6642fde028b/
http://autobuild.buildroot.net/results/b5d/b5d7667737c92de5d19313ec6bb0ec9ce81707ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpthread-stubs/libpthread-stubs.hash | 4 ++--
 package/libpthread-stubs/libpthread-stubs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpthread-stubs/libpthread-stubs.hash b/package/libpthread-stubs/libpthread-stubs.hash
index 8211455d2..b6e38e8e7 100644
--- a/package/libpthread-stubs/libpthread-stubs.hash
+++ b/package/libpthread-stubs/libpthread-stubs.hash
@@ -1,2 +1,2 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 35b6d54e3cc6f3ba28061da81af64b9a92b7b757319098172488a660e3d87299 libpthread-stubs-0.3.tar.bz2
+# Locally computed
+sha256 e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733  libpthread-stubs-0.4.tar.bz2
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index 856793c4e..9cf697075 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPTHREAD_STUBS_VERSION = 0.3
+LIBPTHREAD_STUBS_VERSION = 0.4
 LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
 LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
 LIBPTHREAD_STUBS_LICENSE = MIT
-- 
2.11.0
