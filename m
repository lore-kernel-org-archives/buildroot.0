From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 10:51:24 -0300
Subject: [Buildroot] [PATCH] libunistring: bump to version 0.9.7
Message-ID: <1481291484-26775-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new GPLv2 license option.
Unfortunately COPYING is GPLv3, so avoid it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libunistring/libunistring.hash | 2 +-
 package/libunistring/libunistring.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index ba4b642..15e35cb 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	2df42eae46743e3f91201bf5c100041540a7704e8b9abfd57c972b2d544de41b	libunistring-0.9.6.tar.xz
+sha256	2e3764512aaf2ce598af5a38818c0ea23dedf1ff5460070d1b6cee5c3336e797	libunistring-0.9.7.tar.xz
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index bb1641e..ce58b47 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.6
+LIBUNISTRING_VERSION = 0.9.7
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-LIBUNISTRING_LICENSE = LGPLv3+
+LIBUNISTRING_LICENSE = LGPLv3+ or GPLv2
 LIBUNISTRING_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.7.3
