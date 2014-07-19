From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:09:06 +0200
Subject: [Buildroot] [git commit] xlib_libICE: Bump version to 1.0.9
Message-ID: <20140719163639.8FA0C9CFD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcc97403913952b11069b99a9f3a35d4a760eb8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libICE/xlib_libICE.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index dd6814e..6f69bfb 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.8
+XLIB_LIBICE_VERSION = 1.0.9
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_LICENSE = MIT
