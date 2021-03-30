From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:59:16 +0200
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.8.3
Message-ID: <20210330193424.522E186E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2e85cf0c09a5c69301341948edf6ed9371d9d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This minor release fixes an issue which would cause applications using
wpewebkit and webkitgtk freeze under certain conditions during normal
browsing. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.8.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 89d58051c7..27e827ae2e 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.2.tar.xz.sums
-md5  93ca185b5c0f539abbf7ab32cfdc96b2  wpebackend-fdo-1.8.2.tar.xz
-sha1  715a1a1e0cfd85898a1f686ec4c5b79a1e8cfb9c  wpebackend-fdo-1.8.2.tar.xz
-sha256  98c291071128326a72918d670a46ef63268c43267928560ac3b84b6aebb2d78d  wpebackend-fdo-1.8.2.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.3.tar.xz.sums
+md5  980cbda207bf8f6263799c5062425737  wpebackend-fdo-1.8.3.tar.xz
+sha1  c849043039d805448715be90cb5b3491f0a90c5f  wpebackend-fdo-1.8.3.tar.xz
+sha256  3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e  wpebackend-fdo-1.8.3.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 193b4cf7ed..5f7e7acf30 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.8.2
+WPEBACKEND_FDO_VERSION = 1.8.3
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
