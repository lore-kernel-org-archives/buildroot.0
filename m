From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 14:34:09 +0200
Subject: [Buildroot] [git commit] libevdev: bump version to 1.4.2
Message-ID: <20150425123415.A22E9807A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f76280613673a533b549ccab2af5ffa45ca87f62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update version and hash (see [1] for details).

[1] http://lists.freedesktop.org/archives/input-tools/2015-April/001167.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.hash |    4 ++--
 package/libevdev/libevdev.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 868a245..535490b 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-April/001166.html
-sha256 5179d3c9a71dd764b4ab9df21edcdb5b61832cbc48ad90b75a52ac79cf8fae85 libevdev-1.4.1.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-April/001167.html
+sha256 7c77b213f075706d428a2af54b66bf86b03a68e9fb390e7ec48cf55065970643 libevdev-1.4.2.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index eb26517..3ed7ba0 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.1
+LIBEVDEV_VERSION = 1.4.2
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
