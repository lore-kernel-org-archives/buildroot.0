From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 Jul 2018 22:21:25 +0000
Subject: [Buildroot] [PATCH v1 0/2] Add QLogic FastLinQ 4xxxx support
Message-ID: <cover.1532642378.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Adds a new config option to install firmware for the QLogic FastLinQ 4xxxx
Ethernet driver, qede, and updates the linux-firmware package to get a newly
released firmware file needed by the Linux-4.17.9 qede driver.

Cavium ThunderX2 systems often come with these Ethernet devices.

Please consider.

-Geoff

The following changes since commit c83f2c14f8fde96bbdc1ee351d62f3b2346d20ff:

  luarocks: bump to version 3.0.0 (2018-07-25 23:29:12 +0200)

are available in the git repository at:

  https://github.com/glevand/petitboot--buildroot.git for-merge-fw-1

for you to fetch changes up to 62b0fd196638870d0c17da94ca0cb98b96b6dae3:

  linux-firmware: Add QLogic FastLinQ 4xxxx (2018-07-26 14:54:52 -0700)

----------------------------------------------------------------
Geoff Levand (2):
      linux-firmware: bump version to latest 8d69bab
      linux-firmware: Add QLogic FastLinQ 4xxxx

 package/linux-firmware/Config.in           | 6 ++++++
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 9 ++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.14.1
