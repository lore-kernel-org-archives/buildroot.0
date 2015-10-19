From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 19 Oct 2015 17:02:31 +0200
Subject: [Buildroot] [PATCH 0/3] Update Boundary Devices boards support
Message-ID: <1445266954-15149-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series is mainly about switching to zImage booting as well as updating
the U-Boot and Kernel revisions (still based on the 3.14.28-1.0.0-GA release).

Details about the U-Boot/Kernel revisions update are described in the patch
commit log.

Regards,
Gary

Gary Bisson (3):
  board/boundarydevices: update 6x_bootscript to use zImage
  nitrogen6*_defconfig: switch to zImage
  nitrogen6*_defconfig: bump u-boot and kernel revisions

 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 8 ++++----
 configs/nitrogen6sx_defconfig                      | 8 ++++----
 configs/nitrogen6x_defconfig                       | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.6.1
