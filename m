From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:16:54 +0100
Subject: [Buildroot] [git commit] git packages: use full revision hash
Message-ID: <20131104211055.18FFB9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6ea6b78658b4c8bdf51c5bc45547065ae27f17b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no benefit in using the shortened git revision hash. On the
contrary: the shorter the hash, the higher the risk of having collisions
with another commit.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/a10disp/a10disp.mk                       |    2 +-
 package/cppzmq/cppzmq.mk                         |    2 +-
 package/czmq/czmq.mk                             |    2 +-
 package/filemq/filemq.mk                         |    2 +-
 package/jsmin/jsmin.mk                           |    2 +-
 package/knock/knock.mk                           |    2 +-
 package/libnfc/libnfc.mk                         |    2 +-
 package/linenoise/linenoise.mk                   |    2 +-
 package/lua-ev/lua-ev.mk                         |    2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/luaexpatutils/luaexpatutils.mk           |    2 +-
 package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
 package/ne10/ne10.mk                             |    2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
 package/on2-8170-modules/on2-8170-modules.mk     |    2 +-
 package/qextserialport/qextserialport.mk         |    2 +-
 package/qtuio/qtuio.mk                           |    2 +-
 package/rpi-firmware/rpi-firmware.mk             |    2 +-
 package/rpi-userland/rpi-userland.mk             |    2 +-
 package/socketcand/socketcand.mk                 |    2 +-
 package/sunxi-cedarx/sunxi-cedarx.mk             |    2 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk       |    2 +-
 package/sunxi-mali/sunxi-mali.mk                 |    2 +-
 package/ti-utils/ti-utils.mk                     |    2 +-
 package/tvheadend/tvheadend.mk                   |    2 +-
 package/zmqpp/zmqpp.mk                           |    2 +-
 package/zyre/zyre.mk                             |    2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index fee4ac7..486db44 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-A10DISP_VERSION = a899cc6dcf
+A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
 A10DISP_SITE = http://github.com/hglm/a10disp/tarball/$(A10DISP_VERSION)
 A10DISP_LICENSE = MIT
 
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 267a5d8..19c5944 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = b232978
+CPPZMQ_VERSION = b23297800389149ac37f19b7215fa4734d344998
 CPPZMQ_SITE = git://github.com/zeromq/cppzmq.git
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index c0f97ba..da68790 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = cb9839cf90
+CZMQ_VERSION = cb9839cf90e4ac69acb7c6ff2b4e2d42d704cf6e
 CZMQ_SITE = git://github.com/zeromq/czmq.git
 
 # Autoreconf required as we use the git tree
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index ace0ca4..6f55573 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 8fac5140dd
+FILEMQ_VERSION = 8fac5140ddbca3c4742016795fbbf1d6579902f3
 FILEMQ_SITE = git://github.com/zeromq/filemq.git
 
 FILEMQ_AUTORECONF = YES
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index d511911..2d18187 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSMIN_VERSION = a9b4755
+JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
 JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
 
 define JSMIN_BUILD_CMDS
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 8469b4f..5fcf414 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 7666f2e86e
+KNOCK_VERSION = 7666f2e86e18d482eaad5fe1fea46d87d80b0555
 KNOCK_SITE = https://github.com/jvinet/knock/tarball/master
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index 2530668..50bfcd5 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFC_VERSION = fda8d60ce062
+LIBNFC_VERSION = fda8d60ce062409bb32c76a229f02f7502948ce8
 LIBNFC_SITE = http://libnfc.googlecode.com/git/
 LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 14e0f09..a8ea1f6 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 27a3b4d5
+LINENOISE_VERSION = 27a3b4d5205a5fb3e2101128edd6653bd0c92189
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 2b03936..0beece4 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = 458165b
+LUA_EV_VERSION = 458165bdfe0c6eadc788813925f11a0e6a823845
 LUA_EV_SITE = http://github.com/brimworks/lua-ev/tarball/$(LUA_EV_VERSION)
 LUA_EV_DEPENDENCIES = lua libev
 LUA_EV_LICENSE = MIT
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 6ec923c..9065916 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MSGPACK_NATIVE_VERSION = 41cce91
+LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6b54e4426c6d626a0ac41a02ec2096d
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index 7ce7fc5..391031b 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPATUTILS_VERSION = 88c228365b
+LUAEXPATUTILS_VERSION = 88c228365b084224c911d34aff06002634b38b50
 LUAEXPATUTILS_SITE = http://github.com/stevedonovan/LuaExpatUtils/tarball/$(LUAEXPATUTILS_VERSION)
 LUAEXPATUTILS_LICENSE = Public Domain
 LUAEXPATUTILS_DEPENDENCIES = luaexpat
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index c78e373..ff56ee7 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV2TUIO_VERSION = e1e7378
+MTDEV2TUIO_VERSION = e1e7378d86abe751158e743586133022f32fa4d1
 MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/$(MTDEV2TUIO_VERSION)
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 9c78c45..bb5259f 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -6,7 +6,7 @@
 
 # We use a Git commit ID because the last tagged version is more than
 # one year old.
