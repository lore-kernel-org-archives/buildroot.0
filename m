From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Jun 2020 20:02:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.30.0
Message-ID: <20200615180212.971202-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                 | 12 ++++++------
 .../xdriver_xf86-input-libinput.mk                   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index c33893efe7..51f0ce7856 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003017.html
-md5 d600e8e2e30747b8ce49ec5294ff0ab6  xf86-input-libinput-0.29.0.tar.bz2
-sha1 efa9dbe08ee827949aff0bd752f8270237247c56  xf86-input-libinput-0.29.0.tar.bz2
-sha256 c28b56a21754b972db31798e6a4cf4dc9d69208d08f8fe41701a94def5e94bee  xf86-input-libinput-0.29.0.tar.bz2
-sha512 f19ef2e9e0c1336d8e0b17853e1fe0c66ecf50e7b10b10b6c5cbafc99323694597821e15e8e358419ef3c68d1009967fd2ec3760800c85adbb71ac3ecc99954b  xf86-input-libinput-0.29.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-May/003045.html
+md5  11dcfa2cc39f790731a9545fcdeea717  xf86-input-libinput-0.30.0.tar.bz2
+sha1  b705d0280b4fa7ccf44b9ff3869f5d7846e26414  xf86-input-libinput-0.30.0.tar.bz2
+sha256  f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0  xf86-input-libinput-0.30.0.tar.bz2
+sha512  823f80f7d53866f2f06c1fb7b2d64111bf807329acaaeda4a09413cdb5f3e3235c1dd4f99183aae75adf5a01503e40e35b4449b31f977afd842b4723b062c380  xf86-input-libinput-0.30.0.tar.bz2
 # Locally computed
-sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
+sha256  b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 2208500556..64d972cf33 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.29.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.30.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.26.2
