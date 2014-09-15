From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:49:33 +0200
Subject: [Buildroot] [PATCH 0/3] External toolchain updates
Message-ID: <1410817776-30133-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A small round of external toolchain updates: add a new CodeSourcery
toolchain for AArch64, update CodeSourcery toolchain for ARM to
version 2014.05 (and therefore remove the oldest version 2012.03), and
update Linaro toolchains for ARM, ARMeb and AArch64.

Commit logs are pretty terse since there isn't much to say about each
update really.

Thomas

Thomas Petazzoni (3):
  toolchain-external: add CodeSourcery AArch64 toolchain
  toolchain-external: remove CodeSourcery ARM 2012.03, add 2014.05
  toolchain-external: bump ARM, ARMeb and AArch64 Linaro toolchains to
    14.08

 toolchain/toolchain-external/Config.in             | 68 +++++++++++++---------
 toolchain/toolchain-external/toolchain-external.mk | 23 ++++----
 2 files changed, 55 insertions(+), 36 deletions(-)

-- 
2.0.0
