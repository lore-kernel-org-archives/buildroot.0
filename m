From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2011 19:44:23 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.11/ext-toolchain-updates
Message-ID: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Changes since the last posting:

 * Add Acked-by and Reviewed-by tags as given by Yann E. Morin (thanks!)

 * Include comments made by Yann and Arnout on patches 8/9 and 9/9.

Thomas

The following changes since commit ddb8c639c312fd9f65dbb123837c100281495d50:

  libplayer: mark python bindings as broken (2011-10-08 22:39:29 +0200)

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

 toolchain/helpers.mk                     |   10 +-
 toolchain/toolchain-external/Config.in   |  157 ++++++++++++++++++++----------
 toolchain/toolchain-external/ext-tool.mk |   17 +++-
 3 files changed, 127 insertions(+), 57 deletions(-)

Thanks,
-- 
Thomas Petazzoni
