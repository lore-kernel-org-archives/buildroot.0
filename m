From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:24:47 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-mach64: bumped to 6.9.3
Message-ID: <20130505202744.AE3C599B50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee9e3af06f038d573f6fe2a0d3fa8a88d0962138
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 6e25cd1..659c785 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.1
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.3
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
