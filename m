From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 12 Aug 2015 16:31:49 +0100
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
Message-ID: <CA+BsyQ5DRnaPbH6dDiPEGcxqckwHMUo3ckyoRkyp0iuWGc-OjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> My yesterday's U-Boot bootargs for my bootm was "console=/dev/ttyS0,115200n8 mem=32M initrd=0x02200000 rw root=/dev/ram0 rw eth=${ethaddr}
>
> The original bootargs was given by Marvell for booting from their USB storage device.

Tommy.

If I can ask a silly question .. the kernel configuration within your
buildroot .config is called:

../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9_armv7_le_uclibc_sfp_reduced_defconfig

This is normally the directory where *buildroot* configs are kept, and
the filename strongly implies that it's a buildroot config. However
this configuration option is supposed to denote the *kernel* config.

If so, it would cause the kernel to be built wrongly. Can you attach a
copy of this file ? Can you also attach a copy of your complete
buildroot .config, ie without pieces removed ?

Brendan
