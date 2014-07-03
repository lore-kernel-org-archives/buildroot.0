From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jul 2014 21:47:52 +0200
Subject: [Buildroot] [git commit] dbus: security bump to version 1.8.6
Message-ID: <20140703201547.2831F9D151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fb53252afa7776960e0673f9d9ac6f926f9eebc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: CVE-2014-3532, CVE-2014-3533.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0c8fcf3..429c923 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.4
+DBUS_VERSION = 1.8.6
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
