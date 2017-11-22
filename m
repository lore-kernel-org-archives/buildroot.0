From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Nov 2017 11:54:14 +1030
Subject: [Buildroot] [PATCH 0/2] pdbg updates
Message-ID: <20171122012416.25862-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A bump to fix build issues. Thanks for writing the fix Thomas! This
should go into master as well as next.

The help text update could go in too, but it is not urgent.

Build tested on ARM and mips64el.

Joel Stanley (2):
  pdbg: update help text
  pdbg: Bump to latest upstream version

 ...bg-Remove-unused-__unused-from-compiler.h.patch | 39 ----------------------
 package/pdbg/Config.in                             |  4 +--
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  2 +-
 4 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch

-- 
2.14.1
