From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:45:05 +0200
Subject: [Buildroot] [PATCH 08/12] Add x-loader bootloader
In-Reply-To: <87ei1wli18.fsf@macbook.be.48ers.dk>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <a50f6419bfba04ed1c24b23be18752b12c951c7d.1310392269.git.thomas.petazzoni@free-electrons.com>
 <87ei1wli18.fsf@macbook.be.48ers.dk>
Message-ID: <20110711224505.66187ad5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 11 Jul 2011 21:43:47 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> A bit more info would be good. There seem to be quite a few xloader
> trees around. Is this the best choice for omap3, omap4, .. ?

I don't know. I have seen this gitorious tree recommended in multiple
places, but x-loader development is a big mess with no clear official
upstream location.

> This could be more explicit like BR2_cortex_a8 || BR2_cortex_a9 I
> believe.

Done.

> Perhaps we should add a custom git location option like for u-boot /
> linux.

Later ? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
