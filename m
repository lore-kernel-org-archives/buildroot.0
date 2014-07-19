From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:04:38 +0200
Subject: [Buildroot] [git commit] dependencies.sh: fix typo
Message-ID: <20140719160636.8C20C9D25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14c1641c1a83b7292783a3e0862403afb4d66c84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
