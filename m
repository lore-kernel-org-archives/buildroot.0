From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Sep 2019 22:04:28 +0200
Subject: [Buildroot] [PATCH 0/2] mesa: fix build with llvm (branch
 yem/meson-extra-progs)
Message-ID: <cover.1569701061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series allows fixing mesa3d with llvm support enabled.

To do so, it introduces a way by which packages can add extra entries to
the meson cross-compilation.conf file.


Regards,
Yann E. MORIN.


The following changes since commit 39248bba259d1b35d224285d4379844b2a551fff

  package/mesa3d: add support for gallium tegra driver (2019-09-28 21:57:00 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 71bd376fbcc68a2171acdc72d9bfddd0e60bcefd

  package/mesa3d: add llvm-config to meson [binaries] (2019-09-28 22:04:01 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      core/pkg-meson: allow packages to add extra [binaries]
      package/mesa3d: add llvm-config to meson [binaries]

 docs/manual/adding-packages-meson.txt | 7 +++++++
 package/mesa3d/mesa3d.mk              | 2 +-
 package/pkg-meson.mk                  | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
