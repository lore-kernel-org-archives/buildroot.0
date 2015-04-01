From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 23:54:54 +0200
Subject: [Buildroot] [PATCH 0/2 v3] package/linux-firmware: install AMD
	Radeon firmware (branch yem/lnx-fw)
Message-ID: <cover.1427925170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This quick series is a cleanup and respin of David's initial patch to
install AMD Radeon firmware files from the linux-firmware package.


Changes v2 -> v3:
  - add support for copying complete directories,
  - use that to copy the Radeon FW files, instead of an awfully-long
    list of files.


Regards,
Yann E. MORIN.


The following changes since commit 7ed9815830bbd6551fd502ddfa5073892883bbeb:

  gnuradio: depends on shared libs (2015-04-01 23:45:45 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/lnx-fw

for you to fetch changes up to 249b813439492f82e8fd47af7a5f9b778535f7b8:

  package/linux-firmware: install AMD Radeon firmware (2015-04-01 23:48:18 +0200)

----------------------------------------------------------------
Yann E. MORIN (1):
      package/linux-firmware: add support to copy entire directories

david.barbion at ext.leroymerlin.fr (1):
      package/linux-firmware: install AMD Radeon firmware

 package/linux-firmware/Config.in         |  9 +++++++++
 package/linux-firmware/linux-firmware.mk | 30 ++++++++++++++++++++++++++----
 2 files changed, 35 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
