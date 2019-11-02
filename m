From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat,  2 Nov 2019 19:38:37 -0300
Subject: [Buildroot] [PATCH 0/2] configs/beaglebone: fix boot hang and
 update kernel
Message-ID: <20191102223839.16262-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Update U-Boot environment to prevent boot hangs
- Update the kernel to the latest release from the official BeagleBoard
  and BeagleBone kernel repository

Carlos Santos (2):
  board/beaglebone: fix boot on BeagleBone Black
  configs/beaglebone: use the new BeagleBoard/BeagleBone kernel
    repository

 board/beaglebone/uEnv.txt    | 5 ++++-
 configs/beaglebone_defconfig | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.18.1
