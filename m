From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 11 Oct 2013 09:33:15 -0500
Subject: [Buildroot] [PATCH 0/5] Add Microblaze internal toolchain
Message-ID: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a Microblaze internal toolchain from the sources at
http://github.com/Xilinx .

Spenser Gilliland (5):
  binutils: add microblaze internal toolchain
  gcc: add microblaze internal toolchain
  glibc: add microblaze internal toolchain
  gdb: add microblaze internal toolchain
  toolchain: enable microblaze toolchain

 package/binutils/Config.in.host         |    2 ++
 package/binutils/binutils.mk            |    5 +++++
 package/gcc/Config.in.host              |   23 +++++++++++++++--------
 package/gcc/gcc.mk                      |   12 +++++++++---
 package/gdb/Config.in.host              |    4 ++++
 package/gdb/gdb.mk                      |    9 ++++++++-
 package/glibc/glibc.mk                  |   12 ++++++++++++
 toolchain/Config.in                     |    2 +-
 toolchain/toolchain-buildroot/Config.in |    4 ++--
 9 files changed, 58 insertions(+), 15 deletions(-)
