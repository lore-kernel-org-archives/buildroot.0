From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 21:45:34 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <20141021091626.24b530be@free-electrons.com>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>	<20141012171752.29414e94@free-electrons.com>	<543AD090.3000107@zacarias.com.ar>	<543EA87A.2050204@mind.be>	<543FCDD6.9070104@zacarias.com.ar>	<54419C9C.7050705@mind.be>	<5441BEDE.1000102@zacarias.com.ar>	<54441E9F.8080802@mind.be>	<20141019225451.3aa6176e@free-electrons.com>	<54446B1B.2090201@zacarias.com.ar>	<5445656E.9010404@mind.be>	<20141020231635.5e5e2cf8@free-electrons.com>	<54459072.6060003@zacarias.com.ar>
 <20141021091626.24b530be@free-electrons.com>
Message-ID: <5446B7DE.5050504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/14 09:16, Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 20 Oct 2014 19:45:06 -0300, Gustavo Zacarias wrote:
>
> >> Yes, it clearly matters. I'm a bit sad to see that this specific story
> >> has affected your motivation. However, on this story, you had your own
> >> idea, and basically rejected the comments that were made. That's not
> >> really the best way to push things forward: maybe doing a concession
> >> sometimes helps, and thanks to this concession, you might prove at a
> >> later point that people were wrong and you were right from the
> >> beginning :)
> >
> > The same can be said the opposite way don't you think?
>
> True in some way. But in another way, doing the concession on what gets
> merged means reducing the "quality" of what we merge. Is this really
> what we want? If something doesn't comply with the Buildroot coding
> style and/or principles, should we merge it just because it has been
> sitting there since one year?

 I wouldn't say it's really a matter of quality. We (or actually, the committers)
tend to be conservative when it comes to merging. In particular, if any controversy
exists over a patch, it just remains sitting in the queue.

 It could be debated whether this is a good thing. But it is the way we work at
the moment.

 But the end result that such controversial patches stay in patchwork for a long
time, nobody comments on them anymore, so the discussion essentially dies. And
then comes along a patchwork cleanup rush, and things get rejected.

 As you mention below w.r.t. the hashes, it's very well possible that a year later
the original idea does suddenly get accepted...


 Regards,
 Arnout

>
> > This patchset has been sitting for almost a year now with no action on
> > the counterproposal from anyone.
> > The likely outcome is that the feature will still be missing until the
> > next release cycle.
>
> I agree this isn't nice. But again, if there is a pending patch that
> doesn't satisfy a majority of developers, should we merge it simply
> because it has been pending for a long time? I'm sure you would agree
> that we should not merge such a patch, even if that means leaving the
> feature out of the tree for a while.
>
> > I won't make a concession on this because i really don't believe it's
> > the proper course of action, it's that simple, deal with it.
> > It's not that i'm stubborn, i've changed opinion in many occasions, and
> > i'm not seeking to "rub it off" - if i wanted to do so i could just say
> > "hashes" which i've proposed years ago with the idea being very much
> > rejected at the time - i'm not interested in that.
>
> I don't remember if I was pro or against hashes back at the time.
> Probably against, since when Yann proposed the patches, I was still a
> bit hesitant about this feature.
>
[snip]


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
