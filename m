From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Sep 2011 15:34:19 +0200
Subject: [Buildroot] [git commit] fuse: bump version
Message-ID: <20110915155036.319518D5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=25c117fa2a6c0f8e58d5786e4ea9e1e00893d2dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fuse/libfuse.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 45fb2f3..86e57ff 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFUSE_VERSION = 2.8.5
+LIBFUSE_VERSION = 2.8.6
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 
-- 
1.7.3.4
