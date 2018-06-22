From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Jun 2018 23:25:26 +0200
Subject: [Buildroot] [PATCH 1/1] libnss: bump to version 3.38
Message-ID: <20180622212526.602-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 2b79901a7c..2a7ca2b065 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_37_3_RTM/src/SHA256SUMS
-sha256	9af2bbb615d010bd866bb83f8c0bb22b0fa086171e93030ffb03da3da15cc5be  nss-3.37.3.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_38_RTM/src/SHA256SUMS
+sha256	2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086672f62  nss-3.38.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index dd84aafcbe..03f575014d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION_MAJOR = 3.37
-LIBNSS_VERSION = $(LIBNSS_VERSION_MAJOR).3
+LIBNSS_VERSION = 3.38
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.14.1
