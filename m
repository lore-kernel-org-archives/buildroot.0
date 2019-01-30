From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jan 2019 21:29:38 +0100
Subject: [Buildroot] [PATCH 3/3] arch/mips: add (Marvell) Octeon III
 processor
In-Reply-To: <20190130201224.6555-3-patrickdepinguin@gmail.com>
References: <20190130201224.6555-1-patrickdepinguin@gmail.com>
 <20190130201224.6555-3-patrickdepinguin@gmail.com>
Message-ID: <20190130212938.11cdb74b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 30 Jan 2019 21:12:24 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> @@ -156,6 +163,7 @@ endchoice
>  config BR2_MIPS_SOFT_FLOAT
>  	bool "Use soft-float"
>  	default y

Not related directly to your patch, but MIPS related anyway: does it
make sense to default to soft-float ?

Wouldn't it better to have, like on ARM, an indication of which MIPS
cores support hardware floating point, and for those, default to using
hardware floating point ?

Thanks,

Thoams
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
