From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:26:08 +0100
Subject: [Buildroot] [git commit] libevdev: bump version to 1.3.2
Message-ID: <20141207202611.43711800F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deffc1ad972716ade4bbcb66937260ba164731d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2014-December/001132.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.hash |    4 ++--
 package/libevdev/libevdev.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index b53a4ce..83b5bdd 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html
-sha256 4b7c76195f0087023142f26c5fd2c254b35c861880c6902d3dd9b27daeec2643 libevdev-1.3.1.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2014-December/001132.html
+sha256 a4317de9e818093dc131cc2bb96cdfc0cebd631e4be5c5244e1e373ce1536eed libevdev-1.3.2.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 2fc8ff7..56247be 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.3.1
+LIBEVDEV_VERSION = 1.3.2
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
