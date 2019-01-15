From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:21:48 +0100
Subject: [Buildroot] [git commit] libidn2: bump to version 2.1.0
Message-ID: <20190115202334.1D3DB8D63F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f604f10119319c5a845f492401a69e8636f9f114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash for COPYING because a typo was fixed:
https://gitlab.com/libidn/libidn2/commit/de46ee648a56a87904ff42590064289c1f984e23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn2/libidn2.hash | 4 ++--
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 4afb634e86..300cedb479 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,8 +1,8 @@
 # Calculated locally after checking signature
-sha256	53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8	libidn2-2.0.5.tar.gz
+sha256	032398dbaa9537af43f51a8d94e967e3718848547b1b2a4eb3138b20cad11d32	libidn2-2.1.0.tar.gz
 
 # Hash for license files:
-sha256	4fa501e804195b4136c9cec4bc510365b8cbaf4bc075d6401a77ae0213370457	COPYING
+sha256	73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76	COPYING
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSERv3
 sha256	01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46	COPYING.unicode
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 8e01fba1c4..7112553fea 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.0.5
+LIBIDN2_VERSION = 2.1.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE := GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
