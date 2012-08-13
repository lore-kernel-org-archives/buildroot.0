From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:40 -0300
Subject: [Buildroot] [PATCH 6/7] libfuse: bump to version 2.9.1
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
