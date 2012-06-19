From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Tue, 19 Jun 2012 07:05:53 +0100
Subject: [Buildroot] [PATCH] Add /dev/video static device nodes
Message-ID: <1340085953-24986-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 target/generic/device_table_dev.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
index d1d1e11..a93a2c8 100644
--- a/target/generic/device_table_dev.txt
+++ b/target/generic/device_table_dev.txt
@@ -141,3 +141,6 @@
 
 # I2C device nodes
 /dev/i2c-	c	666	0	0	89	0	0	1	4
+
+# v4l device nodes
+/dev/video	c	666	0	0	81	0	0	1	4
-- 
1.7.5.4
