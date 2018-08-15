From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 00:29:04 +0200
Subject: [Buildroot] [git commit] bzip2: change upstream site
Message-ID: <20180815222203.0EAF38D43F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f45976b2c759b1630a2886e75312340b3b511f81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bzip.org website is down. Use the Buildroot backup download site.
Remove the website link as there is no clear alternative upstream at
this point.

  https://lwn.net/Articles/762264/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bzip2/Config.in | 2 --
 package/bzip2/bzip2.mk  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index dbc82496df..ca447bbb2d 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -5,5 +5,3 @@ config BR2_PACKAGE_BZIP2
 	  It typically compresses files to within 10% to 15% of the best
 	  available techniques, while being around twice as fast at
 	  compression and six times faster at decompression.
-
-	  http://www.bzip.org
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index e43533072b..a3af322993 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BZIP2_VERSION = 1.0.6
-BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
+BZIP2_SITE = http://sources.buildroot.net
 BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
