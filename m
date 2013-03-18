From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:59 +0100
Subject: [Buildroot] [PATCH 019/120] xapp_smproxy: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-20-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 2653cf4..11c470d 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.4
+XAPP_SMPROXY_VERSION = 1.0.5
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
-- 
1.7.10.4
