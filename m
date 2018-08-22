From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 Aug 2018 02:06:46 +0200
Subject: [Buildroot] [PATCH v2 0/2] sunxi-mali-mainline*: add arm64 build
 support and
Message-ID: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blobs for arm64(aarch64) and r8p1 version are available at Bootlin Github.
r8p1 driver support has been added at mripard Github.

Add support on both sunxi-mali-mainline and sunxi-mali-mainline-driver
packages to:
- Build on arm64(aarch64).
- use r8p1 blob version.

Changes V1->V2:
- make sunxi-mali-mainline changes in one patch to be bi-sectable.
- make sunxi-mali-mainline-driver changes in one patch to be bi-sectable.

Giulio Benetti (2):
  sunxi-mali-mainline: add support for arm64(aarch64) architecture and
    r8p1 blob version.
  sunxi-mali-mainline-driver: bump version and add support for building
    on arm64(aarch64).

 .../sunxi-mali-mainline-driver.mk                 |  8 +++++++-
 package/sunxi-mali-mainline/Config.in             |  6 ++++--
 .../sunxi-mali-mainline/sunxi-mali-mainline.mk    | 15 ++++++++++-----
 3 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.17.1
