From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:27:45 +0200
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.0
Message-ID: <20151009132822.E622B81F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=601a52a46f664ee30aa898ee097638a120e2728d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.hash |    2 +-
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 5df22ef..4db2dd3 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a  dbus-1.8.20.tar.gz
+sha256	1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b  dbus-1.10.0.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a76f24a..abce1fb 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.20
+DBUS_VERSION = 1.10.0
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
