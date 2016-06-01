From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:10:03 +0200
Subject: [Buildroot] [git commit branch/next] libinput: bump to version 1.3.1
Message-ID: <20160601151010.16FE281F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5386c61796feb30a02ec287ad769a6754aa525dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index bd77321..faf95c3 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/028704.html
-sha256	998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea	libinput-1.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/029126.html
+sha256	cdff653d93395c718f367af61fee866914bc45de75ac94abe7dc1b720462aca9	libinput-1.3.1.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 25ca818..2256287 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.3.0
+LIBINPUT_VERSION = 1.3.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
