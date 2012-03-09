From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Fri, 09 Mar 2012 09:43:42 +0000
Subject: [Buildroot] [PATCH] sh: Add additional ttySCs
Message-ID: <1331286222-17054-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a couple of Renesas SH devices with 8 serial ports used.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 fs/skeleton/etc/securetty           |    2 ++
 target/generic/device_table_dev.txt |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index 547ceda..c96f2fb 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -46,4 +46,6 @@ ttySC2
 ttySC3
 ttySC4
 ttySC5
+ttySC6
+ttySC7
 ttyGS0
diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
index a3d53d4..d1d1e11 100644
--- a/target/generic/device_table_dev.txt
+++ b/target/generic/device_table_dev.txt
@@ -32,7 +32,7 @@
 /dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
 /dev/ttySAC	c	666	0	0	204	64	0	1	4
-/dev/ttySC	c	666	0	0	204	8	0	1	6
+/dev/ttySC	c	666	0	0	204	8	0	1	8
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 /dev/ttymxc	c	666	0	0	207	16	0	1	3
-- 
1.7.0.4
