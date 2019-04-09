From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Tue,  9 Apr 2019 21:14:56 +0530
Subject: [Buildroot] [V2 0/7] linux and uboot version bumps and cleanup
Message-ID: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:

V2:
- consildate uboot and linux version bump patches into one single
  patch per board config file
- Logically reorder all nanopi m1 plus patches  
- Remove BR2_GLOBAL_PATCH_DIR option from nanopi_m1_plus_defconfig

Shyam Saini (7):
  configs: pine64_sopine: Bump to the linux 5.0 and u-boot 2019.01
  configs: orangepi_prime: Bump to the linux 5.0 and u-boot 2019.01
  configs: olimex_a64_olinuxino: Bump to the linux 5.0 and u-boot
    2019.01
  configs: orangepi_plus: Bump to the linux 5.0 and u-boot 2019.01
  configs: nanopi_m1: Bump to the linux 5.0 and u-boot 2019.01
  configs: nanopi_m1_plus: Bump to the linux 5.0 and u-boot 2019.01
  board: friendlyarm: nanopi-m1-plus: patches: Remove linux patch

 ...ts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch | 103 ---------------------
 configs/nanopi_m1_defconfig                        |   8 +-
 configs/nanopi_m1_plus_defconfig                   |   9 +-
 configs/olimex_a64_olinuxino_defconfig             |   8 +-
 configs/orangepi_plus_defconfig                    |   8 +-
 configs/orangepi_prime_defconfig                   |   8 +-
 configs/pine64_sopine_defconfig                    |   8 +-
 7 files changed, 24 insertions(+), 128 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-m1-plus/patches/linux/0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch

-- 
2.11.0
