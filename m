From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu,  8 Nov 2007 03:03:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/elf2flt/elf2flt
Message-ID: <20071108110336.5401F30046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-08 03:03:35 -0800 (Thu, 08 Nov 2007)
New Revision: 20384

Log:
fix typo in elf2flt, thanks atle

Modified:
   trunk/buildroot/toolchain/elf2flt/elf2flt/elf2flt.c


Changeset:
Modified: trunk/buildroot/toolchain/elf2flt/elf2flt/elf2flt.c
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt/elf2flt.c	2007-11-08 01:12:38 UTC (rev 20383)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt/elf2flt.c	2007-11-08 11:03:35 UTC (rev 20384)
@@ -727,7 +727,7 @@
 					   give an error by default, and
 					   require `safe' relocations to be
 					   enumberated explicitly?).  */
-					goto good_32bit_resolve_reloc;
+					goto good_32bit_resolved_reloc;
 #endif
 				good_32bit_resolved_reloc:
 					if (bfd_big_endian (abs_bfd))
