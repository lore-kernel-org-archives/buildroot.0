From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:39 +0200
Subject: [Buildroot] [PATCH 25/63] xlib_libXcomposite: version bump to 0.4.3
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-26-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 64b98d4..9996ed0 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.1
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.3
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_AUTORECONF = NO
-- 
1.7.3.4
