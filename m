From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:43 +0100
Subject: [Buildroot] [PATCH v2 05/22] package/x11r7/xapp_xinit: bump version
 to 1.4.0
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 9 +++++++--
 package/x11r7/xapp_xinit/xapp_xinit.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index f8bab9114c..58ee1ecb1d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2014-September/002477.html
-sha256	75d88d7397a07e01db253163b7c7a00b249b3d30e99489f2734cac9a0c7902b3	xinit-1.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002863.html
+md5 2da154b2f80ca9637b1a17b13af0880c  xinit-1.4.0.tar.bz2
+sha1 fcdca692b09a45f546016fff78718d1cf7e7852f  xinit-1.4.0.tar.bz2
+sha256 230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef  xinit-1.4.0.tar.bz2
+sha512 53a29081130c1e195eb441ee77ccaa044b18b4cca3d2d5da3a6d67aa421dfd9718fa18b6be6232a41e40cf260c8190064c4d8d9ab771177bd5cd12e77a8fa79e  xinit-1.4.0.tar.bz2
+# Locally computed
+sha256 c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7 COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index a796884f6b..d911a45953 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.3.4
+XAPP_XINIT_VERSION = 1.4.0
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-- 
2.11.0
