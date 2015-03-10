From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 22:49:16 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F98235.7030509@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 06 Mar 2015 07:32:21 -0300")
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
 <54F974C3.2020509@zacarias.com.ar>
 <20150306104010.76c71f6b@free-electrons.com>
 <54F98235.7030509@zacarias.com.ar>
Message-ID: <87egowo74z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Exactly. I'm surprised you even ask, separate logical changes is just
 >> the 101 of open-source contribution in many projects. See
 >> http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L74
 >> for example.

 > Well i'd say the same applies to trivial/redundant stuff, like "hey
 > bump" + "hey hash" and you never complain with that aspect.
 > Style changes aren't usually very readable in diff format, so why not
 > make it part of a major bump? You'll have to re-read the full package
 > anyway for any QA you do.

Not if it is a pure style change as you can check with 'git diff -w'.


 >> I don't quite understand your feeling here. What I'm asking you to do
 >> is something we ask to *all* contributors, including newcomers who have
 >> never contributed a single patch to Buildroot. Why would we have more
 >> relaxed/special rules for long-term contributors like you ?

 > FYI that's a linux kernel rule, it's not how every project out there
 > works. Life isn't just the linux kernel.

Agreed, but we have adapted quite a bit of the same rules as the Linux
kernel (git, signed-off-by, review on mailing list, patchwork, single
maintainer, ..).


 >> If I was annoying you with something unusual, which I never bother
 >> other people with, I would understand. But here I'm just asking a very
 >> basic thing, which I also ask to every other contributor.

 > Sorry to nitpick here, but if we weren't changing little bits of style
 > all the time then we'd have more time for really cool stuff, and that
 > bothers me.
 > My feeling is that lately the patchflow is getting slower, and i'm not
 > talking about my patches, those usually get applied quickly because
 > they're, bluntly speaking, stupid patches.
 > And they're stupid because i don't feel any support/interest/whatever in
 > putting any serious effort in doing anything cool, because i feel
 > intertia in getting real advancement in some areas.

This is not true in absolute numbers (E.G. we keep on increasing the
number of changes in each release), but it may be true that Buildroot is
getting more mature / stable (and therefore in a sense boring).

I don't think it is really a problem if complicated / controversial
patches takes longer to get applied than simple version bumps, but if
they never get applied or atleast responded to then that is certainly a
problem.

As a maintainer it isn't always easy to make progress on that kind of
patches when:

- There's plenty of other patches waiting in patchwork
- Patches risk breaking stuff / cause maintenance issues down the road
- Nobody else have reviewed / acked those patches.

If I look in patchwork, I see very few patches having anything else than
0/0/0 in the acked-by/review-by/tested-by columns.

This is one of the reasons why we are doing the dev days, as we then
discuss some of these patch series.


 > So, one time offer with no strings attached: if you don't want me around
 > just tell me, i think we are all adults and i'll just move to doing
 > something elsewhere with my free time where i feel more welcome/appreciated.

I must say that I'm surprised by this statement and I wonder how come
you think Thomas or anybody else feels like that? I very much appreciate
your Buildroot contributions, and I'm sure everyone else does as well!

-- 
Bye, Peter Korsgaard
