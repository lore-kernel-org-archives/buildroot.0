From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  6 Nov 2020 19:26:58 +0100
Subject: [Buildroot] [PATCH 0/3] configs: select missing Python 3.x
 dependency for U-Boot
Message-ID: <20201106182701.17410-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes 3 board configs, which fail to build due to missing Python
3.x.

Marcin Niestroj (3):
  configs/orangepi_zero_plus: use Python 3.x
  configs/orangepi_pc: use Python 3.x
  configs/rock_pi_n8: use Python 3.x

 configs/orangepi_pc_defconfig        | 1 +
 configs/orangepi_zero_plus_defconfig | 1 +
 configs/rock_pi_n8_defconfig         | 1 +
 3 files changed, 3 insertions(+)

-- 
2.11.0
