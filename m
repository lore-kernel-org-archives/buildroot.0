From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:44 -0300
Subject: [Buildroot] [PATCH 05/45] dbus-glib: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus-glib/dbus-glib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index bbd6813..5e6552a 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,7 +7,7 @@
 DBUS_GLIB_VERSION = 0.104
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
-DBUS_GLIB_LICENSE = AFLv2.1 GPLv2+
+DBUS_GLIB_LICENSE = AFLv2.1, GPLv2+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = \
-- 
2.4.10
