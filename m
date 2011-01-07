From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 6 Jan 2011 21:14:41 -0600
Subject: [Buildroot] [PATCH] etc/securetty: Add ttyAM for ep93xx
Message-ID: <0D753D10438DA54287A00B027084269764C40B3FBD@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow root login on the Cirrus ep93xx ARM AMBA serial ports.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index e69fec7..fd0ec8e 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -37,3 +37,6 @@ ttyO0
 ttyO1
 ttyO2
 ttyO3
+ttyAM0
+ttyAM1
+ttyAM2
