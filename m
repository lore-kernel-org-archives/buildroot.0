From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 15:36:29 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <CA+wH294jcQSojPtHUyaYGmPZs6R5pGKyG1wF9vXTfmTVFEhH4Q@mail.gmail.com>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
 <20120720233136.GA25851@mail.sceen.net>
 <20120721145411.6e291ad2@skate>
 <20120721151730.GA2543@mail.sceen.net>
 <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
 <500F2AAE.6020107@mind.be>
 <CA+wH294jcQSojPtHUyaYGmPZs6R5pGKyG1wF9vXTfmTVFEhH4Q@mail.gmail.com>
Message-ID: <20120802153629.22d25126@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 2 Aug 2012 14:28:37 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> On 25 July 2012 00:07, Arnout Vandecappelle <arnout@mind.be> wrote:
> >  Bottom line: I'm all in favour of Richard's original patch
> > (except that foo-reconfigure should also reinstall foo, which
> > everybody seems to agree with).
> 
> So has this patch missed 2012.08, or might it still be included?

It has missed 2012.08, I haven't the time to get to it, and now that
-rc1 has been released, we don't accept such changes.

There was a fairly long backlog of patches to handle, and I only had
from July 13th to July 31th to try to catch up. I tried to merge things
fairly aggressively during that time, but didn't manage to merge
everything.

However, while we are in the process of preparing 2012.08, I will open
a 'next' branch in which I will accumulate the patches that will be
merged as soon as the 2012.11 development cycle open, at the end of
August/early September. Therefore, I am hoping to reduce even further
the backlog by merging stuff into the 'next' branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
