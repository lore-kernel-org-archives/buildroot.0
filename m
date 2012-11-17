From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:13:31 +0100
Subject: [Buildroot] [git commit] xapp_xload: bump version to 1.1.1 to fix
	Xmu related build failure
Message-ID: <20121117081602.95001996F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ec8bf1235e12e5f363cf5beab1831452fb06311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xload/xapp_xload.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index ace06c6..8580391 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.0.2
+XAPP_XLOAD_VERSION = 1.1.1
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
