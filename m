From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:37:59 +0200
Subject: [Buildroot] [git commit] libidn2: bump to version 2.0.5
Message-ID: <20180907111608.1E9757F9D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c2aaa8498d01549ef320f9829aedc1071332cd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a small typo in the first comment line of libidn2.hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn2/libidn2.hash | 4 ++--
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 980f78f50d..4afb634e86 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
-# From Calculated locally after checking signature
-sha256	644b6b03b285fb0ace02d241d59483d98bc462729d8bb3608d5cad5532f3d2f0	libidn2-2.0.4.tar.gz
+# Calculated locally after checking signature
+sha256	53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8	libidn2-2.0.5.tar.gz
 
 # Hash for license files:
 sha256	4fa501e804195b4136c9cec4bc510365b8cbaf4bc075d6401a77ae0213370457	COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index d47913b2eb..8e01fba1c4 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.0.4
+LIBIDN2_VERSION = 2.0.5
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE := GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
