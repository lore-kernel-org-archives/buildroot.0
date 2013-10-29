From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 21:53:59 +0100
Subject: [Buildroot] [PATCH 0/3] Misc toolchain fixes
Message-ID: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a small set of misc toolchain fixes: fix for Linaro toolchain
usage and comment, fix to install libthread_db in more cases (i.e when
gdb native is installed on the target).

Thomas

Thomas Petazzoni (3):
  toolchain-external: add missing symlink for Linaro toolchains
  toolchain-external: fix visibility and length of Linaro toolchain
    comment
  glibc, toolchain-external: copy libthread_db when gdb is enabled

 package/glibc/glibc.mk                             | 2 +-
 toolchain/toolchain-external/Config.in             | 5 ++---
 toolchain/toolchain-external/toolchain-external.mk | 7 ++++---
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.8.1.2
