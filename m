From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 21:36:34 +0200
Subject: [Buildroot] [git commit] libiconv: bump to 1.14
Message-ID: <20111005202140.A0C048E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efb5aefbfe5221a3e49702c02ec80428311dc17a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libiconv/libiconv.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 9d02a4a..48a380f 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -3,12 +3,10 @@
 # libiconv
 #
 #############################################################
-LIBICONV_VERSION = 1.12
+LIBICONV_VERSION = 1.14
 LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
-LIBICONV_AUTORECONF = NO
 LIBICONV_INSTALL_STAGING = YES
-LIBICONV_INSTALL_TARGET = YES
 
 # Remove not used preloadable libiconv.so
 define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
