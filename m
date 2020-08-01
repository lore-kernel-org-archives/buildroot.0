From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Sat, 01 Aug 2020 10:05:22 +0200
Subject: [Buildroot] [PATCH 00/15] Improve SELinux support
In-Reply-To: <CAFSsvmrU12Q9p=A0MmAWeK3dScyn4RSQY=69MJD1GcCZ0Bb_tA@mail.gmail.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <CAFSsvmrU12Q9p=A0MmAWeK3dScyn4RSQY=69MJD1GcCZ0Bb_tA@mail.gmail.com>
Message-ID: <159626912240.1725162.11983986970590198052@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Quoting Adam Duskett (2020-07-31 19:08:12)
> On Fri, Jul 31, 2020 at 3:15 AM Antoine Tenart
> <antoine.tenart@bootlin.com> wrote:
> >
> > - Override the location of the refpolicy source and all of the above
> >   mechanisms, as when designing a fully custom system, one could want to
> >   provide a fully custom SELinux policy.
> 
> Any chance of supporting a modular policy in the future? :)

I don't have such plans for now, but if someone wants to tackle this I
believe it should be doable.

Out of curiosity, what would be the use case of having a modular policy
on a Buildroot generated image where packages can't be installed at
runtime?

> > Finally, the documentation is updated in patch 15 to explain how to use
> > SELinux within Buildroot.
> >
> Perhaps a test-case would be in order as well?

Yes, I'll send another series with an example qemu selinux defconfig and
new SELinux tests after this one.

> Overall, this is a wonderful, long-needed patch series of which I am
> incredibly excited to review!

Thanks!
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
