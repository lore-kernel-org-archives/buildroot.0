From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 07:32:21 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150306104010.76c71f6b@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>	<20150305232946.3620697e@free-electrons.com>	<54F8F0AC.8030707@zacarias.com.ar>	<20150306094008.7baf8c91@free-electrons.com>	<54F96D83.4010304@zacarias.com.ar>	<20150306102632.20dff6f7@free-electrons.com>	<54F974C3.2020509@zacarias.com.ar>
 <20150306104010.76c71f6b@free-electrons.com>
Message-ID: <54F98235.7030509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 06:40 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Fri, 06 Mar 2015 06:34:59 -0300, Gustavo Zacarias wrote:
> 
>>> I'd say readability. Renaming patches is clearly separated from .mk
>>> changes. In the case of your Samba 4.2 bump, the changes within the .mk
>>> file are mixed between bump-related changes, and indentation-related
>>> changes, and this is what bothers me.
>>
>> It doesn't break any bisectability so what's the problem, you don't like
>> a patch that changes too many things at once?
> 
> Exactly. I'm surprised you even ask, separate logical changes is just
> the 101 of open-source contribution in many projects. See
> http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L74
> for example.

Well i'd say the same applies to trivial/redundant stuff, like "hey
bump" + "hey hash" and you never complain with that aspect.
Style changes aren't usually very readable in diff format, so why not
make it part of a major bump? You'll have to re-read the full package
anyway for any QA you do.

> I don't quite understand your feeling here. What I'm asking you to do
> is something we ask to *all* contributors, including newcomers who have
> never contributed a single patch to Buildroot. Why would we have more
> relaxed/special rules for long-term contributors like you ?

FYI that's a linux kernel rule, it's not how every project out there
works. Life isn't just the linux kernel.

> If I was annoying you with something unusual, which I never bother
> other people with, I would understand. But here I'm just asking a very
> basic thing, which I also ask to every other contributor.

Sorry to nitpick here, but if we weren't changing little bits of style
all the time then we'd have more time for really cool stuff, and that
bothers me.
My feeling is that lately the patchflow is getting slower, and i'm not
talking about my patches, those usually get applied quickly because
they're, bluntly speaking, stupid patches.
And they're stupid because i don't feel any support/interest/whatever in
putting any serious effort in doing anything cool, because i feel
intertia in getting real advancement in some areas.
When you ask "why would we have more relaxed/special rules for long-term
contributors like you?" it sounds very detached to me - kind of saying
contributors don't matter.
It doesn't mean you should have special rules, but bringing it up that
way isn't nice IMO.
And, for me personally, it just makes me

So, one time offer with no strings attached: if you don't want me around
just tell me, i think we are all adults and i'll just move to doing
something elsewhere with my free time where i feel more welcome/appreciated.

>> One thing is when you say "typo" which well, yes, it's a typo and it's
>> fine to correct it.
> 
> Sorry I did not understand this part.

It means that i'm not angry/mad at every comment you make in case you
got that impression.

> Anyway, I'll take care of doing the split of the Samba 4.2 patch and
> I'll apply. I would have expected a bit more help and understanding from
> a long term contributor such as you.

Same goes both ways FYI (understanding).
I was going to say i'll do it myself because of a borderline failure
that needs fixing that my autobuilder caught, but you already did it so
i'll send a followup patch to fix that.
Regards.
