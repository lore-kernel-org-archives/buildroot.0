From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.28.2
Message-ID: <20190315203120.651E783480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce49512e4b517181e45322a2ffa91e7d433c8746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-input-libinput.hash                           | 10 +++++-----
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index c6f2577bd6..dac68422fd 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002923.html
-md5  9d2fb3d6b452d568a275908b856de0e2  xf86-input-libinput-0.28.1.tar.bz2
-sha1 f72f298c23fa993857ff1a9a06754f2f5962b376  xf86-input-libinput-0.28.1.tar.bz2
-sha256 9ada448e076c0078a84b48e5298fa8ce317565f9b342b74c20429214a707d98b  xf86-input-libinput-0.28.1.tar.bz2
-sha512 2b8cabfbc3490edbe928771ed9d62a0d4a423bc1373fc6cf9d3a6b5937e17ddc48ebb1b70f1191e507024e4b8220c137495cbba825292b51e50709daa7d31623  xf86-input-libinput-0.28.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002938.html
+md5 b7548bc1d7e82d189205794ff86307af  xf86-input-libinput-0.28.2.tar.bz2
+sha1 e216e81f570a2261a1bc5a79c4782f019b5a3c36  xf86-input-libinput-0.28.2.tar.bz2
+sha256 b8b346962c6b62b8069928c29c0db83b6f544863bf2fc6830f324de841de2820  xf86-input-libinput-0.28.2.tar.bz2
+sha512 da6eb632180649853b3aa2fb88debd6aafe5ede24a5f4a04a21cf18fa97fd414d300b86cdf8a42027c98ac89f1b9f88034fc9e364ac3a02fa38872e57b542a84  xf86-input-libinput-0.28.2.tar.bz2
 # Locally computed
 sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 83de5c9610..7643659e31 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.1
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.2
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
