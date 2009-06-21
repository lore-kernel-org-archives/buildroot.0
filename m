From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Jun 2009 14:37:09 +0200
Subject: [Buildroot] [git commit] target/generic: add /dev/i2c-N device nodes
Message-ID: <20090622132900.E321A777DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33f7d7929fa0ebc647232269b3c2569dcce4c94c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/device_table.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index a80863e..a2bfff9 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -175,3 +175,5 @@
 #/dev/mcd	b	640	0	0	23	0	0	0	-
 #/dev/optcd	b	640	0	0	17	0	0	0	-
 
+# I2C device nodes
+/dev/i2c-	c	666	0	0	89	0	0	1	4
-- 
1.6.0.6
