From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 18:26:26 +0200
Subject: [Buildroot] [PATCH 0/4] A few autobuilder fixes (branch
	yem/autobuild)
Message-ID: <cover.1411921550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

TRhis series brings in a few fixes for autobuilder failures, mostly
related to static builds.

Regards,
Yann E. MORIN.


The following changes since commit 6f5bffc426f7418c555291450d482a0ceede0865:

  qemu-ppc: update kernel to latest for g3beige emulation (2014-09-27 09:53:12 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/autobuild

for you to fetch changes up to 6d21f6468575ab79a003b9f8542f23251b459123:

  package/vde2: does not build on static only, needs dlopen() (2014-09-28 18:24:18 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      docs/manual: add musl to toolchain dependency options
      package/freerdp: can not build on uClibc
      package/trace-cmd: does not build on static onl;y, needs dlopen()
      package/vde2: does not build on static only, needs dlopen()

 docs/manual/adding-packages-directory.txt | 2 +-
 package/freerdp/Config.in                 | 5 +++++
 package/trace-cmd/Config.in               | 6 ++++--
 package/vde2/Config.in                    | 5 +++++
 4 files changed, 15 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
