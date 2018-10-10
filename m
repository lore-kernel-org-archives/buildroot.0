From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:05:03 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
Message-ID: <20181010210503.6cd7a257@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 11:28:39 -0500, Matthew Weber wrote:

> > >  powerpc64le |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/7b79a5fa265e2387cab421e42b3c946562e4781b |  
> >
> >
> > checking for SELINUX... no
> > configure: error: SELinux selected but libselinux not found or too old
> >
> > We've been having this one for a while. Could some SELinux person
> > (Matt ? Adam ?) debug this ?  
> 
> I can take a look.  Before I dig to deep, I'd suggest applying the 2.8
> bump (http://patchwork.ozlabs.org/project/buildroot/list/?series=66983).
> I've finished runtime testing and it would be good to fix this and
> perform my testing on the latest.

I will have a look at this series and merge it. I was waiting for you
to test it, but it's indeed done since September 28, so it's time to
merge the series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
