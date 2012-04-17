From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:29 +0200
Subject: [Buildroot] [PATCH 17/22] gcc: remove unused ARCH_FPU_SUFFIX
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b8a3657d8fb0547c57733d3b942004d4965773da.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
