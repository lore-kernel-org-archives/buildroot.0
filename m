From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:02:25 +0100
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: Check for a host
 python version >= 2.7
In-Reply-To: <CAFSsvmr1ab-hTwE7XpExMJWbPL0MzQK+eebjX2wGk3kgRpwEyw@mail.gmail.com>
References: <20181215202937.81372-1-aduskett@gmail.com>
 <871s6ibjz2.fsf@tkos.co.il>
 <CAFSsvmr1ab-hTwE7XpExMJWbPL0MzQK+eebjX2wGk3kgRpwEyw@mail.gmail.com>
Message-ID: <20181216160225.77cfc7da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 15:47:45 -0500, Adam Duskett wrote:

> On Sat, Dec 15, 2018 at 3:42 PM Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > Hi Adam,
> >
> > aduskett at gmail.com writes:  
> > > From: Adam Duskett <Aduskett@gmail.com>
> > >
> > > Older distributions such as CentOS6 come with python2.6, which causes build
> > > failures in packages such as host-libglib2 because they require python2.7 or
> > > above.  
> >
> > Any reference to glib requirements? autobuilder failures?
> >  
> Not that I can see. I am not sure if any of the autobuilders are using
> CentOS6, however
> I noticed the crash when I was using a CentOS6 Docker container and
> decided to do some
> due diligence. :)

Please explain in the commit log which glib version has this
requirement, and which specific build failure you got.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
