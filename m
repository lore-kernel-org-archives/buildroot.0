From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 10 Apr 2013 13:34:38 -0700
Subject: [Buildroot] [PATCH] system/securetty: Add ttyPS[0-1]
Message-ID: <635bc23d-f513-4e61-a517-a8781d456eba@CO9EHSMHS010.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding ttyPS0 and ttyPS1 to securetty for Zynq.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
Zynq has two UARTs and the driver uses ttyPSX as device name.

	S?ren

 system/skeleton/etc/securetty | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/system/skeleton/etc/securetty b/system/skeleton/etc/securetty
index c96f2fb..5a3d0c6 100644
--- a/system/skeleton/etc/securetty
+++ b/system/skeleton/etc/securetty
@@ -22,6 +22,8 @@ ttyUL0
 ttyUL1
 ttyUL2
 ttyUL3
+ttyPS0
+ttyPS1
 ttyPSC0
 ttyPSC1
 ttyPSC2
-- 
1.8.2.1
