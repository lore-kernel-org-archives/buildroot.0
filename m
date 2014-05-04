From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 May 2014 13:18:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-03
In-Reply-To: <20140504092054.GA3211@free.fr>
References: <20140504063006.941AA101544@stock.ovh.net>
 <20140504092054.GA3211@free.fr>
Message-ID: <20140504131841.3f90e9e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 4 May 2014 11:20:54 +0200, Yann E. MORIN wrote:

> On 2014-05-04 08:30 +0200, Thomas Petazzoni spake thusly:
> > Build statistics for 2014-05-03
> > ===============================
> > 
> >         success : 27 
> >        failures : 3  
> >        timeouts : 0  
> >           TOTAL : 30 
> 
> Woops.. Something went wrong with the autobiulders?

Yes and no :-) Peter's autobuilders are still working fine. But the
Free Electrons autobuilder machine has been migrated, so the builds
have stopped for now. The migration is over now, so I hope to be able
to restart the builds this afternoon.

The plus side of this is that the Free Electrons build server has been
upgraded: it has twice the amount of RAM it used to have (32 GB of RAM
now), and a much better I/O system (SAS 10k disks in RAID0 instead of
regular disks in RAID0).

> > Detail of failures
> > ===================
> > 
> >    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/ff485236e0de26da0bb93fa2a7b0ea7207acd502/
> 
> I've tried to reproduce that one, but it built fine here.
> 
> What is strange is that the error is reproducible: there are at least
> two build errors with the exact same message:
> 
>     collect2: error: ld terminated with signal 11 [Segmentation fault]
> 
> but it does not happen here, even in a Squeeze-32 chroot... :-(
> 
> IIRC, Gustavo was not able to rerproduce it either.

Ok. I'll try to have a look and reproduce the issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
