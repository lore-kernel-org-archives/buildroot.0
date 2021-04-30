From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Apr 2021 22:55:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.0.1
In-Reply-To: <20210430205537.682528-1-bernd.kuhls@t-online.de>
References: <20210430205537.682528-1-bernd.kuhls@t-online.de>
Message-ID: <20210430205537.682528-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.x.org/archives/xorg-announce/2021-April/003083.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                        | 6 +++---
 .../xdriver_xf86-input-libinput.mk                          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index daeb8d593a..2c4dafc8c7 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003079.html
-sha256  ef55c2f66ae65da476c400205692ff77c9192bdc16fb3a285ea252267cf28a74  xf86-input-libinput-1.0.0.tar.bz2
-sha512  8135afcdfd1d1bc8196c42680b2f3b3089ee25509776c52db4bdab0afca74d6ca1689a14b5e30a24834293d0377689138bd3ea4b249c9310d5ec5777ff3ebeb8  xf86-input-libinput-1.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-April/003083.html
+sha256  fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b  xf86-input-libinput-1.0.1.tar.bz2
+sha512  bb3cc4e9507d5ff6e430aabb5c87e412e8bbc5fd18b85fa4826123cb6be2f8f41078863fda09304f9dbd1264bbf1c3c7d6c11700ede0a5db733fbd1a03ec915b  xf86-input-libinput-1.0.1.tar.bz2
 
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 4283f16b25..b949b54819 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.0.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.0.1
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.29.2
