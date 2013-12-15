From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Dec 2013 13:20:38 +0100
Subject: [Buildroot] [PATCH 0 of 2] Unification of comments about dependency
 on Linux kernel
Message-ID: <patchbomb.1387110038@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/boot-wrapper-aarch64/Config.in         |   4 ++++
 docs/manual/adding-packages-directory.txt   |  16 ++++++++++++++++
 fs/initramfs/Config.in                      |   2 +-
 fs/iso9660/Config.in                        |   2 +-
 package/a10disp/Config.in                   |   2 +-
 package/cryptodev/Config.in                 |   5 ++++-
 package/directfb/Config.in                  |   3 +++
 package/freescale-imx/imx-lib/Config.in     |   2 +-
 package/gstreamer/gst-fsl-plugins/Config.in |   2 +-
 package/igh-ethercat/Config.in              |   3 +++
 package/ktap/Config.in                      |   2 +-
 package/libfslvpuwrap/Config.in             |   2 +-
 package/linux-fusion/Config.in              |   3 +++
 package/lttng-modules/Config.in             |   2 +-
 package/on2-8170-libs/Config.in             |   2 +-
 package/on2-8170-modules/Config.in          |   4 ++--
 package/owl-linux/Config.in                 |   2 +-
 package/perf/Config.in                      |   2 +-
 package/ti-gfx/Config.in                    |   2 +-
 19 files changed, 47 insertions(+), 15 deletions(-)
