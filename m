From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 09:54:34 +0100
Subject: [Buildroot] [git commit] device_table_dev.txt: Increase /dev/ttymxc
	count
Message-ID: <20131028090448.174F19BC19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01fb86332e9030167011fc27753d148cc712452f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since debug uart on imx6 sabreauto board is ttymxc3.

Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table_dev.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/device_table_dev.txt b/system/device_table_dev.txt
index a93a2c8..9507939 100644
--- a/system/device_table_dev.txt
+++ b/system/device_table_dev.txt
@@ -35,7 +35,7 @@
 /dev/ttySC	c	666	0	0	204	8	0	1	8
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
-/dev/ttymxc	c	666	0	0	207	16	0	1	3
+/dev/ttymxc	c	666	0	0	207	16	0	1	4
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-
