From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:27 -0300
Subject: [Buildroot] [PATCH v2 14/37] toolchain/wrapper: fix code style
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-15-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The header of the .mk file fits in one line, so rearrange it to be
similar to a header from a package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v1 -> v2:
  - no changes
---
 toolchain/toolchain-wrapper.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 7f72a0cade..0b26037d48 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -1,4 +1,8 @@
-# This file contains the definition of the toolchain wrapper build commands
+################################################################################
+#
+# definition of the toolchain wrapper build commands
+#
+################################################################################
 
 # We use --hash-style=both to increase the compatibility of the generated
 # binary with older platforms, except for MIPS, where the only acceptable
-- 
2.14.1
