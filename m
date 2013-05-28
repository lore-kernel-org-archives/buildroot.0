From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:27:37 +0200
Subject: [Buildroot] [git commit] Revert "gmp: bump to version 5.1.2"
Message-ID: <20130528213106.ED5459A621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2d64f88f592010a5f45e4d55c5884110b9d6188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 78927d3f92f0a397e9551dee491e26602e63a30a.

This was supposed to have been for next, not 2013.05.
---
 package/gmp/gmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cf5c310..e895a48 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GMP_VERSION = 5.1.2
+GMP_VERSION = 5.1.1
 GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
