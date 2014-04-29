From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 20:08:07 +0200
Subject: [Buildroot] [PATCH 0/2 v2] Raspberry Pi bumps (branch yem/bumps)
Message-ID: <cover.1398794817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are two bumps related to the Raspberry Pi:
  - firmware bump, with some enhancement, new features and fixes
  - switch to using the a long-term, 3.12-based kernel

Changes v1 -> v2:
  - properly bump the kernel headers (missed the HEADERS_AT_LEAST_XXX)

Regards,
Yann E. MORIN.


The following changes since commit a72b73852568227ee948a380c720756fbbdbec46:

  upstream glibc 2.18/2.19 works fine with microblaze (2014-04-28 22:16:37 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 898e036445f0bc0800b4b150a19024278cbc5d92:

  configs: bump raspberrypi_defconfig to use latest rpi-3.12.y (2014-04-29 20:05:09 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-firmware: bump for enhancements and bug fixes
      configs: bump raspberrypi_defconfig to use latest rpi-3.12.y

 configs/raspberrypi_defconfig        | 8 ++++----
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
