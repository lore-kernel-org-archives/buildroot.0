From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:10:54 -0700
Subject: [Buildroot] [PATCH 06/27] package/libdvbsi: bump to version 0.3.8
Message-ID: <20190908161054.26031-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/libdvbsi/libdvbsi.hash | 7 +++++--
 package/libdvbsi/libdvbsi.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdvbsi/libdvbsi.hash b/package/libdvbsi/libdvbsi.hash
index 3628fdbdbe..184da52866 100644
--- a/package/libdvbsi/libdvbsi.hash
+++ b/package/libdvbsi/libdvbsi.hash
@@ -1,5 +1,8 @@
-# From http://www.saftware.de/libdvbsi++/libdvbsi++-0.3.7.tar.bz2.md5
-md5	7eb50352c06b17c499a6d51e18e99ec5	libdvbsi++-0.3.7.tar.bz2
+# From http://www.saftware.de/libdvbsi++/libdvbsi++-0.3.8.tar.bz2.md5
+md5	c8e6ef55ef4b96dacdee250779219d2a  libdvbsi++-0.3.8.tar.bz2
+
+# Locally calculated
+sha256 a5b3fa767aa45267178c169268df886b3e79431f335a24d779edf610e8372f89 libdvbsi++-0.3.8.tar.bz2
 
 # Hash for license file:
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	COPYING
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index bfddd647e1..d1646c0efd 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVBSI_VERSION = 0.3.7
+LIBDVBSI_VERSION = 0.3.8
 LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
 LIBDVBSI_SITE = http://www.saftware.de/libdvbsi++
 LIBDVBSI_INSTALL_STAGING = YES
-- 
2.20.1
