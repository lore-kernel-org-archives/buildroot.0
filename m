From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 22:34:25 +0200
Subject: [Buildroot] [pull request] Pull request for branch fix-gxx-on-target
Message-ID: <cover.1280262826.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is an additional pull request to fix target g++. It is based on
the fix-gcc-on-target branch for which a pull request has been sent
today.

Thomas

The following changes since commit fed6a2a6ea884630a3723d2a49579e63e87ffd57:
  Thomas Petazzoni (1):
        target-gcc: remove useless copies of gcc

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fix-gxx-on-target

Thomas Petazzoni (1):
      target-g++: fix build

 toolchain/gcc/gcc-uclibc-4.x.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
