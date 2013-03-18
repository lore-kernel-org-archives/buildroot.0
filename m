From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:05:17 +0100
Subject: [Buildroot] [PATCH 111/120] xproto_scrnsaverproto: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-52-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 360db11..34e708c 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_SCRNSAVERPROTO_VERSION = 1.2.1
+XPROTO_SCRNSAVERPROTO_VERSION = 1.2.2
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
-- 
1.7.10.4
