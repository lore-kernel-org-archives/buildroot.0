From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:59:07 +0200
Subject: [Buildroot] [git commit] board/olpc/xo-1: drop garbage from kernel
 config
Message-ID: <20200617190503.44D78814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b38a2dd15d8a06f30a9245056cd85321018c7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are unnecessary in a defconfig.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olpc/xo-1/linux.config | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 2541a310a5..12919471a2 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -4,7 +4,6 @@ CONFIG_MGEODE_LX=y
 CONFIG_X86_MSR=y
 CONFIG_HZ_100=y
 CONFIG_KEXEC=y
-CONFIG_PHYSICAL_START=0x400000
 CONFIG_CMDLINE_BOOL=y
 CONFIG_ACPI=y
 CONFIG_CPU_IDLE=y
@@ -13,10 +12,7 @@ CONFIG_OLPC=y
 CONFIG_OLPC_XO1_PM=y
 CONFIG_OLPC_XO1_RTC=y
 CONFIG_OLPC_XO1_SCI=y
-# CONFIG_FIRMWARE_MEMMAP is not set
 # CONFIG_VIRTUALIZATION is not set
-CONFIG_ARCH_MMAP_RND_BITS=16
-CONFIG_REFCOUNT_FULL=y
 CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_CMA=y
 CONFIG_MTD_CMDLINE_PARTS=y
