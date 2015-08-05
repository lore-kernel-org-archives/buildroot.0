From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:11:20 +0200
Subject: [Buildroot] [git commit branch/next] docs/manual: document gcc
	version dependencies
Message-ID: <20150808105653.841C57FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45aaa372b03f8a96837c0ca4d24a63ca1b218417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit updates the Buildroot manual to document how to detail the
gcc version dependencies in Config.in comments of packages, like we do
for kernel headers version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 8f585d4..b66e447 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -277,6 +277,12 @@ use in the comment.
 ** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
    +X.Y+ with the proper version)
 
+* GCC version
+** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
+   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
+** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
+   +X.Y+ with the proper version)
+
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
    +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
