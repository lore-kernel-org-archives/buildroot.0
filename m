From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 11:47:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/remove-deprecated-arch
Message-ID: <cover.1283334416.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4973632207fd496199298191ada01c8c8ec2bee7:
  Yann E. MORIN (1):
        packages/atk: fix Makefile

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/remove-deprecated-arch

Thomas Petazzoni (2):
      Remove architectures marked as deprecated
      Remove code specific to removed architectures

 fs/jffs2/Config.in            |    4 +-
 package/liboil/liboil.mk      |    3 -
 package/ltrace/Config.in      |    2 +-
 package/openssl/openssl.mk    |    3 -
 target/Config.in.arch         |  130 +++--------------------------------------
 toolchain/gcc/Config.in       |    2 +-
 toolchain/toolchain-common.in |    1 -
 7 files changed, 13 insertions(+), 132 deletions(-)

Thanks,
-- 
Thomas Petazzoni
