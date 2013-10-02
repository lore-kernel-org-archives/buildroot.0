From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 14:34:08 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 5.1.3
Message-ID: <20131002125021.BF7279B912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=574ab8ce9a08d751f8f1d615ec550e6f162f0077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to http gnu site instead of ftp.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 86ed33c..d970545 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GMP_VERSION = 5.1.2
-GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
+GMP_VERSION = 5.1.3
+GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
