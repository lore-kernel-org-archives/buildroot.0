From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 12:02:12 -0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.6
Message-ID: <1449068532-14408-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 87efd4b..10ebc81 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ad7dcad73ad9b0ff55819985d354eacfffe07e2eb8c763e155efc21d6001084b  dbus-1.10.4.tar.gz
+sha256	b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f  dbus-1.10.6.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 79cd678..ed54575 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.4
+DBUS_VERSION = 1.10.6
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
2.4.10
