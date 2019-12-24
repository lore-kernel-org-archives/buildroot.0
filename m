From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:14:51 +0100
Subject: [Buildroot] [PATCH] [PATCH] package/tio: new package
In-Reply-To: <20191223055102.lfw56utpgqalw2we@sapphire.tkos.co.il>
References: <20191222221203.1990-1-sergio.prado@e-labworks.com>
 <20191223055102.lfw56utpgqalw2we@sapphire.tkos.co.il>
Message-ID: <20191224141451.521e9123@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 07:51:02 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > +TIO_LICENSE = GPLv2  
> 
> The LICENSE file has the "or any later version" language. Also, we prefer the 
> SPDX license identifiers. So "GPL-2.0+".

Fixed when applying.

> > +TIO_LICENSE_FILES = COPYING  
> 
> Should also add "LICENSE".

There was no file named "LICENSE" in the source code, so I'm not sure
what your suggestion was. Did you suggest to add README instead maybe ?

Thanks for the review, it's definitely a lot easier when a well-known
contributor like you has reviewed a patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
