From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Dec 2012 00:23:19 +0100
Subject: [Buildroot] [pull request] Pull request for branch ext-toolchains
Message-ID: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of updates for external toolchains:

 * Adding two new versions of the Sourcery MIPS toolchains, removing
   the oldest two ones.

 * Simplification of download URLs.

 * Add two new AArch64 toolchains. The goal, like other toolchains, is
   to keep at most 3 toolchain versions.

 * Add one new Linaro ARM toolchain, and remove the oldest one.

Thanks,

Thomas

The following changes since commit 14bf3df3a649715246e13a9bf5f0902f09df84a6:

  mplayer: prevent selection on Microblaze and AArch64 (2012-12-20 09:21:39 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git ext-toolchains

for you to fetch changes up to 6210d76c7fef76a239c2e03c02998035cd13d9e8:

  toolchain-external: remove support for 'Linaro ARM 2012.09' (2012-12-21 00:20:44 +0100)

----------------------------------------------------------------
Thomas Petazzoni (9):
      toolchain-external: add support for 'Sourcery CodeBench MIPS 2012.03'
      toolchain-external: add support for 'Sourcery CodeBench MIPS 2012.09'
      toolchain-external: remove support for 'Sourcery CodeBench MIPS 4.4'
      toolchain-external: remove support for 'Sourcery CodeBench MIPS 2011.03'
      toolchain-external: simplify many Sourcery CodeBench download URLs
      toolchain-external: add support for 'Linaro AArch64 12.11'
      toolchain-external: add support for 'Linaro AArch64 12.12'
      toolchain-external: add support for 'Linaro ARM 2012.12'
      toolchain-external: remove support for 'Linaro ARM 2012.09'

 toolchain/toolchain-external/Config.in   |  154 ++++++++++++++++++++----------
 toolchain/toolchain-external/ext-tool.mk |   40 ++++----
 2 files changed, 128 insertions(+), 66 deletions(-)

Thanks,
-- 
Thomas Petazzoni
