From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 02 Nov 2013 14:22:16 +0100
Subject: [Buildroot] [PATCH 0 of 2 v2] Use full revision ID for git packages
Message-ID: <patchbomb.1383398536@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


As discussed recently, we should use full git commit IDs instead of
abbreviated ones. 

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: update documentation with comment from Samuel

 docs/manual/adding-packages-tips.txt             |  5 ++---
 package/a10disp/a10disp.mk                       |  2 +-
 package/cppzmq/cppzmq.mk                         |  2 +-
 package/czmq/czmq.mk                             |  2 +-
 package/filemq/filemq.mk                         |  2 +-
 package/jsmin/jsmin.mk                           |  2 +-
 package/knock/knock.mk                           |  2 +-
 package/libnfc/libnfc.mk                         |  2 +-
 package/linenoise/linenoise.mk                   |  2 +-
 package/lua-ev/lua-ev.mk                         |  2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk |  2 +-
 package/luaexpatutils/luaexpatutils.mk           |  2 +-
 package/mtdev2tuio/mtdev2tuio.mk                 |  2 +-
 package/ne10/ne10.mk                             |  2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk   |  2 +-
 package/on2-8170-modules/on2-8170-modules.mk     |  2 +-
 package/qextserialport/qextserialport.mk         |  2 +-
 package/qtuio/qtuio.mk                           |  2 +-
 package/rpi-firmware/rpi-firmware.mk             |  2 +-
 package/rpi-userland/rpi-userland.mk             |  2 +-
 package/socketcand/socketcand.mk                 |  2 +-
 package/sunxi-cedarx/sunxi-cedarx.mk             |  2 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk       |  2 +-
 package/sunxi-mali/sunxi-mali.mk                 |  2 +-
 package/ti-utils/ti-utils.mk                     |  2 +-
 package/tvheadend/tvheadend.mk                   |  2 +-
 package/zmqpp/zmqpp.mk                           |  2 +-
 package/zyre/zyre.mk                             |  2 +-
 28 files changed, 29 insertions(+), 30 deletions(-)
