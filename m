From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 12:32:16 +0100
Subject: [Buildroot] [PATCH 0/6] Various external toolchain updates
Message-ID: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a round of misc external toolchain updates: Sourcery ARM,
Sourcery MIPS, Linaro ARM, Linaro AArch64, Blackfin, and deprecation
of Microblaze toolchains.

Thomas

Thomas Petazzoni (6):
  toolchain-external: add Sourcery ARM 2013.11, remove Sourcery ARM
    2011.09
  toolchain-external: add Sourcery MIPS 2013.11, remove Sourcery MIPS
    2012.03
  toolchain-external: update Linaro ARM toolchains
  toolchain-external: update Linaro AArch64 toolchains
  toolchain-external: mark Microblaze external toolchains as deprecated
  toolchain-external: add support for the Blackfin 2013R1 toolchain

 toolchain/toolchain-external/Config.in             | 133 ++++++++++++---------
 toolchain/toolchain-external/toolchain-external.mk |  48 ++++----
 2 files changed, 104 insertions(+), 77 deletions(-)

-- 
1.8.3.2
