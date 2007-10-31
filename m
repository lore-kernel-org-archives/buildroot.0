From: Sushi Sensei <sinestado@gmail.com>
Date: Wed, 31 Oct 2007 13:42:03 -0300
Subject: [Buildroot] make error with Kismet even if not selected
In-Reply-To: <20071031131805.GA24567@cloud.net.au>
References: <20071030091652.2D272A67F9@busybox.net>
	<47273782.1000900@linuxtv.org> <13504645.post@talk.nabble.com>
	<20071031094341.GA20152@cloud.net.au> <20071031123656.GA438@zelow.no>
	<20071031131805.GA24567@cloud.net.au>
Message-ID: <a63ecaf0710310942n2cde2467n274f9cc8d10b4a8f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kismet try to compile DBUS integration even it is not included in
buildroot. The configure of package detect dbus in the main system,
not in the buildroot


2007/10/31, Hamish Moffatt <hamish@cloud.net.au>:
> On Wed, Oct 31, 2007 at 01:36:56PM +0100, Thomas Lundquist wrote:
> > On Wed, Oct 31, 2007 at 08:43:41PM +1100, Hamish Moffatt wrote:
> > >
> > > Noted in bug#1557, and my patch to fix it is in that report too.
> > >
> > > http://bugs.uclibc.org/view.php?id=1557
> >
> > My first commit and lousy quality control. I considered building
> > buildroot totally from scratch to se if that worked and I guess I should
> > have done that.
> >
> > (note to self; do that the next time.)
> >
> > I trust you (well, I can see it compiles at least.=) and patch applied.
>
> Bugs happen :)
>
> I happened to be doing a clean build today so I noticed it.
>
>
> cheers
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
