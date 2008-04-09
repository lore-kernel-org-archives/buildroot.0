From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 9 Apr 2008 06:17:09 +0200
Subject: [Buildroot] Hi There
References: <200804081340.13053.buildroot.atmel.com@pollet.net><877if8jvjh.fsf@macbook.be.48ers.dk><012f01c899bf$242ab100$070514ac@atmel.com>
	<873apwggb0.fsf@macbook.be.48ers.dk>
Message-ID: <013101c89a01$e94531d0$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Ulf> On the U-Boot patch, pls try to push the patch at the u-boot mailing list.
> Ulf> After spending years in Limbo, the patching process of U-Boot is
> Ulf> progressing at a a rapid pace and if the patch is OK, you
> Ulf> should get it into U-boot in notime..
> 
> Talking about u-boot, what's the status of the avr32 patch? Can we
> bump the u-boot version to 1.3.2?
> 


The AVR32 has been fully integrated into U-Boot for quite some time
and I think there should be no reason to give any special consideration
when bumping versions.

It might be good to allow for several versions of U-Boot though,
if some release do break a board or architecture.

The reason for providing prepatched U-boot in the Atmel directory is the AT91.
The AT91 team failed to get even a reply when they submitted  patches, 
so they basically gave up.

Now, the U-Boot project has changed strategy and there is a significant number 
of "Custodians" and the AT91 team has been working with third parties which
are subitting patches to the Custodians on almost daily basis.

I hope the situation will stabilize and that the AT91 stuff can be merged in 
mainstream buildroot during the summer.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
