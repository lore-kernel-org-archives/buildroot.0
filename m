From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:22:57 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-keyboard:
	bump version to 1.8.1, add hash
Message-ID: <20150418162757.085A28079D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01961cd0f43769399901d3be19aea87adeb2c6b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-keyboard.hash               |    2 ++
 .../xdriver_xf86-input-keyboard.mk                 |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
new file mode 100644
index 0000000..11fcc60
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002559.html
+sha256	1ac8ff39bf9da7d2fc7fd6c24515726e8138340c0518ab8c606e008cf93ca211	xf86-input-keyboard-1.8.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 36d2c5e..209f44a 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.8.0
+XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.8.1
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
