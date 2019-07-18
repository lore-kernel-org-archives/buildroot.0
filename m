From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2019 23:06:25 +0200
Subject: [Buildroot] [PATCH 0/2 v2] arch/csky: clean up conditions on gcc
 verssion (branch yem/arch-csky)
Message-ID: <cover.1563483980.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This little series makes use of the GCC_AT_LEAST_X symbols to restrict
the gcc versions usable for each C-SKY variants.

---
Changes v1 -> v2:
  - expand first commit log  (Guo)
  - add Guo's acked-by
  - fix typoes


Regards,
Yann E. MORIN.


The following changes since commit c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf

  arch/arc: always needs -matomic with atomic extensions (2019-07-18 22:54:36 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f55f05c0066b6dabbcd21f68883319ff1050f478

  package/gcc: drop negative conditions on C-SKY for older versions (2019-07-18 23:02:47 +0200)


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
