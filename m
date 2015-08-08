From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next]
	package/xdriver_xf86-video-cirrus: remove autoreconf
Message-ID: <20150808105638.B5F79803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=022953e77dce2d1c96dc7e0d6f964f5291011bb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xdriver_xf86-video-cirrus no longer use the git repository.

commit: e45edc34fadcd6e666a123a4ab32a13b37dc3f74

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-cirrus.mk                   |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index f2523db..78e8a9c 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,7 +9,6 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
