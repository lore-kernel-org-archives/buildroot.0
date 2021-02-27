From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:17:14 +0100
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.16.5
Message-ID: <20210308072136.5507A8896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fd8baac1d716916eb27f80a66de6aff26c3be08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-February/041734.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f2cea28ee3..1664afbac8 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041664.html
-sha256  65923a06d5a8970e4a999c4668797b9b689614b62b1d44432ab1c87b65e39e29  libinput-1.16.4.tar.xz
-sha512  a95a3bcf58a9298946d15f4f2fd93dc5807d3042f8797950a1ffd96d3c979b55a764f035a9f7680d0ea400b033698c322eb61a4387dbc280db6110ffd3e137ee  libinput-1.16.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-February/041734.html
+sha256  42d404af037a0dcc9dee7a1ab0a8e53cec0b62902fc4a262e5be9d2b7452c214  libinput-1.16.5.tar.xz
+sha512  b2fdd87375cbd5b212f76cefedfaa146966dde1d5e5d566beadd3167749dc3667214946178b157fa4b44360dc6b86a25ffb0356049cdf5a57d0fa2b8e3fcb1e9  libinput-1.16.5.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3b459d6fb5..cbe4bb124f 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.16.4
+LIBINPUT_VERSION = 1.16.5
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
