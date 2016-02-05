From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  5 Feb 2016 19:34:34 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-glib: bump version to 0.106
Message-ID: <1454697274-30574-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/dbus-glib/dbus-glib.hash | 2 +-
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 572fc40..e5a2ebc 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 bfc1f1a82bfc3ec3ecafe04d0e87bab7e999f50dce4f4a34d0b89caf6bd821f6  dbus-glib-0.104.tar.gz
+sha256 b38952706dcf68bad9c302999ef0f420b8cf1a2428227123f0ac4764b689c046  dbus-glib-0.106.tar.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5e6552a..e191507 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.104
+DBUS_GLIB_VERSION = 0.106
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFLv2.1, GPLv2+
-- 
2.7.0
