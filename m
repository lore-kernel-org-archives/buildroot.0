From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 02 Dec 2009 14:48:42 +0100
Subject: [Buildroot] [git tag 2009.11] update for 2009.11
In-Reply-To: <200912020737.14587.minimod@morethan.org> (Michael S. Zick's
	message of "Wed, 2 Dec 2009 07:37:12 -0600")
References: <20091201142204.3F954777B5@busybox.osuosl.org>
	<200912020701.52887.minimod@morethan.org>
	<873a3tv7ap.fsf@macbook.be.48ers.dk>
	<200912020737.14587.minimod@morethan.org>
Message-ID: <87y6lltrk5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 >> git checkout -b mybranch 2009.11

 Michael> Which kills community collaboration by turning the tree into
 Michael> number of users * number of local trees.

 Michael> Keep development on "head" if you wish - its your organization;

There has been various requests for bugfix releases in the past, and I
have stated that I don't have any problems with that, but I don't have
free cycles over to look through fixes and verify what needs to be
backported. If someone wants to step up and point out what should get
backported (and preferably does the backport/test), then I don't have
any issues with doing bugfix releases now and then.

So far noone has stepped up to the task.

The only demand I have is that the bugfix releases are STRICTLY for
bugfix / security issues.

 Michael> But I would recommend against locking out the community or
 Michael> splintering the community of users that want to see a working 2009.11.

 Michael> Achieve that end anyway you like, anyway that does not feel as if
 Michael> you are being insulted by the presumption that 2009.11 isn't perfectly
 Michael> error free.
 Michael> You are not being insulted, at least it was not my intent to insult.

I'm certainly not insulted.

 Michael> Just acknowledge there are two goals to be served here:
 Michael> The Buildroot maintainer's goal of an error free 2010.02 next year.
 Michael> The Buildroot user's goal of an error free 2009.11 for use **now**.

 Michael> Both can be archived if you don't splitter the support of 2009.11 
 Michael> into individual, local, user trees.

No matter how you set it up it takes effort. I don't have the time to do
a good job doing it, and so far noone has stepped up to help me doing
it - Will you?

If the bugfix work is done in the master branch, another branch in the
same tree or in another tree is just a minor technical detail.

-- 
Bye, Peter Korsgaard
