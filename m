From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:41:11 +0100
Subject: [Buildroot] [git commit] libnl: bump to version 3.2.3
Message-ID: <20111226160333.BC60D8FDD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f266b685f487d92208f07c0f5b2fa50e042bf06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This newer version splits the library code into libnl, libnl-route,
libnl-genl and libnl-nf, each individually selectable via pkgconfig.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index dd0d7fb..612908b 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.0
+LIBNL_VERSION = 3.2.3
 LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
