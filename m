From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] libfuse: bump to version 2.8.5
Message-ID: <20110117202412.6627489008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3a322f4a8216b3ce69040a17c2683b533675ac4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fuse/libfuse.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 87d746f..5a86e84 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -3,12 +3,12 @@
 # libfuse
 #
 #############################################################
-LIBFUSE_VERSION:=2.8.4
-LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
+
+LIBFUSE_VERSION = 2.8.5
+LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
+LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 
 LIBFUSE_INSTALL_STAGING = YES
-LIBFUSE_LIBTOOL_PATCH = NO
 LIBFUSE_CONF_OPT= --program-prefix="" \
 		--enable-shared \
 		--enable-static \
-- 
1.7.3.4
