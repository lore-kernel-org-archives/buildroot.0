From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:39:36 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-host-qemu-fixes
Message-ID: <cover.1355434710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series is an extract from my larger qemu-related series.
I did split it up to ease review and integration.

The following changes since commit e043dd6c99a801dc7f863986c78c947e25c75b3f:

  barebox: bump to version 2012.12.1 (2012-12-13 09:37:10 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-host-qemu-fixes

Yann E. MORIN (4):
      package/qemu: fix host-qemu variable names
      package/qemu: fix host dependencies
      package/qemu: use autotools-package infrastructure
      package/qemu: bump version

 package/qemu/qemu.mk |   44 +++++++++++++++++++-------------------------
 1 files changed, 19 insertions(+), 25 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
