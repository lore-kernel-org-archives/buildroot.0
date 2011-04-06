From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:30 +0200
Subject: [Buildroot] [PATCH 16/63] xlib_libXinerama: version bump to 1.1.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-17-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 4c43e79..d47d5ba 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1
+XLIB_LIBXINERAMA_VERSION = 1.1.1
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_AUTORECONF = NO
-- 
1.7.3.4
