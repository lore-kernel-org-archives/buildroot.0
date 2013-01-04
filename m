From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 21:48:29 +0100
Subject: [Buildroot] [git commit] gmp: bump to version 5.1.0
Message-ID: <20130104211238.DC0079A60C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25c03d89f1556218f0d907cce0e6f0613f6bc711
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmp/gmp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 72673c7..093d60c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-GMP_VERSION = 5.0.5
-GMP_SITE = $(BR2_GNU_MIRROR)/gmp
+GMP_VERSION = 5.1.0
+GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
