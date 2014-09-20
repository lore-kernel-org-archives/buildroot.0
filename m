From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:09 +0200
Subject: [Buildroot] [PATCH 0/15 v2] linux-firmware: bump + more firmwares
	(branch yem/lnx-fw)
Message-ID: <cover.1411246411.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps linux-fimware, updates some of the firmware files, and
adds a bunch of new ones to install.

Nothing really tricky.

Changes v1 -> v2:
  -  split the Intel SST DSP and TI wl18xx patch in two patches


Regards,
Yann E. MORIN.


The following changes since commit b7fcf3bc5643a75898c76d5610360b6560a695f2:

  sudo: bump to version 1.8.10p3 (2014-09-19 23:21:48 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/lnx-fw

for you to fetch changes up to 7358165cfe8ee1f05f64eec392031c5628b8a4ac:

  package/linux-firmware: add option for Intel SST DSP (Baytrail audio) (2014-09-20 14:59:46 +0200)

----------------------------------------------------------------
Yann E. MORIN (15):
      package/linux-firmware: bump revision
      package/linux-firmware: split bcm43xx / bcm43xxx
      package/linux-firmware: use the new bnx2x firmware version
      package/linux-firmware: install firmware files for rtlwifi rtl8723be
      package/linux-firmware: add option for Realtek rtl88xx firmware
      package/linux-firmware: add option for TI wl18xx firmware
      package/linux-firmware: prepare new firmware and new revision for iwlwifi
      package/linux-firmware: add new revision for iwlwifi firmware
      package/linux-firmware: use the new Chelsio cxgb4 firmware
      package/linux-firmware: add option for Chelsio cxgb4 T5
      package/linux-firmware: add option for Abilis Systems DVB-T as102
      package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c
      package/linux-firmware: add option for ITEtech it9135 firmware
      package/linux-firmware: add option for iwl7265 firmware
      package/linux-firmware: add option for Intel SST DSP (Baytrail audio)

 package/linux-firmware/Config.in         | 100 ++++++++++++++++++++++++-------
 package/linux-firmware/linux-firmware.mk |  93 ++++++++++++++++++++++------
 2 files changed, 153 insertions(+), 40 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