-NE10_VERSION = 88c18f0
+NE10_VERSION = 88c18f02199947b2c8b57796f5a3ca53160aff96
 NE10_SITE = http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
 NE10_LICENSE = BSD-3c or Apache 2.0
 NE10_LICENSE_FILES = doc/LICENSE
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 7039d07..8e03718 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMAP_U_BOOT_UTILS_VERSION = 8aff852
+OMAP_U_BOOT_UTILS_VERSION = 8aff852322c6f52bd09568bef7725ab509d81725
 OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/$(OMAP_U_BOOT_UTILS_VERSION)
 OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index 800abc7..d332885 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ON2_8170_MODULES_VERSION = 73b0806
+ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
 ON2_8170_MODULES_SITE    = http://github.com/alexandrebelloni/on2-8170-modules/tarball/$(ON2_8170_MODULES_VERSION)
 
 ON2_8170_MODULES_DEPENDENCIES = linux
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 373cd69..45dc9b8 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEXTSERIALPORT_VERSION     = 6c47244de4ce6db
+QEXTSERIALPORT_VERSION     = 6c47244de4ce6db43c2f05caee957666c951dae1
 QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
 QEXTSERIALPORT_SITE_METHOD = git
 
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index b2c9306..1133591 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QTUIO_VERSION = abe4973ff6
+QTUIO_VERSION = abe4973ff60654aad9df7037c4ca15c45f811d24
 QTUIO_SITE = git://github.com/x29a/qTUIO.git
 QTUIO_INSTALL_STAGING = YES
 QTUIO_DEPENDENCIES = qt
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ecd9dbf..a7574f2 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 58036da
+RPI_FIRMWARE_VERSION = 58036da500d936a98156d703fa220dc7db175762
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 8b5794f..9f20766 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 77d32cd
+RPI_USERLAND_VERSION = 77d32cd6b7d1c586877b0e05f941e647e35084bc
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 8e42698..1a19c92 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = dc3437ab
+SOCKETCAND_VERSION = dc3437abf17359fa8cb16567415b47e7ef8568d0
 SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/$(SOCKETCAND_VERSION)
 SOCKETCAND_AUTORECONF = YES
 
diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 07c85d4..5e1c820 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_CEDARX_VERSION = 74923e55fc
+SUNXI_CEDARX_VERSION = 74923e55fc3ef512d4cd2462da58ae5331611f37
 SUNXI_CEDARX_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CEDARX_VERSION)
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
index 21960e6..f04b0b0 100644
--- a/package/sunxi-mali-prop/sunxi-mali-prop.mk
+++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_PROP_VERSION = e4ced47
+SUNXI_MALI_PROP_VERSION = e4ced471d576708ac9aa093e41a0f91cf429862b
 SUNXI_MALI_PROP_SITE = http://github.com/linux-sunxi/sunxi-mali-proprietary/tarball/$(SUNXI_MALI_PROP_VERSION)
 
 $(eval $(generic-package))
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index 826583d..dec211f 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_VERSION = c2491fe952
+SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
 SUNXI_MALI_SITE = http://github.com/linux-sunxi/sunxi-mali/tarball/$(SUNXI_MALI_VERSION)
 
 SUNXI_MALI_INSTALL_STAGING = YES
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index a76fde1..8c720b2 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_UTILS_VERSION = 06dbdb2
+TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/$(TI_UTILS_VERSION)
 TI_UTILS_DEPENDENCIES = libnl
 
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5593791..7578dab 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 2b64995
+TVHEADEND_VERSION           = 2b649954346aa2e9c81834d500a25c528f31f829
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index ee0b9cb..83e088f 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 31220ca
+ZMQPP_VERSION = 31220ca4a0fb43a0848d78f5e4f23fce39945777
 ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index a9d2eae..3e28212 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 44a57a449a
+ZYRE_VERSION = 44a57a449a34bb6310b5ce4b17f1ce42f9b17beb
 ZYRE_SITE = git://github.com/zeromq/zyre.git
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
