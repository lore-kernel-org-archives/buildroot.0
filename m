From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Apr 2020 18:13:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libinput: bump
 version to 1.15.4
Message-ID: <20200406160115.7036388912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40d7bc04e5ff208f0688d5e4e984d733a849ee9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-March/041332.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a414894cfa9b4ace4e47be279135ba9be3bbbb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f39afa0457..ee6416e3b8 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041288.html
-md5  6fbea8d51d9194d7ba33f96d7c4cee56  libinput-1.15.3.tar.xz
-sha1  101fd149b851c197323129efcdfe5c1c6c940b43  libinput-1.15.3.tar.xz
-sha256  5b12427dd50489c2b41b04ae2ca54e31a112a33cb861f00ccd15a2ad7a88694d  libinput-1.15.3.tar.xz
-sha512  6636fd618e2b9cfa5ee44701207dc98f2639adc53eb3ef135509d936fb19b2cedf5184eab58e887798d9cf8ee65f35bc9062f7e3630080bcbe45a90a8b631ef2  libinput-1.15.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041332.html
+md5  76c5cb1a55f5098ed353ae7d4e054c50  libinput-1.15.4.tar.xz
+sha1  43740a5fec3f6d474906173cc01ff3d73d935d2f  libinput-1.15.4.tar.xz
+sha256  9c8b6846d94e374ee4bdb32634e4ac4aa318afc31f9a58fcb545cd3095c745c1  libinput-1.15.4.tar.xz
+sha512  4659818952dc729cd5bdb78ebe21edbbacbf8a66a592b13ba30f3bb4c4e264208ec94440a253cfa4edc8b2ef904954eecea6be0f8d63cf239e3858d3abb64a80  libinput-1.15.4.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f418046257..5e2ee696bf 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.3
+LIBINPUT_VERSION = 1.15.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
