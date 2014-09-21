From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 20:38:09 +0200
Subject: [Buildroot] [PATCH 0/5 v3] linux-firmware: more firmwares (branch
	yem/lnx-fw)
Message-ID: <cover.1411324588.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series updates some of the linux-firmware files, and adds a few
new ones to install.

Nothing really fancy.


Changes v2 -> v3:
  - add old options to Legacy  (Thomas P.)

Change v1 -> v2:
  -  split the Intel SST DSP and TI wl18xx patch in two patches


Regards,
Yann E. MORIN.


The following changes since commit 64982ce4fa7c5131e90ea18ef761940435d8873a:

  gendoc infra: cosmetic fixes (2014-09-21 20:11:02 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/lnx-fw

for you to fetch changes up to 3cf029249f53fbbd58a50d1275872fa46111034e:

  package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c (2014-09-21 20:34:03 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/linux-firmware: prepare new firmware and new revision for iwlwifi
      package/linux-firmware: add new revision for iwlwifi firmware
      package/linux-firmware: add option for iwl7265 firmware
      package/linux-firmware: add option for Chelsio cxgb4 T5
      package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c

 Config.in.legacy                         | 39 +++++++++++++++++++++++
 package/linux-firmware/Config.in         | 53 +++++++++++++++++++++++---------
 package/linux-firmware/linux-firmware.mk | 27 ++++++++++++----
 3 files changed, 99 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
