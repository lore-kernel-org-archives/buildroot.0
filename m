From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 15 Jul 2019 21:55:22 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH v4 15/15] package/gcc:
 enable gcc 9.1 for ork1 (openrisc)
In-Reply-To: <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
Message-ID: <CY4PR1201MB0120060693F61271D06946F0A1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Sunday, July 14, 2019 12:24 AM
> To: Giulio Benetti <giulio.benetti@micronovasrl.com>; buildroot at buildroot.org; arc-
> buildroot at synopsys.com; Guo Ren <ren_guo@c-sky.com>
> Cc: Yann E . MORIN <yann.morin.1998@free.fr>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Romain
> Naour <romain.naour@gmail.com>; Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Subject: Re: [arc-buildroot] [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for ork1
> (openrisc)
> 
> 
> 
> On 20/06/2019 12:07, Giulio Benetti wrote:
> > openrisc support has been added with gcc 9.1.
> > Keep for now the old gcc 5 fork for ork1.
> 
>  So, when will we remove this?
> 
>  Same for ARC (GCC 8.x fork) and C-SKY (GCC 6.x fork): they are available in
> GCC9, do we need to keep those old forks?

ARC support in GCC 9.x & Binutils 2.32 is very solid so we may even try to use it by default for ARC.

As for arc-xxxx.yy forks I'd like to keep them for a couple of future BR releases
and if we see that vanilla GCC/Binutils work really good then forks may go avay.

Make sense?

-Alexey
