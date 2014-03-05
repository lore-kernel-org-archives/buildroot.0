From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Mar 2014 23:23:34 +0100
Subject: [Buildroot] [PATCH 0/6] External toolchain updates
Message-ID: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a round of updates to the external toolchains. It includes:

 * Usual updates to the Linaro ARM and AArch64 toolchains.

 * Additions of several Musl based external toolchains.

 * Addition of the new ARMeb Linaro toolchain.

Best regards,

Thomas

Thomas Petazzoni (6):
  toolchain-external: fix musl external support on x86
  toolchain-external: add publicly available musl toolchains
  toolchain-external: bump Linaro ARM toolchains
  toolchain-external: remove useless info in help text of Linaro ARM
    toolchains
  toolchain-external: bump Linaro AArch64 toolchains
  toolchain-external: add Linaro ARM big endian toolchain

 toolchain/toolchain-external/Config.in             | 229 ++++++++++++++++++---
 toolchain/toolchain-external/toolchain-external.mk |  80 +++++--
 2 files changed, 259 insertions(+), 50 deletions(-)

-- 
1.8.3.2
