From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  5 Nov 2020 19:56:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: bump version to 2.9.1
Message-ID: <20201105185637.485339-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index a83e28389b..208da06592 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.8.0/libva-utils-2.8.0.tar.bz2.sha1sum
-sha1  10351adf67aa03f5eeb54cb0aab3e2631ba4d102  libva-utils-2.8.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.9.1/libva-utils-2.9.1.tar.bz2.sha1sum
+sha1  92d8118e112bca8d8497c10a5f896610883a9775  libva-utils-2.9.1.tar.bz2
 # Locally computed
-sha256  8acad2c16bfef408643cf4de56c324345449f202e4a3a5b012a62a1d3af400ef  libva-utils-2.8.0.tar.bz2
+sha256  66558051b280f0f82781b80d355c198105235b5887e6fcb703ef1a679646c814  libva-utils-2.9.1.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 5d3fb95c41..2e26df7100 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.8.0
+LIBVA_UTILS_VERSION = 2.9.1
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
-- 
2.27.0
