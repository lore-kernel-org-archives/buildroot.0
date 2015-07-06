From: =?UTF-8?B?R3VpbGxhdW1lIEdBUkRFVCAtIE9saXPDqW8=?= <guillaume.gardet@oliseo.fr>
Date: Mon, 06 Jul 2015 15:23:04 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <20150706142647.6ad4d9fb@free-electrons.com>
References: <20150629222241.GF3669@free.fr>	<1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>	<559975AD.9030004@openwide.fr>	<559A71C7.6080804@oliseo.fr>
 <20150706142647.6ad4d9fb@free-electrons.com>
Message-ID: <559A8138.1010802@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/07/2015 14:26, Thomas Petazzoni a ?crit :
> Hello,
>
> On Mon, 06 Jul 2015 14:17:11 +0200, Guillaume GARDET - Olis?o wrote:
>
>> No, I won't. It is extra work for nothing. I think it is not so complicated to review only 2 files to add a new package. Splitting packages for u-boot or Linux kernel make sense most of the time, but, here, clearly no.
>> Buildroot maintainers/reviewers should send their comments from the 1st version, not 1 guy comments on V1, someone else on V2 etc., again the first guy for V3 on another part of the patch which was not commented the 1st time.
>>
>> I contribute to lots of open source / free software and contributing to Buildroot is really painful compared to other projects. So please, all send your comments at the same time.
>> For SDL2, please send your comments this week, and I will send a V5 next week fixing the remaining bits and if it does not fit to another guy again, I will stop sending patches to Buildroot.
>> Now, I understand better why some people are maintaining a buildroot fork instead of upstreaming their patches. So, please improve your patch submission/review process.
> Could you use an e-mail client that wraps lines at a reasonable length?
>
> Regarding the patch submission/review process, we merge tons and tons
> of patches all the time. However, it is true that we tend to merge
> patches from people who also help in reviewing patches from others. I
> don't think I've seen patch reviews/tests from you. It would definitely
> help in increasing the trust that the maintainers have in your patches,
> and therefore make them look at your patches faster.

I do not claim to be a Buildroot maintainer/reviewer, even if I use it quite often (as a user) and train people to use it.
I guess you understand we cannot be deeply involved in all open source / free software we contribute and submit patches is already a good contribution.
Lots of people keep their patches and never send them upstream (not only for Buildroot).

>
> Did you look at http://patchwork.ozlabs.org/project/buildroot/list/ ?

Yes. This is quite small compared to u-boot one:
https://patchwork.ozlabs.org/project/uboot/list/

> This is the complete list of pending patches we have, which as you can
> see is quite long. Your help is definitely welcome to reduce this list,
> by reviewing, testing and commenting patches from others.

I guess it is.
But as I wrote previously, it is not possible to be deeply involved in all open source projects we contribute.

>
> And if you think that the entire community can synchronize to send all
> the comments on the v1, then it clearly means that you have never
> contributed to the Linux kernel, or at least not significant patches.
> It is very common to get some comments on v1, then some other comments
> on v2 (from different persons, or even from the same person who
> realized some more issues). That's definitely not something you can
> expect from an open-source community.

It happens, yes, but not on every new patch version and the patches are generally much more complicated.

>
> However, I do agree that we could do better to reply to patches in a
> timely fashion. And to make this happen, we need *your* help to look at
> patches from others.

 From my point of view, other projects, like u-boot, are more patch-friendly than Buildroot. Especially for new contributors.
You cannot ask all patch senders to become reviewers or testers.

It could make sense to split Buildroot tree with maintainers for each part as it is done for the kernel or u-boot. It will avoid that people comments here and there.
Another solution would be that 1 person/team flags a given patch and this person/team follows the patch submission flow. Maybe using the "Deleguate" flag in patchwork tool.
It may be fine to merge a patch even if it is not really perfect (e.g. does not offer all options) and then ask for updates/improvements. That way, it allows someone else to do the following patch.

I write these to help you to improve your work flow, not just to say it is better elsewhere.


That said, do you really think that 5 versions (if I include the next one) is really something normal for a simple single package which does not affect others?
I think 3 or 4 should be enough.


Guillaume
