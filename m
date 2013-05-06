From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  6 May 2013 12:14:54 +0200
Subject: [Buildroot] [PATCH 0/3] Fixes for new regressions
Message-ID: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patchset fixes a bunch of regressions introduced recently caught by
building the defconfig.

Maxime

Maxime Ripard (3):
  armv8: Fix defconfig build
  pandaboard: Fix defconfig build
  toolchain/gcc: Enable --with-float for powerpc

 Makefile                        | 3 ++-
 configs/pandaboard_defconfig    | 5 +++++
 toolchain/gcc/gcc-uclibc-4.x.mk | 3 ++-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.8.1.2
