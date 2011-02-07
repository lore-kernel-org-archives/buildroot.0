From: Mike Frysinger <vapier@gentoo.org>
Date: Mon,  7 Feb 2011 00:49:01 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
Message-ID: <1297057741-5809-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 9f31e2ffa005095206824e08f69da75503e998ab:

  busybox: 1.18.2 fixes for ping, tar and udhcp (2011-02-06 21:48:53 +0100)

are available in the git repository at:
  git://sources.blackfin.uclinux.org/git/users/vapier/buildroot.git vapier

Mike Frysinger (3):
      debugging: do not require no stripping
      initial support for Blackfin processors
      gdb: add support for Blackfin gdbserver

 Config.in                                      |    4 +-
 Makefile                                       |    1 +
 boot/u-boot/Config.in                          |    4 +
 boot/u-boot/u-boot.mk                          |    2 +
 linux/Config.in                                |    2 +-
 linux/linux.mk                                 |    5 +
 target/Config.in.arch                          |   19 ++-
 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch |  238 ++++++++++++++++++++++++
 toolchain/gdb/Config.in                        |    7 +-
 toolchain/toolchain-common.in                  |    2 +-
 10 files changed, 276 insertions(+), 8 deletions(-)
 create mode 100644 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch
