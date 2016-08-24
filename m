From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 16:04:31 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <7ada4fd0-8ca3-c59f-bbfd-1ece1f636d73@mind.be>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <7ada4fd0-8ca3-c59f-bbfd-1ece1f636d73@mind.be>
Message-ID: <20160824160431.09a27761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 02:17:25 +0200, Arnout Vandecappelle wrote:

> On 23-08-16 14:47, Thomas Petazzoni wrote:
> > +N:	Arnout Vandecappelle <arnout@mind.be>
> > +F:	package/freescale-imx/firmware-imx/
> > +F:	package/freescale-imx/imx-lib/
> > +F:	package/gstreamer/gst-fsl-plugins/
> > +F:	package/moarvm/  
> 
>  This one was an accident: I took over the patch from Francois and slightly
> amended it, but then I committed with --reset-author (I have an alias for git
> commit --amend --reset-author -C HEAD). I actually have no idea what moarvm does :-)

ACK, I'm moving this package to Fran?ois.

> > +F:	package/owfs/
> > +F:	package/python-bottle/
> > +F:	package/sqlcipher/
> > +F:	package/stress/  
> 
>  All of these were really drive-by patches, I don't use any of them regularly.
> And in fact, I think that that will be the case for the majority of the packages
> that are listed now.

Shall I remove those packages from your name?

>  I'm afraid that maintaining the DEVELOPERS file (pruning dead e-mail addresses,
> removing people that are no longer interested in a particular package) is going
> to take more effort (i.e. more commits) than we actually gain by putting the
> developers in Cc.

Then I don't think you've been doing this "Analysis of autobuilder
results" enough times. It's a very long and boring work to look at those
autobuilder issues, analyze them quickly, and try to remember by head
which developer is the most appropriate for the different
packages/issues in order to Cc the relevant people.

So I completely disagree that maintaining this file will be more work
than putting the developers in Cc. Or at least, I can say that the work
will be spread on the shoulders of everyone (every developer submitting
a new package) instead of just being on my shoulders, when doing the
analysis of autobuilder results.

Or maybe you just volunteered to do the analysis of the autobuilder
results ? :-)

>  So for this initial version, I'd suggest keeping just the people that we know
> are active. Basically the people who have responded to this patch :-) And then
> in the contributing documentation, invite people to also update the DEVELOPERS
> file with their entry.

I also completely disagree with this. Keeping only the people that we
know are active would be _entirely_ useless. The people that we know
are active... well they are already active, so there's little point
Cc'ing them some additional e-mails: they already look at the
autobuilder issues regularly, they fix their own packages, and even
packages submitted by others, etc.

The whole point of this DEVELOPERS file is to increase the set of
developers who help in fixing the autobuilder issues, and in reviewing
new patches coming in that touch packages they know about.

By adding a large initial set of developers, even people who are rarely
active, we let those people know that we need their help to continue
maintain the packages they contributed. In the best case, since they
will receive a direct e-mail, they will notice, and help us. In the
worst case, they will ignore the e-mail or maybe better let us know
they are no longer interested in Buildroot (in which case we can decide
what to do with the problematic package).

So having a minimal DEVELOPERS file would be pretty much entirely
against the point of having it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
