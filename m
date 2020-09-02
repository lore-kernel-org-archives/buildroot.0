From: Christian Stewart <christian@paral.in>
Date: Wed, 2 Sep 2020 14:51:45 -0700
Subject: [Buildroot] More maintainers
In-Reply-To: <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
Message-ID: <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Sep 2, 2020 at 1:11 PM Adam Duskett <aduskett@gmail.com> wrote:
> >  True. However, please consider that maybe the maintainers don't intentionally
> > ignore those patches. Even though in absolute terms maybe a lot of patches have
> > been reviewed, in relative terms it's not exactly great. Currently, for example,
> > 15 out of 400 patches in patchwork have a Reviewed-by tag. They simply slipped
> > through the cracks, because we tend to look at most recent patches first.
> >
> This ignores my other point which still stands. The maintainers
> historically always want to also
> review the patches individually, and thus demand the last word on all
> submitted patches.
>
> This process makes it pointless for anybody but maintainers to review
> patches because the
> reviewers feel outright ignored.

I understand how you feel here, however, in my experience patch
reviews from non-maintainers have often lead to me marking the series
as "Changes Requested" myself, and submit an additional revision later
on without any maintainers needing to look at it. It's always possible
for just about anyone to point out a problem with a patch, and for the
submitter to validate that that indeed is a problem. So there's
definitely value to the Reviewed-By. My understanding of what the
maintainers are trying to say here, is that they're looking to
prioritize which series they review based on how many people have
backed it with a Reviewed-By tag.

From watching the project and others, I've personally seen that it's
very valuable to have a core team of maintainers with a very
opinionated approach and process structure, because it builds trust
with the downstream userbase. And because Git is decentralized, we can
always run our own third-party forks with all sorts of experimental
patches applied. The primary Buildroot repository is the "gold
standard" in that sense.

Discoverability is a problem right now, there's too many patches and
no way to subscribe to a given series for further updates (similar to
Pull Requests on GitHub), unless the submitter happens to add you to
the CC list - which, by the way, usually happens if you add a review.

Today, probably the best approach is to hunt through the backlog
(sorted by reviewed-by priority order) and cherry-pick some of these
series into downstream, more "experimental" repositories. Then, once
they've been tested there, you can submit a Reviewed-By back upstream
to indicate that it was useful and worth merging more urgently.

> > > If the current maintainers want to have the last word, then there is
> > > no incentive for
> > > non-maintainers to review patches, as it is seen as a waste of time.

If a non-maintainer reviews a patch -> code quality increases ->
reviewed-by count increases -> priority increases on patch ->
maintainers see it sooner -> it gets merged sooner. "Last say" or not,
I don't really see a problem with maintainers having the authority to
impose their opinionated approach to patches & rewrite things as they
see fit.

I'm interested to hear everyone's thoughts on this: particularly, that
this is a decentralized process and we can have multiple downstreams
with testing patches applied & a wider userbase than a single
developer.

Best regards,
Christian Stewart
