From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Jul 2021 08:44:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.1
Message-ID: <20210719064401.3435130-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update indentation in hash file (two spaces)

https://gitlab.com/libidn/libidn2/-/blob/v2.3.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 10 +++++-----
 package/libidn2/libidn2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 2d2fcdfd15..fb8b449d2a 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,8 +1,8 @@
 # Calculated locally after checking signature
-sha256	e1cb1db3d2e249a6a3eb6f0946777c2e892d5c5dc7bd91c74394fc3a01cab8b5	libidn2-2.3.0.tar.gz
+sha256  8af684943836b8b53965d5f5b6714ef13c26c91eaa36ce7d242e3d21f5d40f2d  libidn2-2.3.1.tar.gz
 
 # Hash for license files:
-sha256	73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76	COPYING
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSERv3
-sha256	01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46	COPYING.unicode
+sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
+sha256  01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46  COPYING.unicode
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 4db302dbf4..a03d9378c7 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.0
+LIBIDN2_VERSION = 2.3.1
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.30.2
