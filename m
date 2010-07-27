From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:18:57 +0200
Subject: [Buildroot] [pull request] Pull request for branch fix-gcc-on-target
Message-ID: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are a few patches concerning target-gcc. One of them is a build
fix (issue reported by rfs on IRC), the other ones are minor
improvements.

Thomas

The following changes since commit e475cf0309f11078202ade5019fcf49f58a60eed:
  Thomas Petazzoni (1):
        Deprecate pcmcia and microwin packages

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fix-gcc-on-target

Thomas Petazzoni (4):
      target-gcc: Get rid of TARGET_GCC_FLAGS
      target-gcc: fix build
      target-gcc: no need to strip binaries, remove .la files and doc
      target-gcc: remove useless copies of gcc

 toolchain/gcc/Makefile.in       |    5 -----
 toolchain/gcc/gcc-uclibc-4.x.mk |   19 +++++++++----------
 2 files changed, 9 insertions(+), 15 deletions(-)

Thanks,
-- 
Thomas Petazzoni
