From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:19:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-evdev:
 bump version to 2.10.6
Message-ID: <20190929181939.27012-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-evdev.hash                        | 9 +++++++--
 .../xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index bf9a2cd256..eb4cb6599c 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002767.html
-sha256 9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d  xf86-input-evdev-2.10.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002898.html
+md5 e8bd1edc6751f92e425cae7eba3c61eb  xf86-input-evdev-2.10.6.tar.bz2
+sha1 660de292d5a40e2b8f385965c6a4e149c981ba59  xf86-input-evdev-2.10.6.tar.bz2
+sha256 8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0  xf86-input-evdev-2.10.6.tar.bz2
+sha512 560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1  xf86-input-evdev-2.10.6.tar.bz2
+# Locally computed
+sha256 f6b9b4732932434cad03b29cb3151d20edcf7d6e5681f40ee3c47f03dbd92dc9  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index ded7fa77f1..28923cb2a1 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.5
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.6
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
-- 
2.20.1
