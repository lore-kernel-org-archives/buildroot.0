From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 22:56:04 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <CAFOYHZC34UUQvZ0rQWwsjMB-iCvWe7XLCR27LDgOMyzrRDZNhA@mail.gmail.com>
References: <20180818060019.8702120DE6@mail.bootlin.com>
 <20180818215603.04843f8d@windsurf>
 <CAFOYHZC34UUQvZ0rQWwsjMB-iCvWe7XLCR27LDgOMyzrRDZNhA@mail.gmail.com>
Message-ID: <20180818225604.23a0c55e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 08:40:55 +1200, Chris Packham wrote:

> > Not sure what is going on here, but it happens only on Hollis autobuilder:
> >
> >   http://autobuild.buildroot.net/?reason=micropython%
> >
> > Chris, perhaps you have an idea ?
> 
> I've tried reproducing this a few times with no luck. Initially I thought
> it was due to a newer gcc generating new warnings, but then I tried gcc 8
> and didn't see any issue.

It happens only on Hollis autobuilder, which has the peculiarity of
running an older RHEL6.5 distro, providing a gcc 4.4 host compiler, and
general old tools.

So it is probably in this direction that we should search, even if the
problem apparently occurs when building code for the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
