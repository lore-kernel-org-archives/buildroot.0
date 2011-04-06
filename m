From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:27 +0200
Subject: [Buildroot] [PATCH 13/63] xlib_libXp: version bump to 1.0.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-14-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xlib_libXp/xlib_libXp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index c462eee..c0e7755 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXP_VERSION = 1.0.0
+XLIB_LIBXP_VERSION = 1.0.1
 XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
 XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXP_AUTORECONF = NO
-- 
1.7.3.4
