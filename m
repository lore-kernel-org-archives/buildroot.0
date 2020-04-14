From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Apr 2020 07:36:04 +0200
Subject: [Buildroot] [PATCH v2 1/2] Strip binaries in the rootfs
 creation instead of in target-finalize
In-Reply-To: <CAJ4jsae5MWs3GjaPvz57HOiJN=+Lf1dGw0HdAN0nVpm7RsoYfA@mail.gmail.com>
References: <20191001013654.22298-1-unixmania@gmail.com>
 <20191001013654.22298-2-unixmania@gmail.com>
 <20200413160247.6e8ee01b@windsurf.home>
 <CAJ4jsae5MWs3GjaPvz57HOiJN=+Lf1dGw0HdAN0nVpm7RsoYfA@mail.gmail.com>
Message-ID: <20200414073604.5f2fc158@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 13 Apr 2020 20:41:11 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > There's been feedback from both Yann and me on this patch, and both of
> > us think this is not the approach we want to take. Instead, we'd rather
> > see everything installed to STAGING_DIR as the way of fixing the
> > original issue.
> >
> > So I've marked both patches as Rejected in patchwork. Of course, if
> > other people disagree with this decision, we can always revisit and
> > rediscuss the matter.  
> 
> Just to remind you, the problem was reported two and a half years ago
> and the situation is still the same. Perfect is the enemy of good and
> later easily becomes never. Anyway, your project, your rules.

Why do you have to be so aggressive immediately ? Don't you have in
your palette of expression, some intermediate feelings, where you can
express concern and possibly frustration, without the agression ? Be
constructive instead of aggressive ?

It is deeply annoying that we can never say anything about your patches
and the approach you're taking without getting back a missile. This is
not how open-source works. We discuss, understand each others concerns,
find good trade-offs and make progress.

Have you read our concerns ? As far as I can see, your only reply was
to make it optional, which really only makes the whole thing even more
complicated.

I would really like to build a more constructive and collaborative work
relationship with you. You are always sending very good and valuable
contributions of high-quality, but there's a total impossibility of
discussing them if we have some fundamental concerns about them. All of
us maintainers always fear to reply negatively to one of your
contributions, because we know we are going to get back an aggression.
This is not how it should work. This is not why we all want to
contribute together to the same project.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
