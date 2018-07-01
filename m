From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Jul 2018 10:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] libv4l: bump to version 1.14.2
Message-ID: <20180701084102.12335-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.hash | 4 ++--
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index aea9cc988f..5e0df1f7a9 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.14.1.tar.bz2.asc
-sha256 7974e5626447407d8a1ed531da0461c0fe00e599a696cb548a240d17d3519005  v4l-utils-1.14.1.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.14.2.tar.bz2.asc
+sha256 e6b962c4b1253cf852c31da13fd6b5bb7cbe5aa9e182881aec55123bae680692  v4l-utils-1.14.2.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index c95b2778cd..55f02b7e8e 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.14.1
+LIBV4L_VERSION = 1.14.2
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.14.1
