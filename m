From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jul 2012 13:13:06 +0200
Subject: [Buildroot] syslinux fails to build
In-Reply-To: <CAJkQPOmE5CcY=sAp-+TmuYEov_QTSe1-qsqj8fRjtOQNvDoWnA@mail.gmail.com>
References: <CAJkQPOmE5CcY=sAp-+TmuYEov_QTSe1-qsqj8fRjtOQNvDoWnA@mail.gmail.com>
Message-ID: <20120704131306.46f9e3bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 4 Jul 2012 11:53:30 +0100,
Aras Vaichas <aras.vaichas@gmail.com> a ?crit :

> make[3]: Entering directory
> `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
> ./mk-lba-img lba.img
> ./mk-lba-img: 1: ./mk-lba-img: Syntax error: "(" unexpected
> make[3]: *** [lba.img] Error 2
> make[3]: Leaving directory
> `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory
> `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/aras/buildroot/buildroot/output/build/syslinux-4.04'
> make: *** [/home/aras/buildroot/buildroot/output/build/syslinux-4.04/.stamp_built]
> Error 2
> 
> Is this a known problem?

Not to my knowledge, but I don't use syslinux myself. The bump to 4.04
was done by Arnout Vandecappelle in January this year, so maybe he will
comment on this.

> 
> I bumped the version to 4.05 but compilation fails. I researched the
> problem and found a patch that makes the build work:
> 
> http://web.archiveorange.com/archive/v/mwjwm6LzqZy83B2DDQIJ
> 
> Shall I submit a patch for:
> 
> * the bump to 4.05,
> * the patch to make 4.05 compile (which would be a copy of the patch
> from Geert Stappers) ?

Yes, please submit a patch doing both.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
