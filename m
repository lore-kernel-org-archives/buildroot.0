From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:11:18 -0700
Subject: [Buildroot] [PATCH 09/27] package/libv4l: bump to version 1.16.6
Message-ID: <20190908161118.26263-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/libv4l/libv4l.hash | 5 +++--
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 99d5021939..78351c97e5 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.5.tar.bz2.asc
-sha256 ed80242510385017a1dc566e17a285a77222bb301f5bc19386badfcc2c19df1b  v4l-utils-1.16.5.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.6.tar.bz2.asc
+# with key 05D0169C26E41593418129DF199A64FADFB500FF
+sha256 f9dac1878e3d5636eab7f56bb209fdfc66b94ee8a2aae54dcb4282fe63a678ae  v4l-utils-1.16.6.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 22895a9e2c..b31d1a4c41 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.16.5
+LIBV4L_VERSION = 1.16.6
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.20.1
