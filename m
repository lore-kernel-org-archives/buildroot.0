From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 17:33:40 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add DTB support for ARM
 Versatile PB
In-Reply-To: <1448457599-29371-1-git-send-email-guillaume.delbergue@greensocs.com>
References: <1448457599-29371-1-git-send-email-guillaume.delbergue@greensocs.com>
Message-ID: <20160308173340.2d1c1cab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume Delbergue,

On Wed, 25 Nov 2015 14:19:59 +0100, Guillaume Delbergue wrote:
> Currently, without this option, you can't boot
> ARM Versatile PB with a DTB on QEMU. You get the
> following error (using earlyprintk):
> 
> Uncompressing Linux... done, booting the kernel.
> 
> Error: unrecognized/unsupported device tree compatible list:
> [ 'arm,versatile-pb' ]
> 
> Available machine support:
> 
> ID (hex)	NAME
> 00000183	ARM-Versatile PB
> 0000025e	ARM-Versatile AB
> 
> Please check your kernel config and/or bootloader.
> 
> Add CONFIG_MACH_VERSATILE_DT to support Versatile platform from device tree
> 
> Signed-off-by: Guillaume Delbergue <guillaume.delbergue@greensocs.com>

Finally, a slightly more complete commit implement DT based support for
ARM Versatile was pushed. See
https://git.busybox.net/buildroot/commit/?id=5825f1036a7dafcc69de3d84a57876ab0a1585cb

Consequently, I've marked your patch as "Superseded" in our patch
tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
