From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:31:10 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-input-keyboard: bump version to 1.9.0
Message-ID: <20161127213919.1FBED81908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d88afe4b2e504a895b199a0330d8f9fee95f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
index 11fcc60..eccfa74 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002559.html
-sha256	1ac8ff39bf9da7d2fc7fd6c24515726e8138340c0518ab8c606e008cf93ca211	xf86-input-keyboard-1.8.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002739.html
+sha256 f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388  xf86-input-keyboard-1.9.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index eb2d582..01a6859 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.8.1
+XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.9.0
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
