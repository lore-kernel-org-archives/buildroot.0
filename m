From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 18:04:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.36
Message-ID: <20201213170420.992917-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/OISF/libhtp/releases/tag/0.5.36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index df75336df6..8bc1506180 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4c3ac4c6027710455ffe725f24ac6a83b2c13fe0afc83b74df2cca78ba46976a  libhtp-0.5.35.tar.gz
+sha256  ab1dd6cfd4ab4c36624a5c74793d80d1b7f50f5791620f47bfd831a79e32bc4b  libhtp-0.5.36.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index c402cf750e..de82caaa53 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.35
+LIBHTP_VERSION = 0.5.36
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.29.2
