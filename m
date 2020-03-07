From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 23:03:11 +0100
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.15.3
Message-ID: <20200307215045.3718B8FD80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7df87514861ddebc038542d3ac764fa276a2204f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-March/041288.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 12 ++++++------
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 18cc257b72..f39afa0457 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041227.html
-md5 eb6bd2907ad33d53954d70dfb881a643 libinput-1.15.2.tar.xz
-sha1 2a0c4ce80ee43a9a1b274bfe40ca638037716584 libinput-1.15.2.tar.xz
-sha256 971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747 libinput-1.15.2.tar.xz
-sha512 f6b50dbdf6ee6b65f88e020c4292c94c3178125d58629f27c2e52f92b658ccd67e0c5604fbf0b303621ff0386637ce1e291daaa991761d4145e8bcda4dd128a2 libinput-1.15.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041288.html
+md5  6fbea8d51d9194d7ba33f96d7c4cee56  libinput-1.15.3.tar.xz
+sha1  101fd149b851c197323129efcdfe5c1c6c940b43  libinput-1.15.3.tar.xz
+sha256  5b12427dd50489c2b41b04ae2ca54e31a112a33cb861f00ccd15a2ad7a88694d  libinput-1.15.3.tar.xz
+sha512  6636fd618e2b9cfa5ee44701207dc98f2639adc53eb3ef135509d936fb19b2cedf5184eab58e887798d9cf8ee65f35bc9062f7e3630080bcbe45a90a8b631ef2  libinput-1.15.3.tar.xz
 
 # License files
-sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
+sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1d5446e444..f418046257 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.2
+LIBINPUT_VERSION = 1.15.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
