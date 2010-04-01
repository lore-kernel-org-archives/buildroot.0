From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:42 +0100
Subject: [Buildroot] [PATCH 12/16] xkeyboard-config: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-12-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7128d7e..9c9c8b5 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,7 +3,7 @@
 # xkeyboard-config
 #
 #############################################################
-XKEYBOARD_CONFIG_VERSION = 1.2
+XKEYBOARD_CONFIG_VERSION = 1.8
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://xlibs.freedesktop.org/xkbdesc
 XKEYBOARD_CONFIG_AUTORECONF = NO
-- 
1.7.0
