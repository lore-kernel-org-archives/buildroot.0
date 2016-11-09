From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 12:08:21 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: at91sam9260eknf: update
 defconfig
In-Reply-To: <20161109103955.qgeomymgonuoyxu5@rfolt0960.corp.atmel.com>
References: <20161109065948.1851-1-ludovic.desroches@atmel.com>
 <20161109065948.1851-2-ludovic.desroches@atmel.com>
 <20161109073638.ozgbr5vy6gglznlx@tarshish>
 <20161109101009.l66iviomyfuit2t5@rfolt0960.corp.atmel.com>
 <20161109112550.36c1ec17@free-electrons.com>
 <20161109103955.qgeomymgonuoyxu5@rfolt0960.corp.atmel.com>
Message-ID: <20161109120821.3ee13355@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 11:39:55 +0100, Ludovic Desroches wrote:

> > If you are not able/willing to test those defconfigs, then we could
> > just as well remove them. But I'm not going to merge a defconfig that
> > doesn't comply with our policy of having a fixed kernel and a fixed
> > bootloader version.
> 
> Can I use a fixed version of the compiler too? It seems it makes sense
> because this defconfig was tested but is no more compiling.

This could be an option indeed (reverting to gcc 4.x instead of gcc
5.x). However, the fact that no-one is willing to test/maintain this
defconfig is a sign that nobody is interested in it. So I'd rather
remove it, than keep a defconfig that gets never updated, even when
there is a build issue.

So, options are clear:

 1. Remove the defconfig entirely.

 2. Update the defconfig in the proper way, minimally tested on HW.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
