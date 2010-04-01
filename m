From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:43 +0100
Subject: [Buildroot] [PATCH 13/16] xproto_evieext: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-13-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_evieext/Config.in         |    2 +-
 package/x11r7/xproto_evieext/xproto_evieext.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_evieext/Config.in b/package/x11r7/xproto_evieext/Config.in
index 3e66118..4d04b95 100644
--- a/package/x11r7/xproto_evieext/Config.in
+++ b/package/x11r7/xproto_evieext/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_EVIEEXT
 	bool "evieext"
 	help
-	  evieext 1.0.2
+	  evieext 1.1.0
 	  X.Org EvIE protocol headers
diff --git a/package/x11r7/xproto_evieext/xproto_evieext.mk b/package/x11r7/xproto_evieext/xproto_evieext.mk
index aa0a733..1c45f12 100644
--- a/package/x11r7/xproto_evieext/xproto_evieext.mk
+++ b/package/x11r7/xproto_evieext/xproto_evieext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_EVIEEXT_VERSION = 1.0.2
+XPROTO_EVIEEXT_VERSION = 1.1.0
 XPROTO_EVIEEXT_SOURCE = evieext-$(XPROTO_EVIEEXT_VERSION).tar.bz2
 XPROTO_EVIEEXT_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_EVIEEXT_AUTORECONF = NO
-- 
1.7.0
