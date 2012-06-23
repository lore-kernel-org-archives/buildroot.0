From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 21:54:56 +0200
Subject: [Buildroot] [git commit] Add /dev/video static device nodes
Message-ID: <20120623201135.5BDA688E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b317f63489b03a0f31d1a199f60b3c5d878e0c10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
