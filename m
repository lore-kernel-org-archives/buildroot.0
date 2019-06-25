From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Jun 2019 22:20:27 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.3
Message-ID: <20190625202027.25556-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-June/040650.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 36a298031e..71542fb347 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-May/040548.html
-md5 8b745894f5d1b2e883bfc686aebadcfe libinput-1.13.2.tar.xz
-sha1 7e9d1bb3f5d4f8809c829753791141416a67ab1f libinput-1.13.2.tar.xz
-sha256 1d9fa0698348dea46f75321d98788f8ac7181c069b70c4d10736910a12bb6a6d libinput-1.13.2.tar.xz
-sha512 26f11c5274c26acc38b9b5729195010c0799a9563f1eb0e0cd67e323f8ed73b0fc8db8584ec8fdf1b726417f64c2daeb54832167079832626c8c1190fccf459f libinput-1.13.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040650.html
+md5 0205d720ae0b1caef1faeb4bba7f8c0f libinput-1.13.3.tar.xz
+sha1 ea80070c087363415a4259ddc4bf828e18205195 libinput-1.13.3.tar.xz
+sha256 f3ff113023a28631d83971c059c1f3057d51a90aa3746428776f3b3462131092 libinput-1.13.3.tar.xz
+sha512 427ec838975444571770e129ef78fd42e4438a11e89ed0b3fc98793184d00c0ca8ed282eab2045cc6cb345804ad6fce1061af563b4f41d75405cdf2f09cb01e1 libinput-1.13.3.tar.xz

 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 26acb74600..6761173a1c 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBINPUT_VERSION = 1.13.2
+LIBINPUT_VERSION = 1.13.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
--
2.21.0
