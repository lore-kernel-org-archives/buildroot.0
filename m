From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:22 +0200
Subject: [Buildroot] [PATCH 08/63] xlib_libXScrnSaver: version bump
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-9-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index ee45948..7f9fefd 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.1
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_AUTORECONF = NO
-- 
1.7.3.4
