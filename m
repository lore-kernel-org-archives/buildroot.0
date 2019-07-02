From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Jul 2019 19:07:59 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.4
Message-ID: <20190702170759.11275-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-June/040675.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 71542fb347..ea9319d663 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040650.html
-md5 0205d720ae0b1caef1faeb4bba7f8c0f libinput-1.13.3.tar.xz
-sha1 ea80070c087363415a4259ddc4bf828e18205195 libinput-1.13.3.tar.xz
-sha256 f3ff113023a28631d83971c059c1f3057d51a90aa3746428776f3b3462131092 libinput-1.13.3.tar.xz
-sha512 427ec838975444571770e129ef78fd42e4438a11e89ed0b3fc98793184d00c0ca8ed282eab2045cc6cb345804ad6fce1061af563b4f41d75405cdf2f09cb01e1 libinput-1.13.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040675.html
+md5 9ef817774bb5b4006cba95e34103e82c libinput-1.13.4.tar.xz
+sha1 14d7a14643d41c2e7512a7b3a6c0c9a3e7ba3242 libinput-1.13.4.tar.xz
+sha256 d3eb57c714683b117aae29f6c0be76dd46de259f0a48f20cb43b9fa9f2e1401d libinput-1.13.4.tar.xz
+sha512 ccfdfc704dab9ea19a503399ecd4ce3a95b8d9480b8dfddeb80be01236c34c6f2f472be0e12e04dddd68092611470d303351e092141bc7491729639bcf7e64d7 libinput-1.13.4.tar.xz

 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 6761173a1c..4706e8ebfa 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBINPUT_VERSION = 1.13.3
+LIBINPUT_VERSION = 1.13.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
--
2.22.0
