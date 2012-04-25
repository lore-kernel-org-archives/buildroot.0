From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 08:59:51 +0200
Subject: [Buildroot] [git commit] gcc: remove unused ARCH_FPU_SUFFIX
Message-ID: <20120425075811.E131E8A6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01df5af1db098cf399b3056dec2b7ab37bd03968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index d9efcf0..c3f4576 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -20,11 +20,9 @@ TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 else
 TARGET_SOFT_FLOAT:=-msoft-float
 endif
-ARCH_FPU_SUFFIX:=_nofpu
 else # no softfloat support
 SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
-ARCH_FPU_SUFFIX:=
 endif
 
 # some additional defaults
