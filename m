From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:37:30 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-v4l: mark as broken
Message-ID: <20150214143824.2B71D80172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0ee197f87ed86f6a42862690a1b1297dae9a327
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-v4l/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
index 6d85c17..27ffd87 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ b/package/x11r7/xdriver_xf86-video-v4l/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BROKEN # Fails to build with xorg xserver >= 1.17
 	help
 	  video4linux driver
