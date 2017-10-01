From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Oct 2017 11:58:04 +0200
Subject: [Buildroot] [PATCH 0/2] package/matchbox: fixes
Message-ID: <cover.1506851870.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series brings in two fixes to the matchbox packages:
  - ensure correct dependency selection
  - fix the libmb.pc file


Regards,
Yann E. MORIN.


The following changes since commit f04df2d65dcdbff18cdc4a173aeef574de97f2ed

  package/opencore-amr: fix license, add license hash (2017-09-29 09:05:18 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 73a014e628bcbf58c220a91a54d8637b792186f6

  package/matchbox-lib: correctly fix the .pc file (2017-10-01 11:53:07 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      matchbox-lib: select dependency
      package/matchbox-lib: correctly fix the .pc file

 DEVELOPERS                                   | 1 +
 package/matchbox-fakekey/matchbox-fakekey.mk | 4 ++--
 package/matchbox-lib/Config.in               | 1 +
 package/matchbox-lib/matchbox-lib.mk         | 7 +++++++
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
