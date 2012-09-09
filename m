From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Sep 2012 22:25:07 +0200
Subject: [Buildroot] [git commit] libnl: bump to version 3.2.13
Message-ID: <20120909210322.E7D15995E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44393cddc944aa2d0a9c095a478d689907aba0fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index f757b1b..58f8d17 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.11
+LIBNL_VERSION = 3.2.13
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
+LIBNL_LICENSE = LGPLv2.1+
+LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
 LIBNL_MAKE = $(MAKE1)
