From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:14:14 +0100
Subject: [Buildroot] [git commit] libnl: bump to version 3.2.7
Message-ID: <20120311222557.31B5B90D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0785fbd88dc7d59573a066be7f9543981af76fb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index fc37c7d..661d7f2 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.4
-LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
-LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
+LIBNL_VERSION = 3.2.7
+LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
 LIBNL_MAKE = $(MAKE1)
