From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 09:12:47 +0100
Subject: [Buildroot] [git commit] libfuse: fix download URL
Message-ID: <20120315081313.4521190D8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d3c0bcfebb7110e28aa7633ed712461b6430bb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old URL nowadays return a 404.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfuse/libfuse.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 3616c65..15c63ab 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,7 @@
 
 LIBFUSE_VERSION = 2.8.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
+LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_CONF_OPT= --disable-nls \
