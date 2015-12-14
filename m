From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:06 -0300
Subject: [Buildroot] [PATCH 27/45] dbus: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-28-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ed54575..3cdc42a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 DBUS_VERSION = 1.10.6
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFLv2.1 GPLv2+
+DBUS_LICENSE = AFLv2.1, GPLv2+
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
-- 
2.4.10
