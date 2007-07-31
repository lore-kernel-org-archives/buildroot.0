From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 31 Jul 2007 21:56:09 +0200 (CEST)
Subject: [Buildroot] linux-2.6.21.5-003-atmel.1-avr32-updates.patch
	failes
In-Reply-To: <0707312150570.11633@somehost>
References: <0707312150570.11633@somehost>
Message-ID: <0707312154000.11633@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Preceeded by this:

Applying linux-2.6.21.5-002-lzma-vmlinuz.01.patch using plaintext:
patching file arch/i386/boot/compressed/Makefile
patching file scripts/gen_lzma_initramfs_list.sh
patching file arch/i386/boot/compressed/lzma_misc.c
patching file scripts/Makefile.lib

Applying linux-2.6.21.5-003-atmel.1-avr32-updates.patch using plaintext:
patching file MAINTAINERS
patching file Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej

On Tue, 31 Jul 2007, Cristian Ionescu-Idbohrn wrote:

> Patch failed!  Please fix linux-2.6.21.5-003-atmel.1-avr32-updates.patch!
> make: *** [buildroot/build_i486/linux-2.6.21.5/.patched] Error 1

Conflicts between linux-2.6.21.5-002-lzma-vmlinuz.01.patch and
linux-2.6.21.5-003-atmel.1-avr32-updates.patch?


Cheers,

-- 
Cristian
