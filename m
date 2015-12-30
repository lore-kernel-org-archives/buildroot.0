From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:57:23 +0100
Subject: [Buildroot] [git commit] libfuse: use LIBFUSE_VERSION variable in
	URL
Message-ID: <20151230145745.3BC2D8274F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=556aab13e4d33c06feeb8f2145f9aacfac035021
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfuse/libfuse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 32d70d3..9928d62 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,7 @@
 
 LIBFUSE_VERSION = 2.9.4
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4
+LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_$(subst .,_,$(LIBFUSE_VERSION))
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
