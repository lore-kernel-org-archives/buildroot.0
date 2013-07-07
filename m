From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jul 2013 15:13:23 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-updates
Message-ID: <cover.1373202515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that (again) bumps the RPi-related packages.
Basically, there are a bunch of fixes in audio, GL, USB and raspi-cam,
plus a few framebuffer optimisations.

I'm not sure how inter-twinned the linux/firmware/userland bits are,
so I've made three patches. They work nicely in this order for me,
but YMMV, as they say. ;-)

Regards,
Yann E. MORIN.


The following changes since commit 7cbebbc48c26ddfb18da23ffba356744a5592ea6:

  Add 'bc' in the mandatory dependencies (2013-07-05 15:30:43 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to 2498afa0081e1da31f07adc355a2ac1b47bda093:

  package/rpi-userland: bump version (2013-07-07 15:01:45 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-firmware: bump version
      config/rpi: bump kernel
      package/rpi-userland: bump version

 configs/rpi_defconfig                | 2 +-
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
