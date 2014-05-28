From: Rohit Kumar <rkthebest@gmail.com>
Date: Wed, 28 May 2014 23:38:47 +0900
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
	for ARM1136
In-Reply-To: <20140528133323.4106f3d3@free-electrons.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
 <20140528095100.719c69ac@free-electrons.com>
 <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
 <20140528105311.43b2c178@free-electrons.com>
 <CABzetm3Lo_iRMEXa8p3N4_F6nODNPan2=4PzXuff1_eardyTtQ@mail.gmail.com>
 <20140528112027.6733e798@free-electrons.com>
 <CABzetm0XxJnPJJjvQWSm=DJusqMd4JNWDCeo56G2P2mPzxitXQ@mail.gmail.com>
 <20140528133323.4106f3d3@free-electrons.com>
Message-ID: <CABzetm1r05rv2y0NzN039R+bwznpYzfginXF7qC3S=QLq5HjAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,





On Wed, May 28, 2014 at 8:33 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Wed, 28 May 2014 19:21:37 +0900, Rohit Kumar wrote:
>
> > > I'll restart the build with BR2_arm1136jf_s_r0=y, which is the CPU core
> > > you selected.
> > >
> > it just doesnt builds with GCC compiler version 4.6
>
> Indeed, I can reproduce the same issue when using gcc 4.6 instead of
> gcc 4.7. That's weird because gcc 4.6 is supposed to support EABIhf, so
> I'm not sure what's going on here. More investigation is needed, for
> sure.
>
> so is this anything i can try right now to resolve the issue??


>  Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140528/fcaeb8ee/attachment.html>
