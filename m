From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 22:59:30 +0100
Subject: [Buildroot] [git commit] libsoc: bump to 0.6
Message-ID: <20140202215948.23D0A9C757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f39ccc9f17e23b98c68850ae2ff7b8f5de1af0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --disable-debug to unset default DEBUG option.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoc/libsoc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 3e9ce97..09aee35 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.5
+LIBSOC_VERSION = 0.6
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
+LIBSOC_CONF_OPT = --disable-debug
 
 $(eval $(autotools-package))
