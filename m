From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.14.0
Message-ID: <20190903133617.7F4AF8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f8468c59e3be772bb9fb8052560a6cef5fe6f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-August/040790.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ea9319d663..a54e72f438 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040675.html
-md5 9ef817774bb5b4006cba95e34103e82c libinput-1.13.4.tar.xz
-sha1 14d7a14643d41c2e7512a7b3a6c0c9a3e7ba3242 libinput-1.13.4.tar.xz
-sha256 d3eb57c714683b117aae29f6c0be76dd46de259f0a48f20cb43b9fa9f2e1401d libinput-1.13.4.tar.xz
-sha512 ccfdfc704dab9ea19a503399ecd4ce3a95b8d9480b8dfddeb80be01236c34c6f2f472be0e12e04dddd68092611470d303351e092141bc7491729639bcf7e64d7 libinput-1.13.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-August/040790.html
+md5 1c33d49fc7985926eab877e3de9c17eb libinput-1.14.0.tar.xz
+sha1 3a8f1ea7ba8a23868b2a7d48286924547ba6d108 libinput-1.14.0.tar.xz
+sha256 7cb85c24f8920b81bc5360220107e267ab4e0e718704c7690a8c7b03fa14fc67 libinput-1.14.0.tar.xz
+sha512 e501c5b8a58bb287c175692af0e59ff766a8613eb576aaa0700686dfbb6c6ab63b7a5d3f148fce75397c8170bc49871068861d93c352355ab5d0d9e7f1b059ec libinput-1.14.0.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 4706e8ebfa..d75b042f14 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.13.4
+LIBINPUT_VERSION = 1.14.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
