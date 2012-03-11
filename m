From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 22:00:51 +0100
Subject: [Buildroot] [git commit] sh: Add additional ttySCs
Message-ID: <20120311213936.98F6290D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=790fcac794c5144b1d5ca20a4560f46a7a7f2f9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are a couple of Renesas SH devices with 8 serial ports used.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
