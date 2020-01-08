From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:31:08 +0100
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.15.0
Message-ID: <20200108082121.0CF7383C1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=432942e45be2f995f19de4b5ab1958facad5d7fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-January/041115.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 8c6d0396a8..ee006fe513 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-October/040967.html
-md5 d052faa64eb6d2e649e582cc0fcf6e32 libinput-1.14.3.tar.xz
-sha1 af23a4359202c24b592033f54347719a8f44d872 libinput-1.14.3.tar.xz
-sha256 0feb3a0589709cc1032893bfaf4c49150d5360bd9782bec888f9e4dd9044c5b7 libinput-1.14.3.tar.xz
-sha512 f01d1bd1b25b8060519575644597d35f0c89de5386d298441f440128ceee3e57549921a058adec31adc8b33dbdedf4c0bd12c76905a69f752859d3136e26336d libinput-1.14.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041115.html
+md5 d5fe153c4b1d69ec35dc846588cd47ec libinput-1.15.0.tar.xz
+sha1 93dd7636b65e8cfea3a3068da5415f29195a189d libinput-1.15.0.tar.xz
+sha256 bfbf1fef66bcb2be871a18783dfcfb88ecb431f496bf0a9cf6685fd29c5843e1 libinput-1.15.0.tar.xz
+sha512 5dab48e1b4c9c0deb5b01ebc3ccb4cc28d614be25d87daaf42f51fbd2d955266f3fdba73029bc0094caa55060dad8967751b72d8f45f19a40b542f0c9118c1b6 libinput-1.15.0.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index e6e190bc47..03ae668f4e 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.14.3
+LIBINPUT_VERSION = 1.15.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
