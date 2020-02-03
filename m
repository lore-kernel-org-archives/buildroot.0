From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:36 +0100
Subject: [Buildroot] [git commit] package/u*: add license file hashes
Message-ID: <20200203133730.8195E8881A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79631068e6c1d863f7f56e50d36af05290d877d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ubus/ubus.hash                     | 1 +
 package/uccp420wlan/uccp420wlan.hash       | 4 +++-
 package/ucl/ucl.hash                       | 3 ++-
 package/udpcast/udpcast.hash               | 3 ++-
 package/udpxy/udpxy.hash                   | 3 ++-
 package/uhttpd/uhttpd.hash                 | 3 ++-
 package/unionfs/unionfs.hash               | 5 +++--
 package/unzip/unzip.hash                   | 1 +
 package/upx/upx.hash                       | 1 +
 package/usbmount/usbmount.hash             | 4 +++-
 package/ushare/ushare.hash                 | 3 ++-
 package/ux500-firmware/ux500-firmware.hash | 3 ++-
 12 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 08297348e0..bda58bc30c 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  93ef2612853641ca8d16d07527115c72ed03f8eaa1c727a01b069a4e814247c0  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692.tar.gz
+sha256  f53187f011575f6ec6c529136fd4658d67e674227c80b7b72c99b3654454ae7f  ubusd_acl.h
diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
index 90f4948ac9..905fa4299d 100644
--- a/package/uccp420wlan/uccp420wlan.hash
+++ b/package/uccp420wlan/uccp420wlan.hash
@@ -1,2 +1,4 @@
 # locally computed hash
-sha256 1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb uccp420wlan-6.9.1.tar.gz
+sha256  1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb  uccp420wlan-6.9.1.tar.gz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
+sha256  9ac431585fddfe624b08cf7464876a5e96061047ff26a9e926da3d89d21a2a73  firmware/LICENSE.imagination
diff --git a/package/ucl/ucl.hash b/package/ucl/ucl.hash
index 6b1f41ed10..0252f69297 100644
--- a/package/ucl/ucl.hash
+++ b/package/ucl/ucl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348	ucl-1.03.tar.gz
+sha256  b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348  ucl-1.03.tar.gz
+sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index 133e1db80b..a70aa71981 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 ce9090ef80b6035a744a9b5ac335e61c99baa92c39ff53277266fbfcb836445a udpcast-20120424.tar.gz
+sha256  ce9090ef80b6035a744a9b5ac335e61c99baa92c39ff53277266fbfcb836445a  udpcast-20120424.tar.gz
+sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpxy/udpxy.hash b/package/udpxy/udpxy.hash
index 4042a41dd6..8455fcdb1a 100644
--- a/package/udpxy/udpxy.hash
+++ b/package/udpxy/udpxy.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd    udpxy.1.0.23-9-prod.tar.gz
+sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd  udpxy.1.0.23-9-prod.tar.gz
+sha256  60ead3913246c7cd930fe653c0053aba1af2cd9f82b266befdbbd6e0b8ecb750  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 7e09f18087..e8bdb0bb6b 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
+sha256  9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
+sha256  2a61a8a690e7646a4bfe4261bf77c49f47588db5fc234b3cc66809dcc0cb3985  uhttpd.h
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index fcc1d58d6e..f4310b023d 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256	f24d7dd64c678cefacbebf2727b61e3127b8ecb6bb9176d7117dd31503455643	unionfs-2.0.tar.gz
-sha256	976ca25b7706911f1a6e981c0fd236b607f497aa0b23d407825b0aad41f7c896	0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
+sha256  f24d7dd64c678cefacbebf2727b61e3127b8ecb6bb9176d7117dd31503455643  unionfs-2.0.tar.gz
+sha256  976ca25b7706911f1a6e981c0fd236b607f497aa0b23d407825b0aad41f7c896  0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
+sha256  f56a5579d670e18e0667700bc599acbc0b8217ca1f76b2adb3dad7d2953c4049  LICENSE
diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index a10778a468..d05957d5e2 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,5 +1,6 @@
 # Locally computed:
 sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
+sha256 7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b LICENSE
 sha256 66a364d75cea29363768ca6d43dd11b9913a59e42b8da16c4f63516c3e4ce7c1 07-increase-size-of-cfactorstr.patch
 sha256 3a8cfd2702d220c6c119eaf805b018b66460284e585e92adc8a572d190471724 08-allow-greater-hostver-values.patch
 sha256 0a1b23118b2f4a3ed097348ab33050d4f79b3863ab30e6d64ac382589834e3de 09-cve-2014-8139-crc-overflow.patch
diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index bfcf9326f9..cc7fb66c97 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  527ce757429841f51675352b1f9f6fc8ad97b18002080d7bf8672c466d8c6a3c  upx-3.91-src.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbmount/usbmount.hash b/package/usbmount/usbmount.hash
index 4a5c7f202d..6465461611 100644
--- a/package/usbmount/usbmount.hash
+++ b/package/usbmount/usbmount.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/u/usbmount/usbmount_0.0.22.dsc
-sha256	a2b8581534b6c92f0376d202639dbc28862d3834dac64c35bde752f84975527d	usbmount_0.0.22.tar.gz
+sha256  a2b8581534b6c92f0376d202639dbc28862d3834dac64c35bde752f84975527d  usbmount_0.0.22.tar.gz
+# Locally computed
+sha256  797a416c87923338aa3ed05cce3cfdac6101f0142e72d5ab05c7bd76af5e527b  debian/copyright
diff --git a/package/ushare/ushare.hash b/package/ushare/ushare.hash
index 77f0f0f85d..03c675f094 100644
--- a/package/ushare/ushare.hash
+++ b/package/ushare/ushare.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 7b9b85c79968d4f4560f02a99e33c6a33ff58f9d41d8faea79e31cce2ee78665 ushare-1.1a.tar.bz2
+sha256  7b9b85c79968d4f4560f02a99e33c6a33ff58f9d41d8faea79e31cce2ee78665  ushare-1.1a.tar.bz2
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ux500-firmware/ux500-firmware.hash b/package/ux500-firmware/ux500-firmware.hash
index 1028cc0e12..b77ed20473 100644
--- a/package/ux500-firmware/ux500-firmware.hash
+++ b/package/ux500-firmware/ux500-firmware.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 81633274a9157c076e5e09b5addd81fbcef504b829fc801041cea50eea774bcd ux500-firmware_1.1.3-6linaro1.tar.gz
+sha256  81633274a9157c076e5e09b5addd81fbcef504b829fc801041cea50eea774bcd  ux500-firmware_1.1.3-6linaro1.tar.gz
+sha256  b5bbc3fb3ff2f8e165b3bf60b25702d8970b3d7fe88b1c883f20615d550a7cb2  license.txt
