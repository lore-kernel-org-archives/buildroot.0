From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:46:41 +0200
Subject: [Buildroot] [git commit] toolchain/wrapper: fix code style
Message-ID: <20180401064726.268DA818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b17e5b2d580cb09d057e33bf612a24dfe9582f43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The header of the .mk file fits in one line, so rearrange it to be
similar to a header from a package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
