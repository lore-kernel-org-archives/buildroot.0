From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 11:57:05 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <fb74bf87-dfdf-5dc6-8612-9faa896ae6e4@mind.be>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
 <fb74bf87-dfdf-5dc6-8612-9faa896ae6e4@mind.be>
Message-ID: <20180613115705.43c5b5b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 13 Jun 2018 11:47:02 +0200, Arnout Vandecappelle wrote:

> >> I didn't want to write anything to this thread at first, but then I
> >> saw that what Trent wrote matches 100% what I was thinking when
> >> looking at the change.
> >>
> >> I'm very disappointed with the attitude displayed by the buildroot
> >> developers in this thread.  
> > 
> > I believe you are also very abrupt with this statement. For example, I
> > myself asked as a reply to Yann's proposal if there wasn't a backward
> > compatibility issue.  
> 
>  Thomas, you can't deny that, whatever your (and my) intention was in this
> thread, it clearly has the effect on (some) people that they think "the
> buildroot developers" are not paying attention to their needs.
> 
>  I don't know why that is or what we can do about it (without investing still
> more time in composing our mails), but the least we can do is acknowledge this
> situation.

I will have to read this specific thread again to see what could
communicate this feeling.

However, generally speaking, I do agree that we tend to push back on
people proposing to add more complexity to Buildroot, for the reasons
I've highlighted before. And I definitely understand that such regular
push back, or sometimes slowness to take a decision on specific topics
can be frustrating. I do completely acknowledge that.

However, this push back and/or slowness on topics that suggest changing
some core aspect of Buildroot or its complexity level is actually more
a feature than a bug. It is what allows to preserve Buildroot core
principles on the long run. The contributors pushing for a little bit
more complexity here only see a little bit more complexity in one
specific place. People who have been around for a much longer period of
time (I'm "celebrating" this year my 10th year contributing to
Buildroot, and Peter has been contributing for longer than that, etc.)
have a different perspective, as they see the overall complexity
increase, not just the specific complexity increase caused by one patch.

But, yes I acknowledge that we are reluctant to change, and sometimes
need a lot of convincing arguments to change our minds.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
