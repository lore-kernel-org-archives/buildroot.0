From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:24:24 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.23.0
Message-ID: <20161218132435.EC48880DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a79331f7da443ca725a65fcbe4a6b779904dbbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 6edc391..abc0664 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002732.html
-sha256 c762b4072ed448e2ae9f35cebd7fec8df7fd42b3ae61462cc3b2f720a873eae2  xf86-input-libinput-0.22.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002749.html
+sha256 0b53ebdfe8f8fc7554dd92af1b1c3088a6d3ec4ae1a33fc76f57d635c736a9dc  xf86-input-libinput-0.23.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 517e5d2..696a857 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.22.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.23.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
