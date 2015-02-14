From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:32:06 +0100
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xcalc: bump
	version to 1.0.6
Message-ID: <20150214143823.7469A80172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a44fd484555055718c31ee273451b448d56ddc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xcalc/xapp_xcalc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index 2a1f717..58fbdf5 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCALC_VERSION = 1.0.5
+XAPP_XCALC_VERSION = 1.0.6
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
 XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_LICENSE = MIT
