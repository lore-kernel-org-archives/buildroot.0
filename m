From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 May 2013 12:36:40 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	yem-patchwork-fixes
Message-ID: <cover.1369650924.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are four patches from Nathan Lynch to fix building out-of-tree
when the Buildroot source tree is readonly (eg. shared via NFS between
multiple developers).

Regards,
Yann E. MORIN


The following changes since commit 1e7f40ebb5cfc58010faf5e8d751de9207dc6a5d:

  Revert "dependencies: check that SSL certificates are installed" (2013-05-26 11:14:00 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-patchwork-fixes

for you to fetch changes up to 73b5281a6c6d7cf1ba5d2c6340e39e9ebc2d36d0:

  linux: ensure buildroot_defconfig is writable (2013-05-27 12:34:40 +0200)

----------------------------------------------------------------
Nathan Lynch (4):
      toolchain/uClibc: ensure .oldconfig is writable
      target: ensure target/ dir is writable
      busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable
      linux: ensure buildroot_defconfig is writable

 Makefile                   | 4 ++--
 linux/linux.mk             | 4 ++--
 package/busybox/busybox.mk | 2 +-
 toolchain/uClibc/uclibc.mk | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
