From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 26 Apr 2021 17:30:15 +0200
Subject: [Buildroot] [PATCH 0/4] imx: add i.MX 8M Plus Nitrogen support
Message-ID: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series adds support for our Nitrogen8MP platform based on the i.MX
8M Plus CPU.
This required to update the bootscripts to match that new architecture.
Also, this series bumps kernel/uboot to latest for all Nitrogen
platforms.

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (4):
  board/boundarydevices: update boot scripts
  configs/nitrogen*: update kernel to 5.4.x_2.3.0
  configs/nitrogen*: bump u-boot revision
  configs/nitrogen8mp: new defconfig

 board/boundarydevices/common/boot.cmd         | 65 +++++++++++--------
 board/boundarydevices/common/upgrade.cmd      | 25 ++++---
 configs/nitrogen6sx_defconfig                 |  6 +-
 configs/nitrogen6x_defconfig                  |  6 +-
 configs/nitrogen7_defconfig                   |  6 +-
 configs/nitrogen8m_defconfig                  | 10 +--
 configs/nitrogen8mm_defconfig                 | 10 +--
 configs/nitrogen8mn_defconfig                 | 10 +--
 ...gen8mn_defconfig => nitrogen8mp_defconfig} | 20 +++---
 9 files changed, 90 insertions(+), 68 deletions(-)
 copy configs/{nitrogen8mn_defconfig => nitrogen8mp_defconfig} (71%)

-- 
2.30.2
