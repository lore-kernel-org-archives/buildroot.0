From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sat, 19 Jul 2014 17:15:16 +0200
Subject: [Buildroot] [PATCH] dependencies.sh: fix typo
Message-ID: <1405782916-1500-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index fa50666..88e5ad2 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -206,7 +206,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 		echo "library."
 		echo "If you're running a Debian/Ubuntu distribution, install the libc6-386,"
-		echo "lib32stcd++6, and lib32z1 packages (or alternatively libc6:i386,"
+		echo "lib32stdc++6, and lib32z1 packages (or alternatively libc6:i386,"
 		echo "libstdc++6:i386, and zlib1g:i386)."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
-- 
2.0.1
