From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 16:50:41 -0300
Subject: [Buildroot] [PATCH 1/2] dbus-glib: add license information
Message-ID: <1404417042-28116-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus-glib/dbus-glib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index ca1df22..5af7884 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,6 +7,8 @@
 DBUS_GLIB_VERSION = 0.98
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
 DBUS_GLIB_INSTALL_STAGING = YES
+DBUS_GLIB_LICENSE = AFLv2.1 GPLv2+
+DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
 		ac_cv_func_posix_getpwnam_r=yes \
-- 
1.8.5.5
