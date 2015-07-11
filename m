From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jul 2015 17:49:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.11.0
Message-ID: <1436629800-15097-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash  |    5 ++---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk    |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 9b5219f..05e119e 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,3 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002586.html
-sha1	cfb19cc863bfc0a419df6b14287891ad54bc86a2				xf86-input-libinput-0.9.0.tar.bz2
-sha256	37f623b7869c700156049fa9204bafd6027bf5c3acd9017919e42199bcc666da	xf86-input-libinput-0.9.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-June/002610.html
+sha256	56babf46c13d15fbd15c9d43815e9220e63acd9ed28095e7d68ad03f9148bbda	xf86-input-libinput-0.11.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 28371a2..722e700 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.9.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.11.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
1.7.10.4
