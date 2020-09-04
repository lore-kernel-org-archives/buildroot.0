From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 4 Sep 2020 21:36:25 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <87o8mlmoga.fsf@dell.be.48ers.dk>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il giorno ven 4 set 2020 alle ore 19:39 Peter Korsgaard
<peter@korsgaard.com> ha scritto:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
> Hi,
>
>  >> Perhaps for some people the Github pull request workflow makes sense,
>  >> but I believe it's important to recognize and realize that there are
>  >> also people for which this workflow doesn't make sense.
>
>  > I strongly disagree here.
>  > Having to write a patch changelog or download a series through the
>  > awful patchwork website doesn't make any sense in 2020 (or using any
>  > other commandline tool btw).
>
> Everyone is free to have their opinions, but arguing against command
> line tools when Buildroot is exactly built on a bunch of command line
> tools (make, shell, git, wget, ..) seems a bit counter productive.

I think it was clear I was referring to the way we manage patches via
ML/patchwork.
Doing a "git push" or "repo upload" to open a review request is
perfectly fine on my side.

>  > But it's not the point here. 419 patches are waiting to be reviewed,
>  > action must be taken.
>
> Agreed, please help review patches.

I do what I can, you do what you can, others do what they can, we
anyway have this big number of patches piling up.
I still think we should improve the workflow or we can continue to not
seeing the problem and hope someone will hop in sooner or later.
But this is only my pov.

I think that having an extensive CI that runs on each commit would
only benefit the work of the reviewers and the project as a whole.

>  > If you move to github/gitlab you can test each one of the patches even
>  > before starting a review and mark as change requested without human
>  > intervention.
>
> And why wouldn't you be able to do the same with the email based setup
> today? With tools like snowpatch (https://github.com/ruscur/snowpatch) or
> some basic scripting around the patchwork REST API nicely allows you to
> run (command line :P) tools whenever new patches are posted.

Honestly, we can do that, but you really want to setup and maintain a
complex infrastructure like that when we have gitlab with all the
features we need?
Do you really think we have the workforce to setup/hack/maintain that
custom infrastructure?
Buildroot is my OSS preferred project, but I don't think we have as
many people as the Linux kernel to implement a custom workflow.

Probably finding some sponsorship to hack the system, but again, why
disregard the sponsorship of gitlab that offers the full package for
free to OSS projects?

> The big problem is coming up with good automation and feedback that
> helps. check-package, test-pkg and our runtime tests are quite basic,
> but already a good start. Please help improving them.

They are not good because we don't care about continuous integration
on each review request.
If we do, it will be natural to invest time to setup all the best
checking rules we came up with, due to the fact that rules run on each
review request and we know the value of that.

>  >> > Buildroot is all about using simple and familiar tools like make and
>  >> > Kconfig, and I personally think that this principle should also be applied
>  >> > to the contribution process and right now buildroot is one of the last
>  >> > active open source projects using the mailing list approach.
>  >>
>  >> This is a very biased statement: there are still plenty of open-source
>  >> projects that use e-mail based contribution workflow. I don't think we
>  >> can call Linux or U-Boot "inactive" projects. Can we? :-)
>
>  > We cannot, but if you look closer, they are ones of the few last
>  > projects to be based on ML. Everyone else moved years ago.
>
> Blanket statements like "Everone" aren't very helpful. Furthermore,
> projects are not created equal. In the majority of the projects I have
> worked on, I had to make U-Boot or Linux kernel modifications and
> contributions, but rarely on some random github project.

Probably is my impression only, but conservatively 80% of the commits
I do on oss projects are on gerrit, github or gitlab.

> Anyway, lets keep it constructive here and improve the tooling we have
> around the existing workflow rather some wild ideas of changing
> everything which is not going to fly.

Yeah, I know and it's sad it's not going to fly. We don't have the
workforce to do reviews, let's hope someone improve the tooling we
have.

I'm still of the idea that moving to a modern ready-made and
hassle-free CI/CD environment would only benefit the project as a
whole, spare some time on the maintainers and rise the contribution
quality.

I do really love Buildroot, trust me, really. I would only see it
growing and striking at a fast pace and for this reason, I think the
tooling is a very very big part of its success.

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
