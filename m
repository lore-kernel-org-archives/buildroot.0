From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 23 Dec 2014 10:24:56 -0500
Subject: [Buildroot] [PATCH] ts5x00: remember to set the active flag
Message-ID: <1419348296-16859-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/ts/ts5x00/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.2.1
