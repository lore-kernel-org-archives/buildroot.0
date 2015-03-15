From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:16 +0100
Subject: [Buildroot] [PATCH 07/14] package/x11r7/xdriver_xf86-video-mga:
	bump version to 1.6.4, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash |    2 ++
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk   |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
new file mode 100644
index 0000000..081577d
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002533.html
+sha256	48c6690b6751c76f53de64f8dbeaa9d6c62dbcfe890c768fd87167951247d44f	xf86-video-mga-1.6.4.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index b800fcf..dcf751c 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 132dee029e36c9a91a85f178885e94a9f9b5ee37
-XDRIVER_XF86_VIDEO_MGA_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-mga
+XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.4
+XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
-- 
1.7.10.4
