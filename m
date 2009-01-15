From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 23:47:33 +0100
Subject: [Buildroot]
	svn	commit:	trunk/buildroot/target/device/Atmel/at91bootstrap
In-Reply-To: <20090113170046.4820@gmx.net>
References: <20090111214416.5A26C76736@busybox.osuosl.org>
	<20090113170046.4820@gmx.net>
Message-ID: <1232059653.4757.78.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-13 klockan 18:00 +0100 skrev Matt Wood:
> Hi Ulf, I tried to compile at91bootstrap for NAND flash boot and I get the following error below...

> looks like it is not swithcing the default configuration to NAND flash.  

> If I try to build manually using "MEMORY=nandflash make at91sam9263ek_defconfig" it just copies the default config file and builds for dataflash.  Any ideas?
> 
> Thanks, Matt.

make at91sam9263nf_defconfig
make

works!

BR
Ulf Samuelsson
