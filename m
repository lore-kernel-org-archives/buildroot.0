From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 May 2019 14:05:05 +0000
Subject: [Buildroot] [PATCH 01/15] package/glibc/arc: fix build issue
 with gcc-9.1
In-Reply-To: <1aaf011e-be23-89a8-35ca-ecd2429b6b77@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-2-romain.naour@gmail.com> <20190506194049.GA6887@scaer>
 <CY4PR1201MB0120841C0FE2B612DCA380BCA1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <1aaf011e-be23-89a8-35ca-ecd2429b6b77@gmail.com>
Message-ID: <CY4PR1201MB012056D967087A23A169C81BA1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

> -----Original Message-----
> From: Romain Naour <romain.naour@gmail.com>
> Sent: Wednesday, May 8, 2019 4:28 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>; Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org; Evgeniy Didin <didin@synopsys.com>; Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com>
> Subject: Re: [Buildroot] [PATCH 01/15] package/glibc/arc: fix build issue with gcc-9.1

[snip]
 
> > Now given we're about to cut ARC 2019.03 release of our tools which
> > among other things has Glibc rebased on upstream 2.29 version
> > this particular fix won't be required at all.
> >
> > So let us post ARC toolchain bump to 2019.03-RC1 ASAP.
> 
> We are close to -rc1, I don't think gcc 9.1 will be merged for this release so
> we have some time to merge ARC 2019.03 release.

Cool. We'll be sending arc-2019.03-rc1 either by the end of this week
or early next week so hopefully it gets in Buildroot's RC1.

And looking forward to rocking vanilla GCC 9.1 in BR starting from the
next release cycle.

-Alexey
