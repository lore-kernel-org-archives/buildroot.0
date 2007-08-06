From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 6 Aug 2007 23:17:25 +0200
Subject: [Buildroot] [Patch] internal toolchain for avr32
References: <20070806083229.GB4699@firebird.dresden.micronet24.de>
	<20070806201256.GA7043@firebird.dresden.micronet24.de>
Message-ID: <03ac01c7d86f$47b54520$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Since my revision wasn't the latest, I didn't got the nice mud ulf
> created with his vendor-supplied toolchain. I'm sorry.
> 
> attached a patch that revert that misconfiguration.
> 
> @Ulf: Not everybody is happy about a vendor-supplied toolchain! So at
> least give everybody the chance to decide whether to use it or not.

Your patch does not give everyone a chance to use it or not.
It *removes* the possibility to use the vendor prepatched toolchain.

If you are keen on not downloading that toolchain, then
a proper patch to buildroot would put the AVR32 patches you generated 
on a server somewhere and then download the patch before applying to the gcc/binutils/gdb/uClibc.
Obviously, you would have to keep track of the development of the AVR32
toolchain and update when neccessary.

Best Regards
Ulf Samuelsson 
