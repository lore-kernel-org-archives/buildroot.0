From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:45 +0200
Subject: [Buildroot] [PATCH 31/63] xlib_libICE: version bump to 1.0.7
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-32-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xlib_libICE/xlib_libICE.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 99cb11b..50c2a40 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.6
+XLIB_LIBICE_VERSION = 1.0.7
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_AUTORECONF = NO
-- 
1.7.3.4
