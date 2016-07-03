From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jul 2016 10:33:07 +0200
Subject: [Buildroot] [PATCH 0/3] git-submodules: document it,
	use it (branch yem/git-modules)
Message-ID: <cover.1467534694.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a follow-up on the recently applied support for git
submodules.

It adds the documentation that was missing, and changes sunxi-mali to
use git submodules instead of the dirty hack we play with
sunxi-mali-prop.

Regards,
Yann E. MORIN.


The following changes since commit d0b11058511642d4dc6fd26abbb2419b959a9806

  babeld: needs MMU as it uses fork() (2016-07-03 10:26:53 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c7293830796ec228f541077aa09df81dda34d8af

  package/sunxi-mali: remove useless package (2016-07-03 10:29:06 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      docs/manual: document FOO_GIT_SUBMODULE
      package/sunxi-mali: use git submodules
      package/sunxi-mali: remove useless package

 docs/manual/adding-packages-generic.txt      |  6 ++++++
 package/Config.in                            |  1 -
 package/sunxi-mali-prop/Config.in            |  4 ----
 package/sunxi-mali-prop/sunxi-mali-prop.hash |  2 --
 package/sunxi-mali-prop/sunxi-mali-prop.mk   | 10 ----------
 package/sunxi-mali/Config.in                 |  3 ---
 package/sunxi-mali/sunxi-mali.hash           |  2 --
 package/sunxi-mali/sunxi-mali.mk             | 15 ++++++---------
 8 files changed, 12 insertions(+), 31 deletions(-)
 delete mode 100644 package/sunxi-mali-prop/Config.in
 delete mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.hash
 delete mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.mk
 delete mode 100644 package/sunxi-mali/sunxi-mali.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
