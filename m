From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:27:26 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.24.0
Message-ID: <20170209212731.560FC8213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=299419d66be92fa6178292466c24f148bd28a22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index abc0664..0d35294 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002749.html
-sha256 0b53ebdfe8f8fc7554dd92af1b1c3088a6d3ec4ae1a33fc76f57d635c736a9dc  xf86-input-libinput-0.23.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-February/002776.html
+sha256 ddcb07350aed59b2996a92a1b4ff64d1c0b0c86a3f0ddca15b2b1c8c8bb13628  xf86-input-libinput-0.24.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 696a857..e293b4e 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.23.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.24.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
