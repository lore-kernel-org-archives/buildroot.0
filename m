From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:15:42 +0200
Subject: [Buildroot] [PATCH 1/1] libepoxy: bump to version 1.4.3
In-Reply-To: <20170814230653.GB14043@momiji>
References: <20170814172320.16984-1-aperez@igalia.com>
 <20170814213113.6187b327@windsurf> <20170814230653.GB14043@momiji>
Message-ID: <20170814221542.77518b99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 23:06:53 +0300, Adrian Perez de Castro wrote:

> > Since we're post -rc2 comes the question: do we want to apply this in
> > master (i.e to be part of the 2017.08 release) or in next.
> >
> > If it fixes a crash, we probably want it in master. But version bumps
> > are a bit frowned upon. How much differences are there between 1.4.1
> > and 1.4.3 ? Are they significant ? If they are significant, is it
> > possible to backport just the one patch that fixes the crash ?  
> 
> Good point. I would apply the patch as-is onto ?next?, and for the 2017.08
> branch it looks doable to pick just the patch that fixes the segfaults [1].
> I'll try and submit a patch which does just the latter.

Sounds good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
