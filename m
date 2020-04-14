From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 14 Apr 2020 07:46:50 -0300
Subject: [Buildroot] [PATCH v2 1/2] Strip binaries in the rootfs
 creation instead of in target-finalize
In-Reply-To: <20200414073604.5f2fc158@windsurf.home>
References: <20191001013654.22298-1-unixmania@gmail.com>
 <20191001013654.22298-2-unixmania@gmail.com>
 <20200413160247.6e8ee01b@windsurf.home>
 <CAJ4jsae5MWs3GjaPvz57HOiJN=+Lf1dGw0HdAN0nVpm7RsoYfA@mail.gmail.com>
 <20200414073604.5f2fc158@windsurf.home>
Message-ID: <CAJ4jsadzQELders8gEGFK8_kvdAnchzvGOre3_ppBwRvkTO4RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ing Tue, Apr 14, 2020 at 2:36 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Mon, 13 Apr 2020 20:41:11 -0300
> Carlos Santos <unixmania@gmail.com> wrote:
>
> > > There's been feedback from both Yann and me on this patch, and both of
> > > us think this is not the approach we want to take. Instead, we'd rather
> > > see everything installed to STAGING_DIR as the way of fixing the
> > > original issue.
> > >
> > > So I've marked both patches as Rejected in patchwork. Of course, if
> > > other people disagree with this decision, we can always revisit and
> > > rediscuss the matter.
> >
> > Just to remind you, the problem was reported two and a half years ago
> > and the situation is still the same. Perfect is the enemy of good and
> > later easily becomes never. Anyway, your project, your rules.

---8<---
> Have you read our concerns ? As far as I can see, your only reply was
> to make it optional, which really only makes the whole thing even more
> complicated.
---8<---

I have read the concerns. They sound reasonable but at the same time
there was an assumption (or promise) that the problem would vanish
once the dichotomy between staging/ and target/ be eliminated. Fair
enough, but no ETA was provided and the fact that the problem still
exists should be an alert about how difficult the solution is.

So two questions must be answered:

1. Is the problem reported by Ciro Santilli in bug 10386 real? If the
answer is "no", there's nothing else to argue about. Otherwise, jump
to question 2.

2. Is anybody able to estimate how long it will take to provide a solution?

-- 
Carlos Santos <unixmania@gmail.com>
