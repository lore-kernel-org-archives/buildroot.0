From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:37:02 +0100
Subject: [Buildroot] [git commit] libevdev: bump version to 1.4.6
Message-ID: <20160112204022.A22328274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=042848a35147f4280de1e8d758a266cc2bdcc1a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update version and hash (see [1] for details).

[1] http://lists.freedesktop.org/archives/input-tools/2016-January/001240.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index af78c0f..20ca4fb 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-November/001227.html
-sha256 e91c58ca86e0631186798449e0a78c65474ff562081d968ba0521f76c8c2ca1d libevdev-1.4.5.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2016-January/001240.html
+sha256 7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3 libevdev-1.4.6.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index b126943..5513191 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.5
+LIBEVDEV_VERSION = 1.4.6
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
