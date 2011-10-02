From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Oct 2011 21:20:08 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/ext-toolchain-updates
Message-ID: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 8511728696a298ccdb8b902b60ab398d8f67e745:

  gnutls: bump to version 2.10.5 (2011-09-30 08:26:08 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/ext-toolchain-updates

Mike Frysinger (1):
      toolchain: speed up sysroot lib copying

Thomas De Schampheleire (1):
      toolchain-external: allow specifying extra external libraries

Thomas Petazzoni (7):
      external toolchain: slightly optimize the copy of the toolchain sysroot
      ext-toolchain: Add CodeSourcery SH uClinux 2011.03
      ext-toolchain: Bump version of CodeSourcery MIPS 2011.03
      ext-toolchain: Add CodeSourcery SH GNU/Linux 2011.03
      ext-toolchain: Add CodeSoucery x86 GNU/Linux 2010.09
      ext-toolchain: Take into account Mentor Graphics acquisition of CodeSoucery
      external-toolchain: Slightly optimize toolchain extraction

 toolchain/helpers.mk                     |   11 ++-
 toolchain/toolchain-external/Config.in   |  157 ++++++++++++++++++++----------
 toolchain/toolchain-external/ext-tool.mk |   17 +++-
 3 files changed, 128 insertions(+), 57 deletions(-)

Thanks,
-- 
Thomas Petazzoni
