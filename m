From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 08:02:12 -0300
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.8.14
Message-ID: <1420542132-12262-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-8148 - If a system service installs unsafe security
policy rules that allow arbitrary method calls then this prevents memory
consumption and possible privilege escalation via
UpdateActivationEnvironment.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 4ae6d03..2079929 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c91428f28d2925ba32d34ffc824bfcf4d40d5e1e67befc4bcf2202f0a862501e  dbus-1.8.12.tar.gz
+sha256	83425250a6a4c93b9ab4a349771a7700e8ddff2d73a5a088222ca47ae9ce1f1a  dbus-1.8.14.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 5e4fd19..faad2b5 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.12
+DBUS_VERSION = 1.8.14
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
2.0.5
