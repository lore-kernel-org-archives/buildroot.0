From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:29:29 +0200
Subject: [Buildroot] [PATCH 1/1] libiio: bump to version 0.14
Message-ID: <20180501202929.18679-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiio/libiio.hash | 3 ++-
 package/libiio/libiio.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index 027e2a072b..fbb4bccb90 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 002d57f35715821efae66479859bc5357b4d8d33bfff1446b4e17b02ae2c10d2  libiio-0.10.tar.gz
+sha256 12063db7a9366aa00bfd789db30afaddb29686bc29b3ce1e5d4adfe1c3b42527  libiio-0.14.tar.gz
+sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 3fbd39188a..d2376bca34 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.10
+LIBIIO_VERSION = 0.14
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.14.1
