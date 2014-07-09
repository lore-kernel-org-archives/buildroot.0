From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 16:57:18 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: drop
	host-xfont_font-util dependency
Message-ID: <20140709145833.CBC299D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de7c42fdf4536299dc6ffa5515603c17cdaffa24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is no longer needed now that e244eb12d (xserver_xorg-server: Fix race
condition when installing man pages) has been reverted.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ece528c..779c46d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -52,7 +52,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	mcookie 			\
-	host-xfont_font-util		\
 	host-pkgconf
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
