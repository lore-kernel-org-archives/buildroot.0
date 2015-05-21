From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 09:40:54 +0200
Subject: [Buildroot] [PATCH/next 1/3]
	package/x11r7/xdriver_xf86-input-libinput: bump version to 0.10.0
Message-ID: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash |    6 +++---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 9b5219f..aa5ba72 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,3 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002586.html
-sha1	cfb19cc863bfc0a419df6b14287891ad54bc86a2				xf86-input-libinput-0.9.0.tar.bz2
-sha256	37f623b7869c700156049fa9204bafd6027bf5c3acd9017919e42199bcc666da	xf86-input-libinput-0.9.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-May/002608.html
+sha1	6d12bb1411ac91669f1d2e85e66312a475c34a59				xf86-input-libinput-0.10.0.tar.bz2
+sha256	a4270358ed643633822212a179ad862efcf5408735bfd31e8ec49e4cf1403bf0	xf86-input-libinput-0.10.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 28371a2..babbc3f 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.9.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.10.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
1.7.10.4
