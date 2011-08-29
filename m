From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Mon, 29 Aug 2011 16:59:10 +0200
Subject: [Buildroot] [PATCH] git fetcher: do not remove the tree after
 initial clone
In-Reply-To: <20110829142344.2edcfd12@skate>
References: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
 <4E5B445F.5050603@lucaceresoli.net> <20110829142344.2edcfd12@skate>
Message-ID: <CALB96N=tS1DKyTgLs8WF6Gh_UYPjWUbiRFGx+FkTauCiDw7OmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lucas, Thomas,

On Mon, Aug 29, 2011 at 2:23 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> > Using BR for development has not been completely neglected anyway.
> > Recently, Thomas Petazzoni submitted a patch that would allow to use a
> > local directory to build the package. This is much different from using
> > git fetches, but is expected to serve the "use BR for development" use
> > case effectively.
> > You might want to test it and comment to the author. Here it is:
> > http://lists.busybox.net/pipermail/buildroot/2011-July/044479.html
>
> I still think that this local directory mechanism is a better solution.
>
> I have a new version of my patch set, which I hope to submit soon, at
> least when the 2011.11 development process will open (by the end of the
> month, so should be in the next few days).
>

i like the 'local directory' method as well, really much. but i still
believe that the 2 things are complementary..

i happen to use BR in a project using large git tree which are not close to
me, so I care about git fetch vs git clone.
on top of that there are many users that regularly make rebuild.

the way i see what i propose is *just* an optimization of how BR will use
git, not a new workflow. for those of us who use
BR for development, i fully agree that local method is a great addition.

fwiw, i am coming from OE which such a git clone/fetch optimization is
already implemented.

any reason why we can't have both?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110829/5426ef47/attachment.html>
