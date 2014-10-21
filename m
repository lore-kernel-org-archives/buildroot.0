From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 09:16:26 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <54459072.6060003@zacarias.com.ar>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
 <543AD090.3000107@zacarias.com.ar> <543EA87A.2050204@mind.be>
 <543FCDD6.9070104@zacarias.com.ar> <54419C9C.7050705@mind.be>
 <5441BEDE.1000102@zacarias.com.ar> <54441E9F.8080802@mind.be>
 <20141019225451.3aa6176e@free-electrons.com>
 <54446B1B.2090201@zacarias.com.ar> <5445656E.9010404@mind.be>
 <20141020231635.5e5e2cf8@free-electrons.com>
 <54459072.6060003@zacarias.com.ar>
Message-ID: <20141021091626.24b530be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 19:45:06 -0300, Gustavo Zacarias wrote:

> > Yes, it clearly matters. I'm a bit sad to see that this specific story
> > has affected your motivation. However, on this story, you had your own
> > idea, and basically rejected the comments that were made. That's not
> > really the best way to push things forward: maybe doing a concession
> > sometimes helps, and thanks to this concession, you might prove at a
> > later point that people were wrong and you were right from the
> > beginning :)
> 
> The same can be said the opposite way don't you think?

True in some way. But in another way, doing the concession on what gets
merged means reducing the "quality" of what we merge. Is this really
what we want? If something doesn't comply with the Buildroot coding
style and/or principles, should we merge it just because it has been
sitting there since one year?

> This patchset has been sitting for almost a year now with no action on
> the counterproposal from anyone.
> The likely outcome is that the feature will still be missing until the
> next release cycle.

I agree this isn't nice. But again, if there is a pending patch that
doesn't satisfy a majority of developers, should we merge it simply
because it has been pending for a long time? I'm sure you would agree
that we should not merge such a patch, even if that means leaving the
feature out of the tree for a while.

> I won't make a concession on this because i really don't believe it's
> the proper course of action, it's that simple, deal with it.
> It's not that i'm stubborn, i've changed opinion in many occasions, and
> i'm not seeking to "rub it off" - if i wanted to do so i could just say
> "hashes" which i've proposed years ago with the idea being very much
> rejected at the time - i'm not interested in that.

I don't remember if I was pro or against hashes back at the time.
Probably against, since when Yann proposed the patches, I was still a
bit hesitant about this feature.

> It's dissapointing to just sum up commits doing banal stuff even if
> they're important, to then get the cold shoulder when what i feel are
> interesting or progressive ideas get delayed and/or rejected.
> My feeling is that i'm just wasting my time if i make any serious effort
> to improve things, so basically i give up.
> At this point i would have hoped that i've earned some trust with my
> technical choices, but it feels like not.
> That doesn't mean i want a blank check on decisions, don't get that
> interpretation out of it.

You've definitely earned a *lot* of trust, at least to my eyes, and I
believe to many of the other Buildroot developers, Peter included. When
I see a patch from Gustavo doing something on a package, I typically
merge it eyes closed, or only after a quick look at the patch (I never
do any testing of your patches, because I know they basically work).

Beyond this qemu stuff, can you list the patch series/things you've
tried to push and that haven't been accepted? I think it's good to
discuss what caused the frustration.

> In the end it's not the number of commits that count, that's not an
> indication of who's #1, #3 or anything, it may be fun but that's it.
> The momentum is what makes projects great.
> And mine wrt buildroot has been neutralized, i'll just care about my
> little ranch: no autobuild fixing except what i break, no improvements
> except for what i care, no ACKs, no Tested-bys, no #buildroot IRC, no
> opinions and so on.
> Time will tell if i feel like getting back to that or i'll just dial
> down the notch on general involvement permanently (there's a saying
> which i think is quite universal "never say never").
> Sometimes you win sometimes you lose, in both the project and personal
> levels.

Wow, I must say I'm truly shocked that things have reached this level.
This is definitely not where I'd like things to go: your contributions
are very very valuable, and I very often need to refer to you for many
questions/opinions/feedback on various things we're doing in Buildroot.

Would you still be willing to have a Google Hangout at some point this
week to discuss this?

Live discussion very often helps, and it will allow us to exchange our
point of views, and see what we can do to resolve things. At some
point, it would be really great to meet in person, because I believe
you may not realize how much the Buildroot developers value and
respect your contribution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
