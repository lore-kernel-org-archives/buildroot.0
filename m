From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2011 15:24:43 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/new-codesourcery-toolchain
Message-ID: <cover.1305293029.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch set integrates the new 2011.03 toolchain releases published
by CodeSourcery for the ARM and MIPS architectures.

The changes have been tested with a basic Busybox + zlib build, on
both ARM and MIPS.

Thomas

The following changes since commit c59d0247541a85c62227b79d4fdb77405c4e6c99:

  external-toolchain: fix support (2011-05-08 21:56:10 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.05/new-codesourcery-toolchain

Thomas Petazzoni (2):
      external-toolchain: Add ARM CodeSourcery 2011.03
      external-toolchain: Add MIPS CodeSourcery 2011.03

 toolchain/toolchain-external/Config.in   |   39 ++++++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    6 ++++
 2 files changed, 45 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
