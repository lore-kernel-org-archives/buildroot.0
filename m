From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 3 Sep 2020 18:44:39 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <20200903182409.6b337059@windsurf.home>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
Message-ID: <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il giorno gio 3 set 2020 alle ore 18:24 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> ha scritto:
>
> Hello Avraham,
>
> On Thu, 3 Sep 2020 18:44:27 +0300
> Avraham Shukron <avraham.shukron@gmail.com> wrote:
>
> > For what it's worth I think that the mail-based contribution process is
> > part of the problem.
> > With a decent Git server like GitHub/GitLab patches could be reviewed more
> > easily.
> > A CI pipeline could run tests that will give immediate feedback for any
> > pull request.
> > More importantly, it'll dramatically reduce the barrier for new and young
> > contributors.
>
> This has been discussed multiple times in the past in Buildroot, and in
> other open-source projects. There is even as we speak some pretty
> intense debate in the Linux kernel community about this.
>
> As we've seen from the discussion here, the Buildroot issue is not a
> lack of contribution, but a lack of review from trusted and experienced
> reviewers, and a lack of maintainers time. So while I'm all for new
> contributors and contributions, I don't think reducing the barrier is
> really key here. Also, I've always been skeptical about this statement
> that using Github reduces the barrier to entry. When you contribute to
> a project, is really sending a patch over e-mail the difficult part
> compared to understanding the code base, debugging the issue you've
> found or implementing the feature you wanted ? Really installing "git
> send-email" is a no-brainer straightforward process that is
> ridiculously easy even compared writing any single change in the code
> base with a decent commit message. Aren't we using this "reducing the
> barrier" argument a bit inappropriately here ?
>
> I believe I can say that all four Buildroot maintainers have a very
> strong preference for and a very optimized workflow to work with e-mail
> based patch submission and review.
>
> Somewhat related, recently a patch series I submitted last year to
> OpenWrt (which wasn't merged) got picked up by someone else, and
> re-submitted with new updates and fixes. Due to being the original
> author, I was in copy of all the Github discussion that took place. And
> I found it absolutely impossible and awful to follow the different
> revisions of the patch series, to which version of the patch series the
> comments were being made, etc.
>
> Perhaps for some people the Github pull request workflow makes sense,
> but I believe it's important to recognize and realize that there are
> also people for which this workflow doesn't make sense.

I strongly disagree here.
Having to write a patch changelog or download a series through the
awful patchwork website doesn't make any sense in 2020 (or using any
other commandline tool btw).

But it's not the point here. 419 patches are waiting to be reviewed,
action must be taken.

If you move to github/gitlab you can test each one of the patches even
before starting a review and mark as change requested without human
intervention.
That's what we want. With the ML this is simply impossible.
We should aim to review patches that are already checked, that we know
are compiling for all the architectures, that respect some rules in
the commit message.
Many commit messages have syntax and grammar errors just because we
don't run languagetool on them.
Doing so, the quality of the review would only rise because most of
the work is already done by the system.
Moreover, doing a review on github/gitlab on a sane web interface with
all the bell and whistles is way easier for the most of the normal
people out there who want to contribute.

> > Buildroot is all about using simple and familiar tools like make and
> > Kconfig, and I personally think that this principle should also be applied
> > to the contribution process and right now buildroot is one of the last
> > active open source projects using the mailing list approach.
>
> This is a very biased statement: there are still plenty of open-source
> projects that use e-mail based contribution workflow. I don't think we
> can call Linux or U-Boot "inactive" projects. Can we? :-)

We cannot, but if you look closer, they are ones of the few last
projects to be based on ML. Everyone else moved years ago.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
