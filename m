From: Gary Coulbourne <bear@bears.org>
Date: Wed, 19 Dec 2012 13:43:57 -0500
Subject: [Buildroot] [PATCH 1/2] dbus: bump dbus version from 1.4.24 to
	current 1.6.8
In-Reply-To: <1355942638-27288-1-git-send-email-bear@bears.org>
References: <1355942638-27288-1-git-send-email-bear@bears.org>
Message-ID: <1355942638-27288-2-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gary Coulbourne <bear@bears.org>
---
 package/dbus/dbus.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ec42874..694cbfe 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.24
+DBUS_VERSION = 1.6.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
 
-- 
1.7.10.4
