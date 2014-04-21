From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 20:24:02 +0200
Subject: [Buildroot] [PATCH 0/2] Misc linux-firmware fixes (branch yem/lnxfw)
Message-ID: <cover.1398104592.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few fixes to the linux-firmware package:
  - fix a typo in a variable name
  - install missing symlink-target files

Regards,
Yann E. MORIN.


The following changes since commit 8104fd72ed6fee97f024ec75a4ed81231e2777b8:

  mysql: disable maintainer mode (2014-04-21 14:48:23 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/lnxfw

for you to fetch changes up to dc9af8ce0711ae9a66c28327546aeb999f08cca4:

  package/linux-firmware: install missing symlink-target files (2014-04-21 20:20:58 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/linux-firmware: fix typo in variable name
      package/linux-firmware: install missing symlink-target files

 package/linux-firmware/linux-firmware.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
