From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 May 2013 17:12:38 +0100
Subject: [Buildroot] [PATCH] dbus: add license information
Message-ID: <1368029558-30788-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/dbus/dbus.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ec42874..3aa1345 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,8 +3,11 @@
 # dbus
 #
 #############################################################
+
 DBUS_VERSION = 1.4.24
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_LICENSE = AFLv2.1 GPLv2+
+DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
 DBUS_DEPENDENCIES = host-pkgconf
-- 
1.8.1.2
