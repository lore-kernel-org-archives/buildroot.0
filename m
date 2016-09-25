From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:12:53 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.19.1
Message-ID: <20160925211322.14EFA80125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae567c4f53b164e1d3eae88cbcf6100ac7322116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index df3794f..24f9866 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-April/002687.html
-sha256	6c5d30dc7c8b8ae34261340e1dc9cbb8ef435078e084b8ef507527a8a21af477	xf86-input-libinput-0.19.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-September/002705.html
+sha256 c7f1c9406f4af2dc28b6ed3c7cb9fe9d79e9a548c0bba823fbaba20795cd010d  xf86-input-libinput-0.19.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index d49f4d1..2a5ad78 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.19.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.19.1
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
