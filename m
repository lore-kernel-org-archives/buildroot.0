From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 13 Jan 2012 20:23:23 +0100
Subject: [Buildroot] [PATCH] Fix typo buiding -> building
Message-ID: <fbb83c23f4d48ca0ca16.1326482603@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/toolchain-common.in |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -105,4 +105,4 @@ config BR2_TARGET_OPTIMIZATION
 config BR2_TARGET_LDFLAGS
 	string "Target linker options"
 	help
-	  Extra options to pass to the linker when buiding for the target.
+	  Extra options to pass to the linker when building for the target.
