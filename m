From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 10:58:15 +0100
Subject: [Buildroot] [PATCH 0/4] package/nbd: fixes and bump
Message-ID: <cover.1489312674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes the installation of nbd and bumps it to the
latest version.


Regards,
Yann E. MORIN.


The following changes since commit 08adaacff1e1d8f63229f667110784ea24cfcd81

  s6-linux-init: new package (2017-03-10 22:55:17 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c28462eeaf3b9878658983caee9c14cfa56ccd97

  package/nbd: bump version (2017-03-12 10:47:29 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/nbd: rename options
      package/nbd: fix utilities locations
      package/nbd: add option for the trdump utility
      package/nbd: bump version

 Config.in.legacy      | 14 ++++++++++++++
 DEVELOPERS            |  1 +
 package/nbd/Config.in | 19 ++++++++++++-------
 package/nbd/nbd.hash  |  4 ++--
 package/nbd/nbd.mk    | 15 +++++++++------
 5 files changed, 38 insertions(+), 15 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
