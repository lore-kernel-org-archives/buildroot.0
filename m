From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:36 +0100
Subject: [Buildroot] [PATCH 10/31] package/x11r7/xapp_xinit: bump version to
 1.4.1
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 10 +++++-----
 package/x11r7/xapp_xinit/xapp_xinit.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 58ee1ecb1d..076bd64758 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002863.html
-md5 2da154b2f80ca9637b1a17b13af0880c  xinit-1.4.0.tar.bz2
-sha1 fcdca692b09a45f546016fff78718d1cf7e7852f  xinit-1.4.0.tar.bz2
-sha256 230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef  xinit-1.4.0.tar.bz2
-sha512 53a29081130c1e195eb441ee77ccaa044b18b4cca3d2d5da3a6d67aa421dfd9718fa18b6be6232a41e40cf260c8190064c4d8d9ab771177bd5cd12e77a8fa79e  xinit-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002962.html
+md5 6d506ab2efc17a08e87778654e099d37  xinit-1.4.1.tar.bz2
+sha1 d874a2eecf2c30291e327851b151fdab8183260c  xinit-1.4.1.tar.bz2
+sha256 de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9  xinit-1.4.1.tar.bz2
+sha512 6cbc5d025a891c419f3f4493381b2fca57a67d78df866d2f16a83426f86bad6eca7f240fac12b25cbcc63df0fec41f625407184e044898602d66483715315340  xinit-1.4.1.tar.bz2
 # Locally computed
 sha256 c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7 COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index d911a45953..86a4d92674 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.4.0
+XAPP_XINIT_VERSION = 1.4.1
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-- 
2.20.1
