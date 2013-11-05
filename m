From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Nov 2013 19:28:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/bumps
Message-ID: <cover.1383675996.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few bumps:
  - rpi: bump firmware and userland for misc fixes
  - tzdata: bump for new TZ definitions and new TZ compiler

Regards,
Yann E. MORIN.


The following changes since commit da1ca5c0a24e12bff1157fbd9275b5150f2ab620:

  dropwatch: fix avr32 build failure (2013-11-05 14:25:51 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 8be57551e01d1a692be7ef343b3a0939645c6f17:

  package/zic: bump (2013-11-05 19:25:15 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/rpi-firmware: bump
      package/rpi-userland: bump
      package/tzdata: bump
      package/zic: bump

 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 package/tzdata/tzdata.mk             | 2 +-
 package/zic/zic.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
