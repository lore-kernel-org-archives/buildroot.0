From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 00:08:05 +0200
Subject: [Buildroot] [git commit] libraw: add license information
Message-ID: <20140708222428.15ABB9D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f177e00e20b60718186f2edb828b971804b24d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also add README to _LICENSE_FILES]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index bd52cc0..b9712cd 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -7,10 +7,11 @@
 LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data/
-
 LIBRAW_INSTALL_STAGING = YES
 LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
 			--disable-demosaic-pack-gpl3
+LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
+LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 
 $(eval $(autotools-package))
