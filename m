From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:38:28 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.25.0
Message-ID: <20170412194117.1F3548275B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bb2482b7f69c797d3a4532ca791b641890ddfab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash    | 6 ++++--
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk      | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 0d35294..36d16c2 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2017-February/002776.html
-sha256 ddcb07350aed59b2996a92a1b4ff64d1c0b0c86a3f0ddca15b2b1c8c8bb13628  xf86-input-libinput-0.24.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-March/002782.html
+md5 bd64be831914eda924f7166243c34968  xf86-input-libinput-0.25.0.tar.bz2
+sha1 e43fd18bc32b892fb203f842186ad0d6c675b696  xf86-input-libinput-0.25.0.tar.bz2
+sha256 bb7fd1658fa7e6c757fd55480aa8a07f8ccfb0a80ae42c29dbc67d57958c556f  xf86-input-libinput-0.25.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index e293b4e..16ab7ce 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.24.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.25.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
