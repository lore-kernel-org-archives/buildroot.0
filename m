From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:58 +0200
Subject: [Buildroot] [PATCH 12/46] u-boot: remove patch for obsolete version
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f7f9443188e5788dcb5466eaae8257683d194ada.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...boot-2009.01-include_asm-avr32_io.h.patch.avr32 |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32

diff --git a/boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 b/boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
deleted file mode 100644
index 07cddb0..0000000
--- a/boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -urN u-boot-2009.01-rc3/include/asm-avr32/io.h u-boot-avr32//include/asm-avr32/io.h
---- u-boot-2009.01-rc3/include/asm-avr32/io.h	2009-01-18 21:37:48.000000000 +0100
-+++ u-boot-avr32//include/asm-avr32/io.h	2009-01-22 07:14:38.000000000 +0100
-@@ -125,9 +125,4 @@
- 
- }
- 
--static inline phys_addr_t virt_to_phys(void * vaddr)
--{
--	return (phys_addr_t)(vaddr);
--}
--
- #endif /* __ASM_AVR32_IO_H */
-- 
1.7.0.4
