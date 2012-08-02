From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:38 -0000
Subject: [Buildroot] [git commit branch/next] libfuse: bump to version 2.9.0
Message-ID: <20120802195237.3104596F60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=202a0ef1a76cd185b5a6382a769946d9cc01df5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
