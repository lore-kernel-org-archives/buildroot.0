From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Jul 2021 07:11:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglu: bump version to 9.0.2
Message-ID: <20210701051142.85616-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html

Removed md5 & sha1 hashes not provided by upstream anymore.

Updated license hash due to upstream commit:
https://cgit.freedesktop.org/mesa/glu/commit/?id=a172e0aec8f537f365078dab5486cae9c9a6880e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglu/libglu.hash | 10 ++++------
 package/libglu/libglu.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
index b0202a1334..234b58dd63 100644
--- a/package/libglu/libglu.hash
+++ b/package/libglu/libglu.hash
@@ -1,7 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-July/000530.html
-md5 151aef599b8259efe9acd599c96ea2a3  glu-9.0.1.tar.xz
-sha1 b6ffef562ba55d3f80146d4238589cb9b1de66f5  glu-9.0.1.tar.xz
-sha256 fb5a4c2dd6ba6d1c21ab7c05129b0769544e1d68e1e3b0ffecb18e73c93055bc  glu-9.0.1.tar.xz
-sha512 8a6dae5b4bd63efb96d15f23ccda4ad9c2ffaa964897e5fa63d1e58360d8d4e6732c5efd2109dba04155d5fc457ab1718a65cf9b544ce0d452679ba988d04018  glu-9.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html
+sha256  6e7280ff585c6a1d9dfcdf2fca489251634b3377bfc33c29e4002466a38d02d4  glu-9.0.2.tar.xz
+sha512  2517d7406bb643d12c017a95dcb5d8716f307344332638bcbdf274a90752a7c22165d34745f1b082ed916bb07d40e62d1d1d67d96426225be63166f3480d6f64  glu-9.0.2.tar.xz
 # locally computed
-sha256  84187ce0fd0153769675cb7f3301583eb27393f66b57c5604999a1d805a9184c  include/GL/glu.h
+sha256  3a9992ccc9d672cfdd07ea862431d943a992d04836570c638a733bf15ec62c54  include/GL/glu.h
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index e18c7f1494..8820e75d8b 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLU_VERSION = 9.0.1
+LIBGLU_VERSION = 9.0.2
 LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
 LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
 LIBGLU_LICENSE = SGI-B-2.0
-- 
2.30.2
