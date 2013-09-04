From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Sep 2013 23:35:52 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem/misc-updates
Message-ID: <cover.1378330371.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Peter, here are a few changes I've been sitting on since before I
switched into holidays mode (and in redo-the-kitchen-from-scrath mode,
which ultimately kicked in the has-no-time-to-get-in-front-of-computer
mode) three weeks ago.

I'm now back in operational condition! :-]

  - two changes RPI-related: bump kernel (rpi_defconfig), bunp firmware
  - further cleanup top-level config by moving target options to their
    own sub-menu
  - optionally print toolchain wrapper's args one-per-line in DEBUG mode

I still have to dequeue all my mails, but I'm still on holidays until
the end of the week, so... ;-)

Regards,
Yann E. MORIN.


The following changes since commit 5128cc6602d56a2c3af4cf6a0fe072d39d6c1aca:

  gcc: pass MAKEINFO=missing in the environment rather than as a ./configure arg (2013-09-04 16:22:30 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git 

for you to fetch changes up to e1d03e22b10b073d5906a4b6df22c72d38bfd8c2:

  toolchain/wrapper: add option to print one argument per line (2013-09-04 23:27:37 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/rpi-firmware: bump version
      configs: bump kernel use for RPi, use simpler defconfig
      targets: move target options to their own sub-menu
      toolchain/wrapper: add option to print one argument per line

 arch/Config.in                                     |  4 ++++
 configs/rpi_defconfig                              |  4 ++--
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 .../toolchain-external/ext-toolchain-wrapper.c     | 25 +++++++++++++++-------
 4 files changed, 24 insertions(+), 11 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
