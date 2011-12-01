From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:27 -0000
Subject: [Buildroot] [git commit] libgpg-error: bump to version 1.10
Message-ID: <20111201085825.EAF868F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f52b2ae1d2bbc5784c10dda397493236fb1ed5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.10, closes bug #3403
Switch to gnupg.org mirror, closes bug #3409

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgpg-error/libgpg-error.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 45a348e..1b78b17 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -3,10 +3,9 @@
 # libgpg-error
 #
 #############################################################
-LIBGPG_ERROR_VERSION:=1.8
-LIBGPG_ERROR_SOURCE:=libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
-LIBGPG_ERROR_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
 
+LIBGPG_ERROR_VERSION = 1.10
+LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
