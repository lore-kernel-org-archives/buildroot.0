From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:42 -0000
Subject: [Buildroot] [git commit] libfuse: bump to version 2.9.1
Message-ID: <20120903200540.D4B749953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4365fb7f31d6d7901a908667f1ea64ee1d0e67d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfuse/libfuse.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 5f748b4..8be3456 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-LIBFUSE_VERSION = 2.9.0
+LIBFUSE_VERSION = 2.9.1
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
+LIBFUSE_LICENSE = GPLv2 LGPLv2.1
+LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_CONF_OPT= --disable-nls \
