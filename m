From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 13:40:41 +0200
Subject: [Buildroot] [2/2] package/glibc: bump to version 2.28
In-Reply-To: <87tvnwnoc6.fsf@tkos.co.il>
References: <20180803181425.18106-2-romain.naour@gmail.com>
 <87tvnwnoc6.fsf@tkos.co.il>
Message-ID: <20180815134041.74b55316@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 09:19:53 +0300, Baruch Siach wrote:

> Romain Naour writes:
> > https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html  
> 
> This announcement says:
> 
>   GNU make 4.0 or later is now required to build glibc.
> 
> autobuilders now show that:
> 
>   http://autobuild.buildroot.net/?reason=glibc-glibc-2.28
> 
> Since glibc is a fundamental package, does that mean we need to bump the
> make version requirement to 4.0 (current requirement is 3.81)? Maybe
> build host-make on older hosts?

Building host-make on machines that don't have make >= 4.0 sounds like
a good approach to me. And of course, we only do this as a dependency
of glibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
