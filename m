From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 16:27:00 +0200
Subject: [Buildroot] [PATCH] configs/imx7ulp-evk: Add new config
In-Reply-To: <20180718120420.3a95fe87@windsurf>
References: <20180717172427.16814-1-marcelo.macedo@nxp.com>
 <20180718120420.3a95fe87@windsurf>
Message-ID: <20180810162700.3c03c73e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 12:04:20 +0200, Thomas Petazzoni wrote:

> > +Step 1 - Download the Cortex-M4 pre-compiled binary:
> > +
> > +	wget https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx7ulp-m4-demo-2.4.0.bin
> > +
> > +Step 2: Extract the example files:
> > +
> > +	$ chmod a+x imx7ulp-m4-demo-2.4.0.bin
> > +	$  ./imx7ulp-m4-demo-2.4.0.bin
> > +
> > +Step 3: Copy the imx7ulp_m4_demo.img binary to the FAT partion of MicroSD card.  
> 
> Shouldn't we instead create a Buildroot package that would
> download/extract/install this firmware image, and put it in the FAT
> partition ?

Fabio, do you have any comment about this ?

In the mean time, I'll mark the patch as Changes Requested.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
