From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 12:47:37 +0200
Subject: [Buildroot] [PATCH 00/11] Round of external toolchain updates
Message-ID: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a round of external toolchain updates, mainly bumping the
versions of the various toolchains we have, and a few improvements to
the kernel headers version check.

Thanks,

Thomas

Thomas Petazzoni (11):
  toolchain-external: apply kernel headers check to non-custom
    toolchains
  toolchain-external: do not pass TOOLCHAIN_EXTERNAL_CFLAGS for kernel
    headers check
  toolchain-external: support only one Linaro ARM toolchain at a time
  toolchain-external: support only one Linaro AArch64 toolchain at a
    time
  toolchain-external: bump Linaro ARM to 2014.05
  toolchain-external: bump Linaro ARMeb toolchain to 2014.04
  toolchain-external: bump Linaro AArch64 toolchain to 2014.05
  toolchain-external: bump musl external toolchains to 1.1.1
  toolchain-external: add CodeSourcery MIPS 2014.05, remove 2012.09
  toolchain-external: add CodeSourcery PowerPC 2012.03
  toolchain-external: add ADI Blackfin 2014R1 toolchain, remove 2012R1

 toolchain/toolchain-external/Config.in             | 200 +++++++++------------
 toolchain/toolchain-external/toolchain-external.mk |  86 ++++-----
 2 files changed, 119 insertions(+), 167 deletions(-)

-- 
1.9.3
