From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:34:51 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <559A8138.1010802@oliseo.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
 <559975AD.9030004@openwide.fr> <559A71C7.6080804@oliseo.fr>
 <20150706142647.6ad4d9fb@free-electrons.com>
 <559A8138.1010802@oliseo.fr>
Message-ID: <20150706153451.6565f875@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Again, please configure Thunderbird to make it wrap the very long lines
you write.

On Mon, 06 Jul 2015 15:23:04 +0200, Guillaume GARDET - Olis?o wrote:

> I do not claim to be a Buildroot maintainer/reviewer, even if I use it quite often (as a user) and train people to use it.
> I guess you understand we cannot be deeply involved in all open source / free software we contribute and submit patches is already a good contribution.
> Lots of people keep their patches and never send them upstream (not only for Buildroot).

That is indeed true, but there's not much more we can do I believe:
people interested in doing review/testing are doing as much of it as
they can. And trust me, a number of us are already spending a crazy
amount of time doing reviews.

> > Did you look at http://patchwork.ozlabs.org/project/buildroot/list/ ?
> 
> Yes. This is quite small compared to u-boot one:
> https://patchwork.ozlabs.org/project/uboot/list/

Is the U-Boot patchwork actually kept up-to-date with the patches that
have been merged? Because there are lots of patchwork instances that
exist, but that are not actively used by the project.

> > However, I do agree that we could do better to reply to patches in a
> > timely fashion. And to make this happen, we need *your* help to look at
> > patches from others.
> 
>  From my point of view, other projects, like u-boot, are more patch-friendly than Buildroot. Especially for new contributors.

I believe it really depends on the specific patch you send. Some new
contributors in Buildroot see their patch applied very quickly, some
other new contributors have a less satisfying experience.

> It could make sense to split Buildroot tree with maintainers for each part as it is done for the kernel or u-boot. It will avoid that people comments here and there.
> Another solution would be that 1 person/team flags a given patch and this person/team follows the patch submission flow. Maybe using the "Deleguate" flag in patchwork tool.

Yeah, we have been talking since a while to add the notion of
maintainers. But that would only work for existing packages. For new
packages it's quite difficult to see to which maintainer they would
belong to. And actually, the original author of the package should
become its maintainer, so there must anyway be someone else in the
Buildroot community reviewing the initial package.

See http://lists.busybox.net/pipermail/buildroot/2015-March/123032.html
for a patch series from Yann Morin proposing to add the notion of
maintainers.

> It may be fine to merge a patch even if it is not really perfect (e.g. does not offer all options) and then ask for updates/improvements. That way, it allows someone else to do the following patch.

I am all for that, and I tend to suggest this a lot. I have no problem
merging a package that does not offer all the possibilities, as long as
it at least explicitly disables the stuff it doesn't use (to avoid
misdetection).

> That said, do you really think that 5 versions (if I include the next one) is really something normal for a simple single package which does not affect others?
> I think 3 or 4 should be enough.

Impossible to make a rule on this. It depends on good/bad the initial
submission is, it depends how deep the review is done, it depends how
complex the package is.

But I agree that something relatively simple such as sdl2 shouldn't
take 5 months to get merged, that's for sure. Especially when the
submitter (you!) has been very active and responsive to take into
account the comments.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
