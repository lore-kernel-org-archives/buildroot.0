From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:16:37 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.14.2
Message-ID: <20191021191049.1B7D5837E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=764c96f61e99d0cef98636263c65bdcf30b2990b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040936.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a54e72f438..97a36978a7 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-August/040790.html
-md5 1c33d49fc7985926eab877e3de9c17eb libinput-1.14.0.tar.xz
-sha1 3a8f1ea7ba8a23868b2a7d48286924547ba6d108 libinput-1.14.0.tar.xz
-sha256 7cb85c24f8920b81bc5360220107e267ab4e0e718704c7690a8c7b03fa14fc67 libinput-1.14.0.tar.xz
-sha512 e501c5b8a58bb287c175692af0e59ff766a8613eb576aaa0700686dfbb6c6ab63b7a5d3f148fce75397c8170bc49871068861d93c352355ab5d0d9e7f1b059ec libinput-1.14.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-October/040936.html
+md5 c282990973140e3fa2dd274c69ab3a57 libinput-1.14.2.tar.xz
+sha1 fe3d33ec7d180df43987b23212d4bf1f69690580 libinput-1.14.2.tar.xz
+sha256 6b094669141f26c4df0d62147bbd0f76df1044333e19e6f6dc9413217c51a2c6 libinput-1.14.2.tar.xz
+sha512 932949a78bf95a7a05f50170cfc7dc109c99e1e3e70e63797566c0c3a3003632cad56e9b9ca2a180880f5e2ec1060613066d068b384096f37785fe70ac30c1eb libinput-1.14.2.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index d75b042f14..21afc04122 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.14.0
+LIBINPUT_VERSION = 1.14.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
