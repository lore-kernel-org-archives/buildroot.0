From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 11:48:50 +0100
Subject: [Buildroot] [PATCH 0/3] package/dvb-apps: misc fixes
Message-ID: <cover.1511779719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series brings in a few fixes in dvb-apps.


Regards,
Yann E. MORIN.


The following changes since commit c8f0a823efdb3f195c475194dc7b3341502819c0

  linux-headers: bump 3.2.x series (2017-11-27 09:25:46 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to b41944cb6ef4b6daf470137dacad88f10717d833

  package/dvb-apps: fix build with kernel headers >= 4.14 (2017-11-27 11:47:45 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/dvb-apps: fix build with some perl version
      package/dvb-apps: is not parallel-safe
      package/dvb-apps: fix build with kernel headers >= 4.14

 ...-utils-fix-build-with-kernel-headers-4.14.patch | 52 ++++++++++++++++++++++
 package/dvb-apps/dvb-apps.mk                       |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
