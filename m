From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:12:58 -0300
Subject: [Buildroot] [PATCH 09/13] libfuse: bump to version 2.8.5
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
1.7.2.2
