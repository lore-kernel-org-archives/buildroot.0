From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:07:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dbus-glib: fix legal info
Message-ID: <20170331071607.2286F826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b670f3879eaa1bc56b6eaeeed54f36aba831219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

dbus glib bindings are dual licensed under AFLv2.1 or GPLv2+.
Separate licenses using 'or' keyword.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f70f0b497f8a072eb22aff0bd934467b706cffd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 4a1e4b4..5a6f5a0 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,7 +7,7 @@
 DBUS_GLIB_VERSION = 0.108
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
-DBUS_GLIB_LICENSE = AFLv2.1, GPLv2+
+DBUS_GLIB_LICENSE = AFLv2.1 or GPLv2+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = \
