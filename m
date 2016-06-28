From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:27:27 +0200
Subject: [Buildroot] [git commit] docs/manual/known-issues: remove
	occurrences of eglibc
Message-ID: <20160628203005.A2DD182037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95ed42c96c53a6750ac19c87f5228adf321445a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/known-issues.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index 38ba941..acfe4ff 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -14,18 +14,18 @@
   DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
   UCLIBC_SV4_DEPRECATED are needed if one wants to build the
   +ltp-testsuite+ package with uClibc. You need to either use a glibc
-  or eglibc based toolchain, or enable the appropriate options in the
-  uClibc configuration.
+  based toolchain, or enable the appropriate options in the uClibc
+  configuration.
 
 * The +xfsprogs+ package does not build with the default uClibc
   configuration used by the Buildroot toolchain backend. You need to
-  either use a glibc or eglibc based toolchain, or enable the
-  appropriate options in the uClibc configuration.
+  either use a glibc based toolchain, or enable the appropriate
+  options in the uClibc configuration.
 
 * The +mrouted+ package does not build with the default uClibc
   configuration used by the Buildroot toolchain backend. You need to
-  either use a glibc or eglibc based toolchain, or enable the
-  appropriate options in the uClibc configuration.
+  either use a glibc based toolchain, or enable the appropriate
+  options in the uClibc configuration.
 
 * The +libffi+ package is not supported on the SuperH 2 and ARC
   architectures.
