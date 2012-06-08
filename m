From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:40 -0300
Subject: [Buildroot] [PATCH 1/7] libfuse: bump to version 2.9.0
Message-ID: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/libfuse.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 15c63ab..c95ea3e 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFUSE_VERSION = 2.8.7
+LIBFUSE_VERSION = 2.9.0
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 
-- 
1.7.3.4
