From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 11:54:47 +0200
Subject: [Buildroot] [PATCH 0/2] arch/csky: clean up conditions on gcc
 verssion (branch yem/arch-csky)
Message-ID: <cover.1563098054.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This little series makes use of the GCC_AT_LEAST_X symbols to restrict
the gcc versions usable for each C-SKY variants.


Regards,
Yann E. MORIN.


The following changes since commit d5225c5f6d1345bd08d968bf704e01c272537c48

  package/{mesa3d, mesa3d-headers}: bump version to 19.0.8 (2019-07-14 00:36:51 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 52aa7c5a90e87a0e8a0e794487b61d3d4759d301

  package/gcc: drop negative conditions on C-SKY for older versions (2019-07-14 11:50:43 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      arch/csky: restrict ck610 to the C-SKY gcc port
      package/gcc: drop negative conditions on C-SKY for older versions

 arch/Config.in             | 3 +++
 arch/Config.in.csky        | 2 ++
 package/gcc/Config.in.host | 8 +++-----
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
