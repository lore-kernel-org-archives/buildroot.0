From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2015 13:35:07 +0100
Subject: [Buildroot] [git commit] dbus-glib: bump version 0.104
Message-ID: <20150316123615.3A15A807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da489487d7392c92d6101ab26b96145974d589c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.hash |    2 ++
 package/dbus-glib/dbus-glib.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
new file mode 100644
index 0000000..572fc40
--- /dev/null
+++ b/package/dbus-glib/dbus-glib.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 bfc1f1a82bfc3ec3ecafe04d0e87bab7e999f50dce4f4a34d0b89caf6bd821f6  dbus-glib-0.104.tar.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index ee23a2a..bbd6813 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.102
+DBUS_GLIB_VERSION = 0.104
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFLv2.1 GPLv2+
