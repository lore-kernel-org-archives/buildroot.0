From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:50:43 +0100
Subject: [Buildroot] [git commit] libinput: bump to version 1.6.2
Message-ID: <20170303225113.B0BC182538@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad283822a1a873ccf8afef7cabacdca23a611ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 7dd4c04..78f022a 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/032940.html
-sha256 9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8  libinput-1.6.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033169.html
+sha256 96fc0e0b24a96042b16e561201979dfa4a3f00a642538195c62f72b79f4084fa  libinput-1.6.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 776e1af..6cfe407 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.6.1
+LIBINPUT_VERSION = 1.6.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
