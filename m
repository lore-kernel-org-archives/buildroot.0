From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:26:59 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.16.2
Message-ID: <20201009075442.708B48218E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cbe60dc96102996f44b52e552eafa9185924251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-October/041640.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index dad9f875fd..0c8084a8c4 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-August/041590.html
-md5  51454993fcc576f4480aba8c1c3232ac  libinput-1.16.1.tar.xz
-sha1  7f5df6d17e9a06b6a28ce9eea0a11cf8555b63dd  libinput-1.16.1.tar.xz
-sha256  7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539  libinput-1.16.1.tar.xz
-sha512  86b2d563c2cff2b3d3cae3acdd399030cc785cc9859a06357a99565ef51f95122a8427c8c0883121fb0760613460a29c8cd8c7a7e3ac68115c10330b3b75cbe0  libinput-1.16.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-October/041640.html
+md5  7c0aca7bba3e8559a869ed15b2173b2e  libinput-1.16.2.tar.xz
+sha1  bff5e91ea0ea45509532aaa3e1a876d476e3e82e  libinput-1.16.2.tar.xz
+sha256  fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9  libinput-1.16.2.tar.xz
+sha512  3394faeb0cdb0a543624e150f04a98f3bce8d67438e47455808bde8eec8ea9cdafb86056e5f8d3431352ae33714e490c55edeb51e0af1972c68fca07c1ef1daa  libinput-1.16.2.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3c6873d7fd..f8a58a0fcf 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.16.1
+LIBINPUT_VERSION = 1.16.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
