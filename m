From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:00 +0100
Subject: [Buildroot] [PATCH 020/120] xapp_xauth: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-21-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_xauth/xapp_xauth.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index d075c05..a34ec00 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.0.5
+XAPP_XAUTH_VERSION = 1.0.7
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
-- 
1.7.10.4
