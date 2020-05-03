From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2020 15:09:58 +0200
Subject: [Buildroot] [PATCH 0/3 v2] package/kmod: add support for compressed
 modules (branch yem/host-kmod-z)
Message-ID: <cover.1588511382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds conditional compression support to the host-kmod,
so that we correctly handle compressed kernel modules.


Regards,
Yann E. MORIN.


The following changes since commit de70d9b933c23b88b7b6f07561a62fd813274e9c

  package/ne10: drop arch-related comment (2020-05-03 10:07:05 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87

  package/lmod: add compression support for the host variant (2020-05-03 15:06:48 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/kmod: explicitly disable compression when not enabled
      package/kmod: add option for host variant
      package/lmod: add compression support for the host variant

 linux/Config.in             |  1 +
 package/Config.in.host      |  1 +
 package/kmod/Config.in.host | 16 ++++++++++++++++
 package/kmod/kmod.mk        | 18 ++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/kmod/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
