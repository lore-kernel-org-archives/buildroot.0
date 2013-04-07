From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 20:00:58 +0200
Subject: [Buildroot] [PATCH 0/4] External toolchain updates
Message-ID: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are some traditional toolchain updates (for Linaro ARM and
Aarch64 toolchains), a typo fix for a Blackfin toolchain, and the
removal of the oldest Microblaze toolchain, since it is no longer
possible to download just the toolchain tarball from the Git
repository.

Thanks.

Thomas Petazzoni (4):
  toolchain-external: update ARM Linaro toolchains
  toolchain-external: update AArch64 Linaro toolchains
  toolchain-external: fix typo in Blackfin toolchain config option
  toolchain-external: remove older Microblaze toolchain

 toolchain/toolchain-external/Config.in   |   62 ++++++++++--------------------
 toolchain/toolchain-external/ext-tool.mk |   32 +++++++--------
 2 files changed, 33 insertions(+), 61 deletions(-)

-- 
1.7.9.5
