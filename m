From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2015 19:44:17 +0200
Subject: [Buildroot] [PATCH 0/2] timezone: bumps and hashes (branch
	yem/tzdata)
Message-ID: <cover.1429379016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps the timezone-related packages, and adds hash files to
those packages.

Regards,
Yann E. MORIN.


The following changes since commit 0f9bee00c3491024ed2775ef12d2850ed6d3d407:

  board/riotboard: readme: Update description (2015-04-18 19:08:28 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/tzdata

for you to fetch changes up to 612c6835da3af662a1a3a2b644a9e1b7bd150094:

  package/tzdata: bump version, add hash (2015-04-18 19:42:07 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/zic: bump version, add hash
      package/tzdata: bump version, add hash

 package/tzdata/tzdata.hash | 2 ++
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 2 ++
 package/zic/zic.mk         | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 package/tzdata/tzdata.hash
 create mode 100644 package/zic/zic.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
