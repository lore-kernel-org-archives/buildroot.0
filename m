From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 15:42:24 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v4 5/9] boot/arm-trusted-firmware:
 introduce two new options
In-Reply-To: <DM6PR01MB58491DFF606B05CFFFD84A01F3190@DM6PR01MB5849.prod.exchangelabs.com>
References: <DM6PR01MB58491DFF606B05CFFFD84A01F3190@DM6PR01MB5849.prod.exchangelabs.com>
Message-ID: <20200210154224.70a9d5ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 14:30:13 +0000
"Gervais, Francois" <FGervais@distech-controls.com> wrote:

> Somebody reported a problem with my patch last week. I'm still investigating with
> him but it seems that the qstrip wrapping might be required which
> 05b8c7da6de863561d66717735a4870f2766454c is missing.

Indeed, a $(call qstrip,...) is missing, it should be added.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
