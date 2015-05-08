From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2015 07:16:20 +0200
Subject: [Buildroot] [git commit] fix typo in package install suggestion for
	dependencies
Message-ID: <20150508051709.D746280793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=965e3b96b6e2d5fe7ee5f0db7249242b098baddd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
