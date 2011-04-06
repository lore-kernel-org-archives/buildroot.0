From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:25 +0200
Subject: [Buildroot] [PATCH 11/63] xlib_libXrandr: version bump to 1.3.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-12-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 08fbaa4..bb8c292 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.3.0
+XLIB_LIBXRANDR_VERSION = 1.3.1
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_AUTORECONF = NO
-- 
1.7.3.4
