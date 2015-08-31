From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Aug 2015 16:42:45 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <CA+BsyQ6a=2Lt5Q8XGmT4EegWFnj1b6FeV_EU3KNRGUTXx5PCtg@mail.gmail.com>
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
 <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
 <20150821104622.3abb16d1@free-electrons.com>
 <CA+BsyQ6a=2Lt5Q8XGmT4EegWFnj1b6FeV_EU3KNRGUTXx5PCtg@mail.gmail.com>
Message-ID: <20150831164245.1a25a5a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Fri, 21 Aug 2015 12:38:33 +0100, Brendan Heading wrote:
> > Leaving things broken in the autobuilders is annoying. For two reasons:
> >
> >  1/ Due to this Busybox failure on SPARC, many SPARC builds abort at
> >     this point, and we don't see other SPARC failures.
> >
> >  2/ It leaves some "noise" in the build results, and due to this it's
> >     hard to distinguish the build failures that should be investigated
> >     from the ones that are already analyzed.
> 
> Understood. Would you like me to put together a "disable libtirpc on
> SPARC" patch then ?

I think we'll just ship 2015.08 with the SPARCv8 breakage on libtirpc.
I must admit I'm not sure what to do with SPARCv8. Should we simply
deprecate it, and if someone complain, ask that someone to help
maintaining the platform?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
