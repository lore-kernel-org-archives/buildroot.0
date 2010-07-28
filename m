From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 12:10:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	gcc-remove-options
Message-ID: <cover.1280311803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d47c73ee9ba3ab9a5f6a113047e3a4aae1afd278:
  Paul Jones (1):
        zlib: Bump to 1.2.5

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot gcc-remove-options

Thomas Petazzoni (2):
      gcc: remove option on SJLJ exceptions
      toolchain: remove multilib

 configs/arm_toolchain_defconfig      |    2 --
 configs/at91rm9200df_defconfig       |    2 --
 configs/at91sam9260dfc_defconfig     |    2 --
 configs/at91sam9260pf_defconfig      |    2 --
 configs/at91sam9261ek_defconfig      |    2 --
 configs/at91sam9263ek_defconfig      |    2 --
 configs/at91sam9g20dfc_defconfig     |    2 --
 configs/atngw100-base_defconfig      |    2 --
 configs/atngw100_defconfig           |    2 --
 configs/atstk1005_defconfig          |    2 --
 configs/atstk100x_defconfig          |    2 --
 configs/i386_defconfig               |    2 --
 configs/i686_defconfig               |    2 --
 configs/integrator926_defconfig      |    2 --
 configs/integrator926_huge_defconfig |    2 --
 configs/kb9202_defconfig             |    2 --
 configs/v100sc2_defconfig            |    2 --
 toolchain/Config.in.2                |    5 -----
 toolchain/Makefile.in                |    6 ------
 toolchain/binutils/binutils.mk       |    2 --
 toolchain/gcc/Config.in              |    8 --------
 toolchain/gcc/Makefile.in            |    4 ----
 toolchain/gcc/gcc-uclibc-4.x.mk      |    7 +------
 23 files changed, 1 insertions(+), 65 deletions(-)

Thanks,
-- 
Thomas Petazzoni
