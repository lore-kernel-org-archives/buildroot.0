From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:47:40 +0200
Subject: [Buildroot] [PATCH 1/2] libamcodec: New Package
In-Reply-To: <trinity-f61c5da6-a1c0-4fa7-83f2-52b0c53d0a9c-1465461483817@3capp-mailcom-bs11>
References: <20160609074644.4976-1-daggs@gmx.com>
 <20160609101839.381a8a56@free-electrons.com>
 <trinity-f61c5da6-a1c0-4fa7-83f2-52b0c53d0a9c-1465461483817@3capp-mailcom-bs11>
Message-ID: <20160609104740.58f55e49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 10:38:03 +0200, daggs wrote:

> > Has the license situation been resolved? I know you contacted upstream
> > about his. Any feedback?
> >   
> not yet, I can try to contact the dev in charge again.

Maybe add a:

LIBAMCODEC_LICENSE = Unclear

for the moment ?

> > > +# This package uses the M_PREFIX variable to construct the header and  
> > 
> > M_PREFIX or PREFIX
> > 
> > (you use PREFIX when building in the amcodec subdirectory)
> >   
> update the comment you mean?

Yes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
