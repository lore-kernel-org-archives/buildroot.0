From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 23 Oct 2014 18:42:36 +0000
Subject: [Buildroot] Question about native tools.
In-Reply-To: <5449488C.4070901@vanguardiasur.com.ar>
References: <F9C551623D2CBB4C9488801D14F864C698E46BA4@ex-mb1.corp.adtran.com>
 <5449488C.4070901@vanguardiasur.com.ar>
Message-ID: <F9C551623D2CBB4C9488801D14F864C698E46CB3@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Ezequiel Garcia [mailto:ezequiel at vanguardiasur.com.ar]
> Sent: Thursday, October 23, 2014 1:27 PM
> To: ANDY KENNEDY; 'buildroot at busybox.net'
> Subject: Re: [Buildroot] Question about native tools.
> 
> 
> 
> On 10/23/2014 02:39 PM, ANDY KENNEDY wrote:
> > I have the need to build a cross-built native toolchain (basically a
> > Canadian Cross).  I also have had various people ask me (verbally, not
> > on lists) for a way to build a toolchain (including make, etc) for a
> > target.  Used to be that I would recommend BuildRoot as, prior to
> > 2013.08 (IIRC), this was a trivial thing to do through the menuconfig.
> >
> > Why was it decided to remove the support for the toolchain/build tools
> > on the target?
> >
> 
> Maybe this answers your question:
> 
> http://buildroot-busybox.2317881.n4.nabble.com/Open-question-remove-quot-toolchain-on-target-quot-
> option-td8832.html

Figures.  I missed that e-mail conversation.  We had been derailed on
our Linux project during that time frame and I was completely ignoring
the Linux lists to which I subscribe.

I see in that thread a vote to keep it and a vote to remove it.

So, given the split ballot, it was decided to remove it.

Looking through the older code, eg, gcc code, it doesn't look like
there was *that* much support required to keep it up.  I am
possibly over simplifying things, but I wonder why the toolchain
cannot be easily natively built?

Is it that difficult to cross-build gcc and binutils for a target?
Thinking back to when I have natively built a newer version of gcc
and binutils for my systems, it was as simple as ./configure &&
make.  Now, I understand that the build/host/target would need to
be set, but this doesn't seem that hard.  Am I over trivializing
this process?

Before Peter or Thomas asks, no I really do NOT have the time to
maintain this in BuildRoot (I'd have to give up sleeping entirely),
so, no, I don't want it bad enough to maintain it.  :))) I do,
however, want it bad enough for one of you to maintain it :))))!!

Andy
