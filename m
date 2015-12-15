From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:49 +0100
Subject: [Buildroot] [git commit] dbus: comma separate licenses
Message-ID: <20151215210844.A1C15818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e9753f924678d831bab56b3bf4d25ed73e95eec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
