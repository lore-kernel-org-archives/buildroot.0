From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jun 2012 16:04:34 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/ext-toolchain-updates
Message-ID: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 54f88ee8eed9d3ae7ab670d14ba77a97a44caaca:

  nfs-utils: needs pkg-config (2012-05-31 13:16:10 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.08/ext-toolchain-updates

for you to fetch changes up to 7a2800c2cb33d674a82e1396354225549458a708:

  toolchain-external: on SuperH, use Sourcery CodeBench 2011.09 by default (2012-06-03 16:02:55 +0200)

----------------------------------------------------------------
Thomas Petazzoni (10):
      toolchain-external: add Linaro 2012.05
      toolchain-external: adjust logic to support Linaro 2012.05
      toolchain-external: add Sourcery CodeBench SuperH 2012.03
      toolchain-external: add Sourcery CodeBench x86 2012.03
      toolchain-external: add Blackfin toolchain 2012R1-BETA1
      toolchain-external: add Sourcery CodeBench MIPS 2011.09
      toolchain-external: remove Sourcery CodeBench ARM 2009q3
      toolchain-external: remove Linaro 2012.01
      toolchain-external: on i386/x86_64, use Sourcery CodeBench 2011.09 by default
      toolchain-external: on SuperH, use Sourcery CodeBench 2011.09 by default

 toolchain/helpers.mk                     |    4 +-
 toolchain/toolchain-external/Config.in   |  178 +++++++++++++++++++++++++-----
 toolchain/toolchain-external/ext-tool.mk |   28 +++--
 3 files changed, 170 insertions(+), 40 deletions(-)

Thanks,
-- 
Thomas Petazzoni
