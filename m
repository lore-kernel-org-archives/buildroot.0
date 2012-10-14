From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 15:52:52 +0200
Subject: [Buildroot] [PATCH] pkg-avail: make it work without stgit
In-Reply-To: <201210141533.54869.yann.morin.1998@free.fr>
References: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201210141533.54869.yann.morin.1998@free.fr>
Message-ID: <20121014155252.744715ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 14 Oct 2012 15:33:54 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On Sunday 14 October 2012 Thomas Petazzoni wrote:
> > In order to make this script usable by more developers, make it work
> > without stgit. It supports a --mode=stgit option or a --mode=git
> > option. When using --mode=stgit, it will preserve its existing
> > behavior, when using --mode=git, it will simply make git commits
> > without fuzzing needlessly with stgit.
> 
> You are right. This script should not depend on anything else than git.
> 
> That I use stgit behind the hood, when it is not a required tool imposed
> by upstream, is my problem, and should be no concern for upstream.

Well, you're the one who primarily uses this script to generate the
patches, and you'll be the one who will ultimately submit those
patches, so it sounds kind of natural that the script is adapted to
your workflow.

That said, I also wanted to be able to test your script, so I've just
adapted it to my own workflow. Since the modifications are fairly
trivial, I just thought I would share them.

> I use stgit because I like the patch-queue semantic better, and I find it
> much easier to work with, than the rebase semantic.
> 
> Also, what I am interested in, is getting changes upstream; that's my goal.
> I am not interested in learning how to use *git* per-se: it is just a tool
> to achieve that goal. If I can achieve the exact same goal by using the
> much simpler stgit, then I'll use that, even if git is more powerful.
> 
> And no, I never used quilt before. And no, I am not suffering of using
> stgit (quite the opposite, to be true). ;-)

No problem :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
