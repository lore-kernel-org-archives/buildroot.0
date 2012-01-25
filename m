From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 25 Jan 2012 12:04:33 -0600
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <20120125135707.6ceb7e86@skate>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <20120125135707.6ceb7e86@skate>
Message-ID: <201201251204.35978.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed January 25 2012, Thomas Petazzoni wrote:
> Hello,
> 
> Le Wed, 25 Jan 2012 12:03:12 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> 
> > Some topics we could discuss:
> > 
> > - status of some things that were discussed on the previous BDD
> > -- send-patches
> > -- testing infrastructure
> > -- crosstool-ng integration
> > -- documentation migration
> > -- out-of-tree builds
> > -- website update
> > -- maintenance process / patchwork
> > -- relocatable toolchain
> > 
> > - things that may need further discussion:
> > -- license stuff (report generation, ...)
> > -- finalization of Acked-by / Signed-off-by / Reviewed-by discussion.
> > We talked about this before, but as far as I know there was no final
> > decision as to: we'll do it this way.
> > 

A suggestion which passed by on the OpenEmbedded M.L. recently that might
fit into that discussion:

On the 'Tested-by:' attribute (if used) then adding a classification of
what that testing covered or did not cover (whichever is most informative).
I.E:

Tested-by: J. Q. Public
Coverage: HP, PA-RISC only
or
Coverage-needed: World

Examples above are invented only to display the coverage attribute names.

Mike

> > - future directions for buildroot
> > -- deprecate customize package
> > -- ...
> > 
> > I'll let you know if I think of other things.
> 
> Sounds like a good start. However, I fear that on most topics, no much
> progress has been made since the Prague BDD. But this upcoming BDD will
> gather more developers, so probably we'll be able to spread the
> development effort a bit more, and it's good to make a status on items
> that were discussed in previous meetings.
> 
> Best regards,
> 
> Thomas
