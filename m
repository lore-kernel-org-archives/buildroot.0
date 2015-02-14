From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:31:58 +0100
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_showfont:
	bump version to 1.0.5
Message-ID: <20150214143823.6BE2880172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29803f9da8c2493beba7e9dfd44b4868eeb49e56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_showfont/xapp_showfont.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 494e2af..c0b8c9a 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.4
+XAPP_SHOWFONT_VERSION = 1.0.5
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
