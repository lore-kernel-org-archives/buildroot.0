From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Sep 2013 19:54:13 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <523A448E.6010402@rftechnology.com.au>
References: <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate>
 <523906E4.8080404@rftechnology.com.au>
 <20130918220953.GA3557@free.fr>
 <523A448E.6010402@rftechnology.com.au>
Message-ID: <20130919175413.GB3317@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jason, All,

On 2013-09-19 10:25 +1000, Jason Rennie spake thusly:
> On 19/09/2013 8:09 AM, Yann E. MORIN wrote:
> >But consider this:
> >   - you use Buildroot to build a GPL package, which ends up on the
> >     target
> >
> >   - that package is GPL, so the GPL applies to that package
> >
> >   - section 3 of the GPL requires you provide the "scripts used to
> >     control compilation and installation of the executable."
> >
> >   - So you have two options:
> >     - come up with the instructions by yourself (by looking at how
> >       Buildroot does its stuff, for example), but it's not trivial;
> >     - or provide your Buildroot tree (and .config) since this is the
> >       easiest. Let's assume that's the way you go.
> >
> >   - so, since you are distributing Buildroot, you have to abide by its
> >     license. It happens that this license is the GPL, but it's just
> >     happenstance that it is the same license as your GPL package, above.
> >
> 
> Wouldn't the intent of the license suggest that this was talking about the
> makefiles/configure scripts/whatever that you need to actually build the
> executable? Rather than some metabuild script like buildroot? I'm guessing
> the clause is there to stop someone "complying" by giving you a bunch of .c
> and .h files but not providing you a meaningful way to get an executeable
> out the other end.
> 
> The understanding you are suggesting would seem to be like requiring that
> the automated build script that runs on a build server of an evening (which
> calls the make files, maybe runs some automated tests etc, basically an
> automated developer task) would need to be included to distribute the
> software.

No, I never said that [*].
I said doing so would make complying _much easier_.

And since we're speaking on the Buildroot ML, I'm assuming the build
system in question is Buildroot, not some weirdo internal and
proprietary build system.

> As I said IANAL and so perhaps that would be required but that would seem
> like a bug in the license at that point and the problem is the terms of the
> license needing review.

Well, what is important is the _spirit_ of the license, as much as the
_letter_ of the license is.

Now, I believe we've gone as far as our uninformed opinions would get
us, and we won't be able to cover all cases, so we can safely close this
subject for now. ;-)

I'll try to gather all of this thread in a patch against the manual later
next week, and will submit that back here for further discussion. Thanks
all of you for your very valuable inputs! :-)


[*] In fact, I even never said that you had to, or did not have to
    provide it. I just said providing it makes complying very easy.
    YMMV, as they use to say! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
