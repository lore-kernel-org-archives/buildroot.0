From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Dec 2013 23:36:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/bumps
Message-ID: <cover.1385937338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few bumps to start-off the 2014.02 cycle! :-)

Regards,
Yann E. MORIN.


The following changes since commit b8160c39ce2e9f216caec7e53a0f6e6b73f845c2:

  docs/news.html: add 2013.11 announcement link (2013-12-01 21:10:53 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to be562b7c43e4f2b1665baf2168b31a6a2379e20d:

  package/tvheadend: bump version (2013-12-01 23:00:50 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/rpi-firmware: bump for misc fixes and improvements
      package/rpi-userland: bump for misc fixes
      package/dvb-apps: bump version
      package/tvheadend: bump version

 package/dvb-apps/dvb-apps.mk         | 2 +-
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 package/tvheadend/tvheadend.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
