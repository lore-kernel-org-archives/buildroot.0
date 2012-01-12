From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Jan 2012 11:11:26 +0100
Subject: [Buildroot] [git commit] libnl: bump to 3.2.4
Message-ID: <20120112104709.DE00790314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d242cb20945bf00d3e0603ee446044a2067f3d18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 612908b..fc37c7d 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.3
+LIBNL_VERSION = 3.2.4
 LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
