From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Apr 2010 23:27:57 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	codesourcery-toolchain-support
Message-ID: <cover.1270502861.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 6cdcc4d7d8134f4b60f0eb9039090f9ad4c38366:
  Peter Korsgaard (1):
        gcc: hide shared libgcc option if BR2_PREFER_STATIC_LIB is enabled

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot codesourcery-toolchain-support

Thomas Petazzoni (4):
      external toolchains: take into account architecture variant
      external-toolchain: support libraries outside of /lib
      external-toolchain: Support for multilib toolchains
      busybox: make sure architecture flags are used at link time

 package/Makefile.in                      |   22 +++---
 package/busybox/busybox-1.13.x.config    |    1 +
 package/busybox/busybox.mk               |   10 ++--
 toolchain/external-toolchain/ext-tool.mk |  109 ++++++++++++++++++++++++-----
 4 files changed, 107 insertions(+), 35 deletions(-)

Thanks,
-- 
Thomas Petazzoni
