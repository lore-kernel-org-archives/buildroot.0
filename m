From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Dec 2017 17:15:35 +0100
Subject: [Buildroot] [PATCH 0/2 v2] package/matchbox: fixes
Message-ID: <cover.1514045682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series brings in two fixes to the matchbox packages:
  - ensure correct dependency selection
  - fix the libmb.pc file

Changes v1 -> v2:
  - more dependency fix  (Arnout)
  - more fix on the post-staging hook


Regards,
Yann E. MORIN.


The following changes since commit 2a604ddcd8d8bf093cdedaefc074a8c61933a4b6

  luksmeta: enabled build with musl (2017-12-22 15:39:19 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 92f0878e530274e8e883f96c4eee06f4dce7241e

  package/matchbox-lib: correctly fix the .pc file (2017-12-23 17:11:53 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      matchbox-lib: fix dependencies
      package/matchbox-lib: correctly fix the .pc file

 DEVELOPERS                                   | 1 +
 package/matchbox-fakekey/matchbox-fakekey.mk | 4 ++--
 package/matchbox-lib/Config.in               | 1 +
 package/matchbox-lib/matchbox-lib.mk         | 7 ++++---
 4 files changed, 8 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
