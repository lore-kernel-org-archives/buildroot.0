From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 22:41:52 +0200
Subject: [Buildroot] [git commit] xf86-input-libinput: bump to version 0.18.0
Message-ID: <20160428204527.10AD981ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40dab2d18ed183f321f045aeb30f791a0023d321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index b2925db..6473e4c 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-December/002667.html
-sha256	fdade531e91e79acf6dce8ac55fa4f65abe3f1358c5d3d777ae48dbc74b76f49	xf86-input-libinput-0.16.0.tar.bz2
+# From https://lists.x.org/archives/xorg/2016-April/057997.html
+sha256	974cabbd6b658ce809b534f6410e2bbbc615f06210f9cc9e48e6d77149134a77	xf86-input-libinput-0.18.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 9e48886..056bfb0 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.16.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.18.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
