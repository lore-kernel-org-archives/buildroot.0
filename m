From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:16 +0100
Subject: [Buildroot] [PATCH 12/91] xdriver_xf86-input-keyboard: Bump version
	to 1.8.0
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP438E5F238C367158E82F483D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index f93652c..36d2c5e 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.6.1
+XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.8.0
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
-- 
1.7.10.4
