From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2015 21:28:07 +0100
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.6
Message-ID: <20151202203304.3CA7E80AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc2a418cfb16c4c5479d0e3d74757ef048c6476e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
