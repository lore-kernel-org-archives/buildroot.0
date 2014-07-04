From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:58:10 +0200
Subject: [Buildroot] [git commit] dbus-glib: add license information
Message-ID: <20140704144657.9B8F39D18A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71e06e10d7c7455717ddfcd52f30aa4a284d4240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
