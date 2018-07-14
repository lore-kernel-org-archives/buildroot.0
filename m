From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jul 2018 10:28:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.28.0
Message-ID: <20180714082835.12177-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                   | 10 +++++-----
 .../xdriver_xf86-input-libinput.mk                     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 1c260d0b43..cb41765f4f 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-April/002889.html
-md5 bdad198a7a9f2ce2c1f90d5e6760462b  xf86-input-libinput-0.27.1.tar.bz2
-sha1 70ba045975b6484f16d11b32fbbb7e7194d2e0fd  xf86-input-libinput-0.27.1.tar.bz2
-sha256 d4ad8dc5ad6f962a3f15f61ba9e9f8e37fa0b57eee9f484e2bd721d60ca72ee6  xf86-input-libinput-0.27.1.tar.bz2
-sha512 01379f5d71bf39214c4dff428173512df57fd12e782f3fcde757be923aa0dbf4e010a0395a81bd8e4fb518edc7e05ca1ee64b1e313eb4df5d4990315580609a1  xf86-input-libinput-0.27.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-July/002908.html
+md5 2d7519ac0e39d4c88f3be32e81a637aa  xf86-input-libinput-0.28.0.tar.bz2
+sha1 07f5559bcf0363d4ecaf0b2cecb88ee7d2b16fc6  xf86-input-libinput-0.28.0.tar.bz2
+sha256 21994d065fc26e85d1c3fc87d8479b9c22699ed5a0119df98fbe0000e84630a1  xf86-input-libinput-0.28.0.tar.bz2
+sha512 4276b6aea87ddc83fa1f5e8d8949e34ad117186a6b5b599549231cb90424cd0fa69f3a4701ce529739c676665bb5c936eb447817c9420511d23bc048f6be92a4  xf86-input-libinput-0.28.0.tar.bz2
 # Locally computed
 sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 8642806c8b..b427d154cb 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.27.1
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.18.0
