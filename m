From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 22:17:23 +0100
Subject: [Buildroot] [git commit] xapp_xinput: bump to 1.5.4
Message-ID: <20120201212001.B16AA9096E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a9fe6406786b46a80538aba1b58c3092636a0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xinput/xapp_xinput.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 4e6884d..4bc5879 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.5.0
+XAPP_XINPUT_VERSION = 1.5.4
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
