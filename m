From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:15:00 +0200
Subject: [Buildroot] [PATCH 0/14] linux-firmware: bump + more firmwares
	(branch yem/lnx-fw)
Message-ID: <cover.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps linux-fimware, updates some of the firmware files, and
adds a bunch of new ones to install.

Nothing really tricky.

Regards,
Yann E. MORIN.


The following changes since commit 3b423f3b02e1604d8b66b0b6555218e5409ca99f:

  php: bump to version 5.5.17 (2014-09-19 16:18:56 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/lnx-fw

for you to fetch changes up to e47fcd863c3ddb704e0f7e7e7a9d691c54c79b73:

  package/linux-firmware: add option for Realtek rtl88xx firmware (2014-09-19 23:09:19 +0200)

----------------------------------------------------------------
Yann E. MORIN (14):
      package/linux-firmware: bump revision
      package/linux-firmware: split bcm43xx / bcm43xxx
      package/linux-firmware: install firmware files for rtlwifi rtl8723be
      package/linux-firmware: add Intel SST DSP (Baytrail audio)
      package/linux-firmware: use the new bnx2x firmware version
      package/linux-firmware: use the new Chelsio cxgb4 firmware
      package/linux-firmware: add option to install Chelsio cxgb4 T5
      package/linux-firmware: add option to isntall Abilis Systems DVB-T as102
      package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c
      package/linux-firmware: add option for ITEtech it9135 firmware
      package/linux-firmware: prepare new firmware and new revision for iwlwifi
      package/linux-firmware: add new revision for iwlwifi firmware
      package/linux-firmware: add option to install anew iwlwifi firmware
      package/linux-firmware: add option for Realtek rtl88xx firmware

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
