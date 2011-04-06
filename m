From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:37 +0200
Subject: [Buildroot] [PATCH 23/63] xlib_libXdamage: version bump to 1.1.3
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-24-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 92f92e5..972d1c0 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.2
+XLIB_LIBXDAMAGE_VERSION = 1.1.3
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_AUTORECONF = NO
-- 
1.7.3.4
