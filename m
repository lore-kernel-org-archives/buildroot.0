From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:11:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.29.0
Message-ID: <20190930210853.3513B83E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a735a13dc57d65bcbac0e52cb2617cd193c23b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-input-libinput.hash                           | 10 +++++-----
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index dac68422fd..c33893efe7 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002938.html
-md5 b7548bc1d7e82d189205794ff86307af  xf86-input-libinput-0.28.2.tar.bz2
-sha1 e216e81f570a2261a1bc5a79c4782f019b5a3c36  xf86-input-libinput-0.28.2.tar.bz2
-sha256 b8b346962c6b62b8069928c29c0db83b6f544863bf2fc6830f324de841de2820  xf86-input-libinput-0.28.2.tar.bz2
-sha512 da6eb632180649853b3aa2fb88debd6aafe5ede24a5f4a04a21cf18fa97fd414d300b86cdf8a42027c98ac89f1b9f88034fc9e364ac3a02fa38872e57b542a84  xf86-input-libinput-0.28.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-August/003017.html
+md5 d600e8e2e30747b8ce49ec5294ff0ab6  xf86-input-libinput-0.29.0.tar.bz2
+sha1 efa9dbe08ee827949aff0bd752f8270237247c56  xf86-input-libinput-0.29.0.tar.bz2
+sha256 c28b56a21754b972db31798e6a4cf4dc9d69208d08f8fe41701a94def5e94bee  xf86-input-libinput-0.29.0.tar.bz2
+sha512 f19ef2e9e0c1336d8e0b17853e1fe0c66ecf50e7b10b10b6c5cbafc99323694597821e15e8e358419ef3c68d1009967fd2ec3760800c85adbb71ac3ecc99954b  xf86-input-libinput-0.29.0.tar.bz2
 # Locally computed
 sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 7643659e31..2208500556 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.2
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.29.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
