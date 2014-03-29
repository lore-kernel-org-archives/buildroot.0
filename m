From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:14 +0100
Subject: [Buildroot] [git commit] xapp_xfontsel: Bump version to 1.0.5
Message-ID: <20140329222159.692AD9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c46daf0ee40c0ac7acf6556e1e5b877491e58cd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 1a64763..781b4d3 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.0.4
+XAPP_XFONTSEL_VERSION = 1.0.5
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
