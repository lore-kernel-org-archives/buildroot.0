From: Gergely Imreh <imrehg@gmail.com>
Date: Fri, 08 May 2015 02:42:29 +0000
Subject: [Buildroot] [PATCH 1/1] fix typo in package install suggestion for
	dependencies
Message-ID: <1431052939-16078-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 52305e1..01ad828 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -217,7 +217,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
 		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 		echo "library."
-		echo "If you're running a Debian/Ubuntu distribution, install the libc6-386,"
+		echo "If you're running a Debian/Ubuntu distribution, install the libc6-i386,"
 		echo "lib32stdc++6, and lib32z1 packages (or alternatively libc6:i386,"
 		echo "libstdc++6:i386, and zlib1g:i386)."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
-- 
1.9.1
