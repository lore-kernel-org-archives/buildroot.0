From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 08:58:36 +0100
Subject: [Buildroot] configure buildroot to patch at91bootstrap
In-Reply-To: <1359502385.7974.197.camel@genx>
References: <1359491391.7974.190.camel@genx> <20130129214230.699afd2e@skate>
 <1359502385.7974.197.camel@genx>
Message-ID: <20130130085836.06d3a143@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Tue, 29 Jan 2013 15:33:05 -0800, John Stile wrote:

> > And set your patch directory here.
> There in lines the problem.
> I do not have:
>  Bootloaders
>  -> at91bootstrap
>  -> custom patch dir
> 
> My buildroot 2011.11 has:
>  Bootloaders  --->
>  [*] AT91 Bootstrap
>  (at91sam9g20ek) Bootstrap board
>  Boot Memory (NAND Flash)  --->
>  [ ] AT91 DataFlashBoot

Aaah, ok, it has been added after the Buildroot version you're
currently using.

> Is is possible to back-port the ability to patch at91bootstrap in
> 2011.11?

Yes, it should not be very complicated. The commit is
502465e435610b54b247b44cf61e7f0ba3d05a22.

> What release added it?

The commit was made on February, 2nd this year, so I suspect it was
part of 2012.02.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
