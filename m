From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:39 +0100
Subject: [Buildroot] [PATCH 073/120] xkeyboard-config: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-14-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index c619da9..bd3314c 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,7 +3,7 @@
 # xkeyboard-config
 #
 #############################################################
-XKEYBOARD_CONFIG_VERSION = 2.0
+XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
-- 
1.7.10.4
