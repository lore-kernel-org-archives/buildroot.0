From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 21:17:44 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.0.0
Message-ID: <20210409185753.1E36682B82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cff9e4bab088f5c8bd22ee809c355edac7269a73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-April/003079.html

Updated license hash due to upstream commit:
https://cgit.freedesktop.org/xorg/driver/xf86-input-libinput/commit/?id=2bbc4727a12471e3699e2803404a013656066a94

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-libinput.hash                          | 11 +++++------
 .../xdriver_xf86-input-libinput.mk                            |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 51f0ce7856..daeb8d593a 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-May/003045.html
-md5  11dcfa2cc39f790731a9545fcdeea717  xf86-input-libinput-0.30.0.tar.bz2
-sha1  b705d0280b4fa7ccf44b9ff3869f5d7846e26414  xf86-input-libinput-0.30.0.tar.bz2
-sha256  f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0  xf86-input-libinput-0.30.0.tar.bz2
-sha512  823f80f7d53866f2f06c1fb7b2d64111bf807329acaaeda4a09413cdb5f3e3235c1dd4f99183aae75adf5a01503e40e35b4449b31f977afd842b4723b062c380  xf86-input-libinput-0.30.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-April/003079.html
+sha256  ef55c2f66ae65da476c400205692ff77c9192bdc16fb3a285ea252267cf28a74  xf86-input-libinput-1.0.0.tar.bz2
+sha512  8135afcdfd1d1bc8196c42680b2f3b3089ee25509776c52db4bdab0afca74d6ca1689a14b5e30a24834293d0377689138bd3ea4b249c9310d5ec5777ff3ebeb8  xf86-input-libinput-1.0.0.tar.bz2
+
 # Locally computed
-sha256  b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
+sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 64d972cf33..4283f16b25 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.30.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.0.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
