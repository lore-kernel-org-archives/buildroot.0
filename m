From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Sep 2013 00:00:29 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem/misc-updates
Message-ID: <cover.1379714259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are two misc updates:
  - bump the RPi firmware for some fixes
  - alternate debug mode for the toolchain wrapper

Regards,
Yann E. MORIN.


The following changes since commit 1fe1165e619fdaa2fedc027137974797796f80aa:

  civetweb: new package (2013-09-20 16:14:10 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc-updates

for you to fetch changes up to 4092a345daa1077982e8355fdfa22c27b7240a7f:

  package/rpi-firmware: bump version (2013-09-20 19:57:56 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain/wrapper: add option to print one argument per line
      package/rpi-firmware: bump version

 docs/manual/customize-toolchain.txt                | 11 ++++++++++
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 .../toolchain-external/ext-toolchain-wrapper.c     | 25 +++++++++++++++-------
 3 files changed, 29 insertions(+), 9 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
