From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 10 Jan 2021 17:16:25 +0300
Subject: [Buildroot] [PATCH 0/4] Misc fixes after mv-ddr-marvell update
Message-ID: <20210110141629.1510597-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch series includes several fixes and updates related to mv-ddr-marvell
package update. Major changes include fixes and updates for MacchiatoBin board
BSP as well as updates for ATF unit tests. MacchiatoBin board config has been
updated to use upstream ATF instead of Marvell ATF. TestATFMarvell unit test
has been removed since there are no other Marvell ATF users in Buildroot.

Sergey Matyukevich (4):
  configs/solidrun_macchiatobin: bump BSP components
  support/testing: remove TestATFMarvell
  support/testing: fix TestATFAllwinner test
  DEVELOPERS: remove S. Matyukevich from mcbin BSP components

 DEVELOPERS                              |  4 ----
 configs/solidrun_macchiatobin_defconfig | 13 +++++------
 support/testing/tests/boot/test_atf.py  | 30 ++-----------------------
 3 files changed, 8 insertions(+), 39 deletions(-)

-- 
2.30.0
