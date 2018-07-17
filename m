From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 17 Jul 2018 12:27:14 +0000
Subject: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
In-Reply-To: <4881796E12491D4BB15146FE0209CE646811505D@DE02WEMBXB.internal.synopsys.com>
References: <20180716213010.29310-1-romain.naour@gmail.com>
 <20180717120806.5be54c85@windsurf>
 <0d2afb3c-fe85-057a-4ad3-5744eb397d6e@smile.fr>
 <20180717133600.23398581@windsurf>
 <2c95c035-f85d-6a5c-2a75-658498800b8e@smile.fr>
 <4881796E12491D4BB15146FE0209CE646811505D@DE02WEMBXB.internal.synopsys.com>
Message-ID: <4881796E12491D4BB15146FE0209CE64681150AB@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Thomas,

> -----Original Message-----
> From: Alexey Brodkin
> Sent: Tuesday, July 17, 2018 3:16 PM
> To: 'Romain Naour' <romain.naour@smile.fr>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Romain Naour <romain.naour@gmail.com>; buildroot at buildroot.org; Christophe PRIOUZEAU <christophe.priouzeau@st.com>
> Subject: RE: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
> 
> Hi Romain, Thomas,
> 
> > -----Original Message-----
> > From: Romain Naour [mailto:romain.naour at smile.fr]
> > Sent: Tuesday, July 17, 2018 3:01 PM
> > To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Romain Naour <romain.naour@gmail.com>; buildroot at buildroot.org; Alexey Brodkin <Alexey.Brodkin@synopsys.com>;
> > Christophe PRIOUZEAU <christophe.priouzeau@st.com>
> > Subject: Re: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
> 
> [snip]
> 
> > >>> Also, I'm surprised that we still have all those ARC binutils patches,
> > >>> which should have been upstream. Could you get in touch with the
> > >>> Synopsys guys and see what's going on with those patches ?
> > >>
> > >> I'm adding Alexey in Cc :)
> 
> Unfortunately we decided not to push our recent changes to upstream
> due to observed regressions. The plain is to fix those regressions and
> submit "more correct" patches upstream.
> 
> Still the patches in question are a part of our "reference" toolchain
> and really required for building glibc for ARC so let's keep them for now
> as they are and hope we'll get them or their equivalents merged in 2.32.
> 
> That said it looks like in Buildroot we'll need to have 2 copies of those patches
> In 2.30 and 2.31 folder. Care to do that right now or I'll do it a bit later?

I didn't realize all is done already as I didn't see "arc" prefix in patch names.
So nothing to be done here. Thanks for taking care about our stuff.

-Alexey
