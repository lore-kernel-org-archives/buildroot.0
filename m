From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 18 May 2021 06:46:26 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.106
Message-ID: <20210518044626.17073-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 25c3a042cb..079675824a 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-April/302515.html
-sha256  1d1d024b7cadc63e2b59cddaca94f78864940ab440843841113fbac6afaf2a46  libdrm-2.4.105.tar.xz
-sha512  083a04af7208e58be21b89c6ebdbe2db3ba00cd29f0d271bd38bfe97dfca741edafddaaf9b5b95c20fac2c9b700434ea5b21397de26f7073169ad6f5b090f715  libdrm-2.4.105.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-May/307025.html
+sha256  92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4  libdrm-2.4.106.tar.xz
+sha512  33140e579906ab54b716149056af500c628ce41cd9ae3b0c33496693d2f5903fbcfccee8a942dd1560e1591111ed240da42612d5af5e75558db6f6a85d14617d  libdrm-2.4.106.tar.xz
 
 # Hash for license file
 sha256  a69e38953c20a88845cc739c05dd604da4c977844b872e126c91a0ca2e1385b7  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5b205bb00..f18df27687 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.105
+LIBDRM_VERSION = 2.4.106
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.29.2
