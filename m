From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 22:16:34 +0200
Subject: [Buildroot] [PATCH v4 1/4] Makefile: fix coding style
In-Reply-To: <535692CF.1040607@mind.be>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-2-git-send-email-fabio.porcedda@gmail.com>
 <20140416194215.7d3151fa@skate> <535692CF.1040607@mind.be>
Message-ID: <20140422221634.3da814b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 22 Apr 2014 18:03:27 +0200, Arnout Vandecappelle wrote:

> > To be honest, while I definitely value the change to harmonize the
> > coding style, such a large patch touching almost every line of the main
> > Makefile is a recipe for conflicts with many other patches. So I would
> > personally prefer to not apply this patch, and do the coding style
> > fixes progressively, as we make other changes to the main Makefile.
> 
>  I disagree. The entire patch does a single change to a single file
> almost mechanically. It's true that there is a risk of conflicts, but
> splitting up the patch doesn't reduce that risk. It's easy enough to try
> to apply and ask for a refresh if there is a conflict.

True.

>  Of course, currently it doesn't apply cleanly anymore because you
> delayed applying it, so I also can't re-Ack it.

Well, since April, 7th I was not the only one to have commit access,
and I believe I worked quite a lot to apply many other patches. So your
blame here is not really in order I believe :-)

Also, back when I made this comment, nobody had Acked the patch: only
after I made my comment Fabio realized that he had forgotten to include
your Acked-by from a previous version of the series (please read the
history of this patch at http://patchwork.ozlabs.org/patch/337436/).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
