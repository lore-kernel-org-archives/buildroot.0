From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Thu, 3 Sep 2020 18:44:27 +0300
Subject: [Buildroot] More maintainers
In-Reply-To: <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
Message-ID: <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 3, 2020, 01:20 Christian Stewart <christian@paral.in> wrote:

> Discoverability is a problem right now, there's too many patches and
> no way to subscribe to a given series for further updates (similar to
> Pull Requests on GitHub), unless the submitter happens to add you to
> the CC list - which, by the way, usually happens if you add a review.
>
> Today, probably the best approach is to hunt through the backlog
> (sorted by reviewed-by priority order) and cherry-pick some of these
> series into downstream, more "experimental" repositories. Then, once
> they've been tested there, you can submit a Reviewed-By back upstream
> to indicate that it was useful and worth merging more urgently.
>

For what it's worth I think that the mail-based contribution process is
part of the problem.
With a decent Git server like GitHub/GitLab patches could be reviewed more
easily.
A CI pipeline could run tests that will give immediate feedback for any
pull request.
More importantly, it'll dramatically reduce the barrier for new and young
contributors.

Buildroot is all about using simple and familiar tools like make and
Kconfig, and I personally think that this principle should also be applied
to the contribution process and right now buildroot is one of the last
active open source projects using the mailing list approach.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200903/c57da135/attachment.html>
