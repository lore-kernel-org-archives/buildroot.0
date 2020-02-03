From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2020 21:20:17 +0100
Subject: [Buildroot] [PATCH 0/2] uboot: needs make >= 4.0 (branch yem/fixes)
Message-ID: <cover.1580761209.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This 2-patch series fixes the build for uboot >= 2020.01 and uboot-tools
when the host make is older than 4.0 (in practice, is 3.81).


Regards,
Yann E. MORIN.


The following changes since commit b6e0aaa5441275675ea953b5d980ca7d6df918e1

  package/fail2ban: add conditional python-systemd dependancy (2020-02-03 18:24:27 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 214c0588eab33158185f6199444bd0b6dbc577ba

  boot/uboot: needs make >= 4.0 (2020-02-03 21:19:39 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/uboot-tools: needs make >= 4.0
      boot/uboot: needs make >= 4.0

 boot/uboot/uboot.mk                | 6 ++++--
 package/uboot-tools/uboot-tools.mk | 9 ++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
