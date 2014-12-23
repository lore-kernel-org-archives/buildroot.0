From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:54:58 +0100
Subject: [Buildroot] [git commit] ts5x00: remember to set the active flag
Message-ID: <20141223195503.2C9B08069C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8766453dada87b3f0f6995dd1a2a2ebf32616bd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/ts/ts5x00/readme.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/board/ts/ts5x00/readme.txt b/board/ts/ts5x00/readme.txt
index a1d919e..1e50682 100644
--- a/board/ts/ts5x00/readme.txt
+++ b/board/ts/ts5x00/readme.txt
@@ -43,7 +43,8 @@ Then install SYSLINUX in the mounted partition:
 IMPORTANT: In order for the board to boot the Compact Flash with a recent
 config, the BIOS must use Logical Block Addressing (LBA). You can do it by
 choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS
-Configuration" screen. For details about the CMOS setup, please see:
+Configuration" screen. Also, don't forget to set the 'active' (or 'bootable')
+flag on partition 1. For details about the CMOS setup, please see:
 http://wiki.embeddedarm.com/wiki/TS-5500#System_BIOS_Setup_Screens
 
 Connect a terminal program to the rs232 connector marked "COM2"
