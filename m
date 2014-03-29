From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:47 +0100
Subject: [Buildroot] [git commit] xapp_showfont: Bump version to 1.0.4
Message-ID: <20140329222200.051609C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c4065d8144d3dfb309d31e7b05de3b8d71cbede
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_showfont/xapp_showfont.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 413786a..494e2af 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.1
+XAPP_SHOWFONT_VERSION = 1.0.4
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
