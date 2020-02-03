From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  3 Feb 2020 21:50:49 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.15.1
Message-ID: <20200203205049.28519-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-February/041186.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ee006fe513..235025768b 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041115.html
-md5 d5fe153c4b1d69ec35dc846588cd47ec libinput-1.15.0.tar.xz
-sha1 93dd7636b65e8cfea3a3068da5415f29195a189d libinput-1.15.0.tar.xz
-sha256 bfbf1fef66bcb2be871a18783dfcfb88ecb431f496bf0a9cf6685fd29c5843e1 libinput-1.15.0.tar.xz
-sha512 5dab48e1b4c9c0deb5b01ebc3ccb4cc28d614be25d87daaf42f51fbd2d955266f3fdba73029bc0094caa55060dad8967751b72d8f45f19a40b542f0c9118c1b6 libinput-1.15.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041186.html
+md5 93850756b6c07aafb49d5226e88fdc81 libinput-1.15.1.tar.xz
+sha1 1b311c407c21210ad9d13b059e9eab4b85f19fb5 libinput-1.15.1.tar.xz
+sha256 6b2f57495c6f173ecf49ee19d3e10087d9916a52711e1b5eb01e0d9635950c16 libinput-1.15.1.tar.xz
+sha512 634810359bc4d86f2c4c75f472bee5eaed04ed93af3c91c4bc46a596402323941f9cc90173e278bfa7e5cbda6b7a20adc59bd09520dd4152fc961302b7e57904 libinput-1.15.1.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 03ae668f4e..ac7fbb3b2e 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.0
+LIBINPUT_VERSION = 1.15.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.25.0
