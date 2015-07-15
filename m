From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:48 +0200
Subject: [Buildroot] [PATCH 09/15] package/x11r7/xdriver_xf86-video-savage:
	bump version to 2.3.8
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash      |    2 ++
 .../x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk  |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
new file mode 100644
index 0000000..25afb13
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002603.html
+sha256	fdcea4a86532bceb50095eaf0fe2f38bbfa160e98463b815f4b549eb9985fa63	xf86-video-savage-2.3.8.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 676ffed..dc5644a 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = d28cd83c7b0b4a943efbe5ddf257c8ee2646ea73
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-savage
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.8
+XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
-- 
1.7.10.4
