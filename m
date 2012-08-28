From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 22:54:31 +0200
Subject: [Buildroot] [PATCH v2] barebox: fix license information
In-Reply-To: <503D0458.2020700@mind.be>
References: <1346138387-4344-1-git-send-email-spdawson@gmail.com>
 <20120828144426.483cd251@skate> <503D0458.2020700@mind.be>
Message-ID: <20120828225431.791a7aec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 19:48:08 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > Also, uboot.mk mentions that the license is GPLv2+, but the U-Boot
> > COPYING file says:
> >
> >    U-Boot is Free Software.  It is copyrighted by Wolfgang Denk and
> > many others who contributed code (see the actual source code for
> > details).  You can redistribute U-Boot and/or modify it under the
> > terms of version 2 of the GNU General Public License as published by
> > the Free Software Foundation.  Most of it can also be distributed,
> > at your option, under any later version of the GNU General Public
> > License -- see individual files for exceptions.
> >
> > So I guess that formally speaking U-Boot is GPLv2 only, and not GPLv2+.
> 
>   Given the large number of special cases we've encountered in the licensing
> support, I propose that we require one or two Acks on all licensing patches.
> And for new packages, the Acks should explicitly mention that it Acks the
> license information.  Failing the Acks, it could still be committed with
> a flag that it needs review, e.g. "GPLv2+ (needs review)".
> 
>   I think for the legal-info, we should really be conservative. Now that it
> exists, people will rely on it.  And if they rely on the wrong information,
> they could be in trouble.

Well, this means having to wait even more before being able to commit a
new package, I'm not sure I like to see more "bureaucracy" when it
comes to getting patches applied. Instead, getting things in movement
usually encourages people to react when something looks wrong. I.e, if
I had left out the barebox and u-boot patches from Simon, maybe nobody
would have commented on them... The fact that I took action by
committing them got the discussion started, we fixed the problems, and
we're good.

>   OTOH, the trouble would probably just be from your own legal department...
> Copyright holders who create complex, inconsistent licenses are very
> unlikely to try to enforce them.  And also the FSFE and similar organisations
> will just go for the obvious GPL violations.  So maybe I'm just being
> unnecessarily paranoid here...

Just like we don't provide any guarantees of the proper functioning of
Buildroot, we don't provide any guarantees of the correctness of the
license information. Now, of course, it's up to us as a community to
ensure that Buildroot works fine (it builds what you need) and has the
most correct licensing information as possible, but we're not trying to
provide 100% guarantees here.

"Linux is evolution, not intelligent design" :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
