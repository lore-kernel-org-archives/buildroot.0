From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 17:52:35 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-host-qemu-fixes
Message-ID: <cover.1355676748.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The following changes since commit 3ceffe9659ae4a98a4127812126379a263ab991e:

  dnsmasq: bump to version 2.65 (2012-12-16 14:30:40 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-host-qemu-fixes

Yann E. MORIN (2):
      package/qemu: bump version to 1.2.2
      package/qemu: use autotools-package infrastructure

 package/qemu/qemu.mk |   19 +++++--------------
 1 files changed, 5 insertions(+), 14 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
