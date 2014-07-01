From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:33:21 +0200
Subject: [Buildroot] [git commit] libargtable2: add license information
Message-ID: <20140701224921.D53909D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ebc5b28d7c6afc4d948db9e640851a1cbe253a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libargtable2/libargtable2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index cdd6236..48c70cb 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -7,11 +7,12 @@
 LIBARGTABLE2_VERSION = 13
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
-
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPT = --disable-example \
 		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
+LIBARGTABLE2_LICENSE = LGPLv2+
+LIBARGTABLE2_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
