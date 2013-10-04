From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Oct 2013 00:00:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem/misc-updates
Message-ID: <cover.1380923923.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are two changes to the RPi packages:
  - bump firmware for misc fixes: USB, audio, GLESv2
  - bump userland for misc fixes: USB, camera, audio, codecs...

Regards,
Yann E. MORIN.


The following changes since commit 4ba4d1ad37810b19a7bbf9b1d4fb3e9c94f7f528:

  atngw100_defconfig: use BR2_KERNEL_HEADERS_VERSION to specify kernel headers (2013-10-04 22:06:52 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc-updates

for you to fetch changes up to 57f69b1a8e7a518cc9649b9f67f99894e62580f6:

  package/rpi-userland: bump version (2013-10-04 23:52:10 +0200)

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
