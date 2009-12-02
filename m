From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 2 Dec 2009 07:37:12 -0600
Subject: [Buildroot] [git tag 2009.11] update for 2009.11
In-Reply-To: <873a3tv7ap.fsf@macbook.be.48ers.dk>
References: <20091201142204.3F954777B5@busybox.osuosl.org>
	<200912020701.52887.minimod@morethan.org>
	<873a3tv7ap.fsf@macbook.be.48ers.dk>
Message-ID: <200912020737.14587.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 2 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> Would you please tag the repository with a 2010.02 branch tag?
> 
> Sorry, I prefer to branch for bugfix releases instead (if needed) - So
> that master is always where development is happening.
> 
>  Michael> That way users can continue to fix 2009.11 without being exposed
>  Michael> to the code-churn of producing 2010.02.
> 
> Just create a local branch from the 2009.11 tag:
> 
> git checkout -b mybranch 2009.11
> 

Which kills community collaboration by turning the tree into
number of users * number of local trees.

Keep development on "head" if you wish - its your organization;

But I would recommend against locking out the community or
splintering the community of users that want to see a working 2009.11.

Achieve that end anyway you like, anyway that does not feel as if
you are being insulted by the presumption that 2009.11 isn't perfectly
error free.
You are not being insulted, at least it was not my intent to insult.

Just acknowledge there are two goals to be served here:
The Buildroot maintainer's goal of an error free 2010.02 next year.
The Buildroot user's goal of an error free 2009.11 for use **now**.

Both can be archived if you don't splitter the support of 2009.11 
into individual, local, user trees.

Mike
>  Michael> The "release and move-on" type of organization really is not appropriate
>  Michael> for something as mission critical as the build system in use.
> 
>  Michael> Heck, after a decade, even kernel.org learned that lesson.  ;)
> 
> No they didn't. Linus' tree doesn't have branches, and stable (bugfix)
> releases are done from a completely different tree.
> 
