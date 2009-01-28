From: David Anders <dave123_aml@yahoo.com>
Date: Wed, 28 Jan 2009 15:14:48 -0800 (PST)
Subject: [Buildroot] So what do we do about all the unmaintained boards?
In-Reply-To: <1233182567.4147.16.camel@elrond.atmel.com>
Message-ID: <242910.1644.qm@web54409.mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

LNODE80 can be removed

thanks
Dave Anders
AML



> VENDOR	BOARD		KERNEL
> AMD	Dbu1500		2.6.19.1
> ARM	AT91SAM9260	2.6.24					REMOVE?
> ARMLTD	Integrator926	2.6.22.9
> Atmel	Plenty		All are or will soon be 2.6.28
> Hitachi	MS7206SE01	No kernel config
> jp	q5		2.4.26/29/32				REMOVE?
> KWIKBYTE kb9202		2.6.24
> mips	malta		2.6.21.5
> Sharp	LNode80		2.4.26					REMOVE?
> Soekris	net4521/4801	2.4.29					REMOVE?
> Valka	v100sc2		No kernel config
> Via	epia-mii	2.6.11.5				REMOVE?
> x86	i386		2.6.21.5
> 
> The reason for removing the ARM directory, is that it does
> not make
> any sense to do a "generic ARM".
> 
> You might as well build an ARMLTD or an Atmel board,
> without
> the fancy stuff.
> There is no defconfig and the linux config builds an AT91.
> 
> 
> 
> 
> BR
> Ulf Samuelsson
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


      
