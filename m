From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 May 2019 22:13:48 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.2
Message-ID: <20190509201348.8437-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For detail see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-May/040548.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a8f9c10690..36a298031e 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-April/040403.html
-md5 869a7e68c4290d99868500a369645def libinput-1.13.1.tar.xz
-sha1 a0338e5f2ff2cecbb88f91e5bf363f9b66770be2 libinput-1.13.1.tar.xz
-sha256 e1d487d478ee2bb118890a64211c2b7f2348aaed7363b214bed4d642274841ab libinput-1.13.1.tar.xz
-sha512 a19deec802e704038df0901c103a82a3370f56e0299f4cc1b6aa84c1832a66fb638e6f9d0fa708b51df6c3b939cdc1271e4ff547c645c566be03dce0bc9ff7e0 libinput-1.13.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-May/040548.html
+md5 8b745894f5d1b2e883bfc686aebadcfe libinput-1.13.2.tar.xz
+sha1 7e9d1bb3f5d4f8809c829753791141416a67ab1f libinput-1.13.2.tar.xz
+sha256 1d9fa0698348dea46f75321d98788f8ac7181c069b70c4d10736910a12bb6a6d libinput-1.13.2.tar.xz
+sha512 26f11c5274c26acc38b9b5729195010c0799a9563f1eb0e0cd67e323f8ed73b0fc8db8584ec8fdf1b726417f64c2daeb54832167079832626c8c1190fccf459f libinput-1.13.2.tar.xz

 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f497b1b677..26acb74600 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBINPUT_VERSION = 1.13.1
+LIBINPUT_VERSION = 1.13.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
--
2.21.0
