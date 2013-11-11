From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 01:09:12 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/bumps
Message-ID: <cover.1384128473.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series bumps the raspberry pi rleated packages, for various bug fixes
and other improvements.

This is very close to rc1, but still I'd like them to get in, since they
do enhance support for the rpi.

Regards,
Yann E. MORIN.


The following changes since commit a0353409933429058e04adf8f5d3f34d33c5697c:

  util-linux: disable fallocate for avr32 (2013-11-11 00:41:06 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 86c9bc7befd010cc2b4c60ee5e4607d28f90d861:

  package/rpi-userland: bump version (2013-11-11 01:07:15 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-firmware: bump version
      package/rpi-userland: bump version

 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
