From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 22:38:48 +0200
Subject: [Buildroot] [PATCH 0/2] Further GCC variable simplifications
Message-ID: <20180923203850.19447-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Reviewing and merging the patch from Mark Corbin adding the
GCC_TARGET_* variables in arch/arch.mk made me think about a few
additional simplifications, that lead to the two patches in this
series.

Please review :-)

Thanks,

Thomas

Thomas Petazzoni (2):
  arch: drop BR2_GCC_TARGET_CPU_REVISION option
  toolchain-external: drop no longer needed CC_TARGET_<foo>_ variables

 arch/Config.in                                     |  3 --
 arch/arch.mk                                       |  1 -
 package/gcc/gcc.mk                                 |  4 --
 .../toolchain-external/pkg-toolchain-external.mk   | 60 +++++++++-------------
 4 files changed, 24 insertions(+), 44 deletions(-)

-- 
2.14.4
