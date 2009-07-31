From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:02:44 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	program-invocation-and-coreutils
Message-ID: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d4a8eebf597da6e992e663c73f152c49724f7236:
  Peter Korsgaard (1):
        kernel-headers: bump 2.6.27 / 2.6.30 stable versions

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot program-invocation-and-coreutils

Thomas Petazzoni (3):
      Fix PROGRAM_INVOCATION handling with external toolchains
      coreutils: bump version
      coreutils: add TODO note about stripping the installed binaries

 TODO                                               |   10 ++++++++
 package/coreutils/Config.in                        |    4 +-
 .../coreutils/coreutils-7.4-rename-m4-fix.patch    |   25 ++++++++++++++++++++
 package/coreutils/coreutils.mk                     |    7 +++--
 package/tar/Config.in                              |    4 +-
 target/generic/Config.in                           |    4 +-
 toolchain/Config.in.2                              |   10 ++++++++
 toolchain/external-toolchain/ext-tool.mk           |    4 ++-
 toolchain/uClibc/Config.in                         |    8 ------
 toolchain/uClibc/uclibc.mk                         |    2 +-
 10 files changed, 59 insertions(+), 19 deletions(-)
 create mode 100644 package/coreutils/coreutils-7.4-rename-m4-fix.patch

Thanks,
-- 
Thomas Petazzoni
