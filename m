From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 6 Jan 2011 21:08:38 -0600
Subject: [Buildroot] [PATCH] target/generic: add /dev/ttyAM* device nodes
Message-ID: <0D753D10438DA54287A00B027084269764C40B3FB8@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ttyAM support for the ARM AMBA serial ports on the Cirrus EP93xx.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index c054000..15132f9 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -72,6 +72,7 @@
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyAM	c	666	0	0	204	16	0	1	3
 /dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
 /dev/ttySAC	c	666	0	0	204	64	0	1	4
