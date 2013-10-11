From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 16:57:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-10-10
In-Reply-To: <CAAXf6LUAR7P6mEwFEoeCHMq0KX_8P3LQVQvte_VvN=OTCr9T=g@mail.gmail.com>
References: <20131011063009.335B352C1A0@lolut.humanoidz.org>
 <CAKAx1chC4oz0iJRed6_koLNiMR=HhOSF_K__DYGhvGZXa2UrNw@mail.gmail.com>
 <CAAXf6LWPcf3LSouCznvD_R=s33OL2SyidjFSob20k-PRGczWzg@mail.gmail.com>
 <20131011163133.7755b2c0@skate>
 <CAAXf6LUAR7P6mEwFEoeCHMq0KX_8P3LQVQvte_VvN=OTCr9T=g@mail.gmail.com>
Message-ID: <20131011165740.0ab665cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 11 Oct 2013 16:51:29 +0200, Thomas De Schampheleire wrote:

> > Should this be done only for the SuperH architecture? Only for the
> > affected external toolchains?
> 
> Not sure what the best approach is. Checking just for the architecture
> is the simplest.
> 
> Checking on the toolchain is complex:
> - for the Sourcery toolchains: the problem shows with the most recent
> SuperH toolchain we support at the moment, so I don't think it's worth
> trying to avoid -O2 on older toolchains than that.
> 
> - for other external, or internal toolchains, we can't predict whether
> the problem would show (I don't know which combinations of gcc, libc,
> ... are the killer)
> 
> What do you think?

Just do it for SuperH as a whole, with a nice comment on top of this
line. That's the easiest way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
