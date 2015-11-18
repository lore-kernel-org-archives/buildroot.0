From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:53:36 +0100
Subject: [Buildroot] [git commit branch/next] dbus: bump to version 1.10.4
Message-ID: <20151118205349.707E381EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c20fccf3514abb727cc733b1bf809024ada01103
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.hash |    2 +-
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 7e21dd0..87efd4b 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e  dbus-1.10.2.tar.gz
+sha256	ad7dcad73ad9b0ff55819985d354eacfffe07e2eb8c763e155efc21d6001084b  dbus-1.10.4.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 9e722d8..79cd678 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.2
+DBUS_VERSION = 1.10.4
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
