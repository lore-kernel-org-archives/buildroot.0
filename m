From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 16:16:23 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.27.1
Message-ID: <20180411141625.1ADF288410@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59a0d86bf8a7bbded80d6233ac7a1d29439e51d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-input-libinput.hash                           | 10 +++++-----
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 0c24f82880..1c260d0b43 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002885.html
-md5 efc5ea72070411ef077a9dd096cfd41b  xf86-input-libinput-0.27.0.tar.bz2
-sha1 127dba35576296d1800b7a29344c13da90141d4c  xf86-input-libinput-0.27.0.tar.bz2
-sha256 77b0516cb0bff616f491faed7f7794fef9dc496edc2dc7d6197324727cc668a3  xf86-input-libinput-0.27.0.tar.bz2
-sha512 716a9b43438acd6b7c6a834a08ecec244fecdc31e77241998414bf1748781026cd6c6e85947155c44400e0192769a714dfbfa0ed42ba3677347cd89ac1081743  xf86-input-libinput-0.27.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-April/002889.html
+md5 bdad198a7a9f2ce2c1f90d5e6760462b  xf86-input-libinput-0.27.1.tar.bz2
+sha1 70ba045975b6484f16d11b32fbbb7e7194d2e0fd  xf86-input-libinput-0.27.1.tar.bz2
+sha256 d4ad8dc5ad6f962a3f15f61ba9e9f8e37fa0b57eee9f484e2bd721d60ca72ee6  xf86-input-libinput-0.27.1.tar.bz2
+sha512 01379f5d71bf39214c4dff428173512df57fd12e782f3fcde757be923aa0dbf4e010a0395a81bd8e4fb518edc7e05ca1ee64b1e313eb4df5d4990315580609a1  xf86-input-libinput-0.27.1.tar.bz2
 # Locally computed
 sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index cf195ffa10..1723b3fcf8 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.27.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.27.1
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
