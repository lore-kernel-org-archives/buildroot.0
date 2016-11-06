From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Nov 2016 21:23:47 +0100
Subject: [Buildroot] [PATCH 0/2] package/tvheadend: needs an UTF8 locale
Message-ID: <cover.1478463815.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series is a band-aid to fix the build of tvheadend on systems
where the current locale is not UTF8.


Regards,
Yann E. MORIN.


The following changes since commit d02655cd2157636d6150daf3a1344b25141780c1

  package/ser2net: disable threads for toolchains without threads support (2016-11-06 15:11:21 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6f09b8c02099896660df1f6cfe177c92d946f01c

  package/tvheadend: needs a host with an UTF8 locale (2016-11-06 21:21:34 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      core: find an UFT8 locale on the host
      package/tvheadend: needs a host with an UTF8 locale

 Makefile                         |  3 +++
 package/tvheadend/tvheadend.mk   |  5 +++--
 support/scripts/find-utf8-locale | 48 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100755 support/scripts/find-utf8-locale

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
