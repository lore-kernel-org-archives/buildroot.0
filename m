From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:25:51 +0200
Subject: [Buildroot] [git commit] glibc: remove additional occurrences of
	eglibc
Message-ID: <20160628203005.7272582037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=609c5192adacade8d1ccc0ce62de584bb0e0cd8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7adfa94..2c32e65 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# glibc/eglibc
+# glibc
 #
 ################################################################################
 
@@ -64,7 +64,7 @@ endif
 #  2. We have to execute the configure script with bash and not sh.
 #
 # Note that as mentionned in
-# http://patches.openembedded.org/patch/38849/, eglibc/glibc must be
+# http://patches.openembedded.org/patch/38849/, glibc must be
 # built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
 define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
