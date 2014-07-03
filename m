From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 16:50:42 -0300
Subject: [Buildroot] [PATCH 2/2] dbus-glib: security bump to version 0.102
In-Reply-To: <1404417042-28116-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404417042-28116-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404417042-28116-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-0292 (dbus-glib message sender privilege escalation).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus-glib/dbus-glib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5af7884..aa44bcb 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.98
-DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
+DBUS_GLIB_VERSION = 0.102
+DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFLv2.1 GPLv2+
 DBUS_GLIB_LICENSE_FILES = COPYING
-- 
1.8.5.5
