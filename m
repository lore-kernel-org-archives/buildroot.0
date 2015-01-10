From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:12:41 +0100
Subject: [Buildroot] [git commit] boards/raspberrypi: don't document
	non-existent files
Message-ID: <20150110111537.A96D9801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0b3525483cafdd788fbee9ebaacb2cde94b21e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those files were previously installed, but that's no longer the case
since we select in the menuconfig which version of the bootloader we
install.

[Thomas: fix minor typo in commit log.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 8532de4..a6d3dd4 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -55,9 +55,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware
     |   +-- bootcode.bin
     |   +-- config.txt
-    |   +-- fixup_cd.dat
     |   +-- fixup.dat
-    |   +-- start_cd.elf
     |   `-- start.elf
     `-- zImage
 
