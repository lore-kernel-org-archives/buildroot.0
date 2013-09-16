From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 16 Sep 2013 15:43:13 +0000
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130914221613.GA3444@free.fr>
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639ACDED6@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] On Behalf Of Yann E. MORIN
> Sent: Saturday, September 14, 2013 5:16 PM

Everything you guys said here was sound, logical reasoning.  This is
what I believe to be the spirit of what *some* in the free software community
intended (though there are a few radicals out there which have taken it
down a different road).

<snip>
> > >Yes, but I believe BR2_EXTERNAL *is* a derived work of Buildroot, so as
> > >such should be licensed under a license compatible with BuildRoot's.

About this:  There was a BIG case here in the States within the last
two years.  Google vs. Sun Micro systems.  The argument was over the header
files of the language Java (if you already know this, sorry for the recap).
It was decided that an INTERFACE is not protected by _anything_.  So,
from a certain point of view, the *.mk files contain various variables
and then make a FUNCTION call back into the system.  This would negate there
being a "derived work" for anyone adding on an IP app to the build system.

However, you are dead-on about the GPL apps that may be built that way as
one would ABSOLUTELY have to release the build process with the binary.

So, whether this would work in courts across the globe, I have no idea.
Ethically speaking (and I'm big on ethics), I would not want to release IP
code that could _ONLY_ be built using BuildRoot, however, adding something
in that doesn't DEPEND on being built by BuildRoot is clearly okay by
our license and the GPL under which BuildRoot is released.

Now, as Yann has stated previously: the information above and 1.25USD will
buy you a Coke!

Andy
