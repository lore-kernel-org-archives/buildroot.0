From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 00:03:58 +0100
Subject: [Buildroot] [git commit master 1/1] target/generic: add /dev/ttyAM*
	device nodes
Message-ID: <20110110230414.4C3748A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a6f14be6066540034a4b7475f1c63b9864989e8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add ttyAM support for the ARM AMBA serial ports on the Cirrus EP93xx.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/device_table.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
-- 
1.7.2.2
