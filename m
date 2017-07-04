From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Tue, 4 Jul 2017 09:37:07 +0200
Subject: [Buildroot] Syslinux: mbr build failure
In-Reply-To: <b2f7acb4-a732-92dc-445f-65834091bc9b@smile.fr>
References: <b2f7acb4-a732-92dc-445f-65834091bc9b@smile.fr>
Message-ID: <20170704093707.5984ba32@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 3 Jul 2017 21:43:54 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Hi Benoit,
> 
> There is another issue with syslinux since the build with the target
> toolchain is enabled.
> 
> syslinux-6.03/bios/core/../lzo/prepcore ldlinux.raw ldlinux.bin
> syslinux-6.03/bios/core/../lzo/prepcore: ldlinux.raw: write error
> 
> You should be able to reproduce with this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_steamroller=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_SYSLINUX=y
> BR2_TARGET_SYSLINUX_MBR=y
> 

Indeed, I can reproduce it. I'll try to have a look, thanks for
reporting !

Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170704/58e82313/attachment.asc>
