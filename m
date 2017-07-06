From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:04:52 +0200
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.20
Message-ID: <20170706190131.4C9FF8010D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcec447e89d1fd2c7458f4f8f88ec15949e8383a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change site to https to avoid a redirection.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.hash | 3 ++-
 package/dbus/dbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 28c750f..3c45de2 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	6049ddd5f3f3e2618f615f1faeda0a115104423a7996b7aa73e2f36e38cc514a  dbus-1.10.18.tar.gz
+# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.20.tar.gz.asc
+sha256	e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48  dbus-1.10.20.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 58ae2be..b794db4 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.18
-DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
+DBUS_VERSION = 1.10.20
+DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
