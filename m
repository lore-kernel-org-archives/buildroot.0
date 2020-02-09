From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Feb 2020 16:12:39 +0100
Subject: [Buildroot] [PATCH 0/3] package: drop fallout of aclocal innclude
 directory revamp (branch yem/autoconf-archive)
Message-ID: <cover.1581261155.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series provides a bit of cleanup after the aclocal include
directory revamp, adressing one big problem for a single package that
uses autoconf archive.


Regards,
Yann E. MORIN.


The following changes since commit 81a4940d2527ff4c5ad16848ee0154610937c641

  package/libexif: add post-0.6.21 upstream security fixes (2020-02-09 12:33:05 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d829177dd62464e09391482db381f7eb5416b6ac

  package/sdbusplus: drop broken autoreconf include directive (2020-02-09 16:10:19 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/libsigrok: drop remnants of autoreconf
      package/automake: also include autoconf-archive in search paths
      package/sdbusplus: drop broken autoreconf include directive

 package/automake/automake.mk   | 8 +++++++-
 package/libsigrok/libsigrok.mk | 2 --
 package/sdbusplus/sdbusplus.mk | 1 -
 3 files changed, 7 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
