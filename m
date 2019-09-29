From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:20:50 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-openchrome: bump version to 0.6.0
In-Reply-To: <20190929182050.27218-1-bernd.kuhls@t-online.de>
References: <20190929182050.27218-1-bernd.kuhls@t-online.de>
Message-ID: <20190929182050.27218-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-openchrome.hash                    | 8 ++++++--
 .../xdriver_xf86-video-openchrome.mk                      | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index 2d29fae3a7..57cc9aca9c 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,2 +1,6 @@
-# From https://lists.freedesktop.org/archives/openchrome-devel/2016-July/002890.html
-sha1 9c7ad349de6dd350252ccda8da56fa1e2a6afa32  xf86-video-openchrome-0.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-March/002781.html
+md5 c87f164739729b00f7e1a9934420c22d  xf86-video-openchrome-0.6.0.tar.bz2
+sha1 2077181ded4d86e9cbe6d3e9b1245339692e848d  xf86-video-openchrome-0.6.0.tar.bz2
+sha256 da2975c6379358de52c1257710c67eb59139a7f0a1cd28d00cc64cc3e1c02f75  xf86-video-openchrome-0.6.0.tar.bz2
+# Locally computed
+sha256 1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 0a669e186b..db9e11f6da 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.5.0
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.6.0
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
-- 
2.20.1
