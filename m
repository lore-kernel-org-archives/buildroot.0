From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 02 Sep 2016 14:29:37 -0000
Subject: [Buildroot] [git commit] libinput: bump to version 1.4.1
Message-ID: <20160902142935.7CF3D822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc66f2585b3823da11ac65d9ca6d37d3a1f53a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 9f628cc..a1a7ca2 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-July/030121.html
-sha256	76ef10874519d1a67b57e5c68ede06106b9fbf611a3ecf69c84886107c67b420	libinput-1.4.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030348.html
+sha256	26e7b3ab499358caba499705680ea7e5851af2bd37dc32f2be64181610d6392a	libinput-1.4.1.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 01b6772..5ce51c2 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.4.0
+LIBINPUT_VERSION = 1.4.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
