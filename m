From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 08:52:46 +0100
Subject: [Buildroot] [git commit branch/next] package/libinput: bump version
 to 1.16.4
Message-ID: <20201128073844.7629B7FB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840f5065b3b1ff6e16b229fc62385b6c971f28de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-November/041664.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 8 +++-----
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 79bfc5d98b..f2cea28ee3 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041644.html
-md5  562614e91c10c75ab1c2b71e5d27f076  libinput-1.16.3.tar.xz
-sha1  ee1e93ee647bdd4598a5910eb654592563657d66  libinput-1.16.3.tar.xz
-sha256  dc5e1ae51ec1cc635ca96f61118b0f07dfea783cab0747a60f3555068bb077e4  libinput-1.16.3.tar.xz
-sha512  cdf87988b24dc0a44b7b6ed3e15e70c7702bf65f1cfe257924967677c7a1f1485011a9e30254ba8962c83885de78f824e7955cedb07322676332d42532ec4a39  libinput-1.16.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041664.html
+sha256  65923a06d5a8970e4a999c4668797b9b689614b62b1d44432ab1c87b65e39e29  libinput-1.16.4.tar.xz
+sha512  a95a3bcf58a9298946d15f4f2fd93dc5807d3042f8797950a1ffd96d3c979b55a764f035a9f7680d0ea400b033698c322eb61a4387dbc280db6110ffd3e137ee  libinput-1.16.4.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index e5578a3921..3b459d6fb5 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.16.3
+LIBINPUT_VERSION = 1.16.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
