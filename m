From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:58:19 +0200
Subject: [Buildroot] [git commit] dbus-glib: security bump to version 0.102
Message-ID: <20140704144657.A34319D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bba164b0eec17b155b6cb2767fa3cadd225edcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-0292 (dbus-glib message sender privilege escalation).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
