From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 11 Apr 2017 17:42:52 +0300
Subject: [Buildroot] [PATCH 0/2] update axs10x defconfigs
Message-ID: <1491921774-14748-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this patch series we bump Linux kernel to v4.10.8 and U-Boot
to v2017.01.

Also it contatins a couple of U-Boot patches for axs103 that introduce
important updates for new axs103 hardware version. 

Vlad Zakharov (2):
  config: update linux and u-boot in axs10x defconfigs
  arc: u-boot: Support slave core kick-start on axs103 v1.1

 ...ake-sure-busy-bit-is-set-properly-on-SLC-.patch | 41 ++++++++++++
 .../0001-axs103-Clean-up-smp_kick_all_cpus.patch   | 48 +++++++++++++++
 ...ort-slave-core-kick-start-on-axs103-v1.1-.patch | 72 ++++++++++++++++++++++
 ...s101_defconfig => snps_arc700_axs101_defconfig} |  9 +--
 ...103_defconfig => snps_archs38_axs103_defconfig} | 10 +--
 5 files changed, 172 insertions(+), 8 deletions(-)
 create mode 100644 board/synopsys/axs10x/patches/linux/0001-ARCv2-SLC-Make-sure-busy-bit-is-set-properly-on-SLC-.patch
 create mode 100644 board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
 create mode 100644 board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch
 rename configs/{snps_axs101_defconfig => snps_arc700_axs101_defconfig} (68%)
 rename configs/{snps_axs103_defconfig => snps_archs38_axs103_defconfig} (64%)

-- 
2.7.4
