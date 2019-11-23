From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:38:57 +0100
Subject: [Buildroot] [git commit branch/next] package/libidn2: bump to
 version 2.3.0
Message-ID: <20191123203328.263BD8FAB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a25e67fe87644dfc6d25030dca152b7eb0f9c546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 3dae7f7590..2d2fcdfd15 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256	fc734732b506d878753ec6606982bf7b936e868c25c30ddb0d83f7d7056381fe	libidn2-2.2.0.tar.gz
+sha256	e1cb1db3d2e249a6a3eb6f0946777c2e892d5c5dc7bd91c74394fc3a01cab8b5	libidn2-2.3.0.tar.gz
 
 # Hash for license files:
 sha256	73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76	COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 5e05634942..3f87b9bb8c 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.2.0
+LIBIDN2_VERSION = 2.3.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
