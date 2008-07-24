From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 13:38:33 +0200
Subject: [Buildroot] [PATCH 1/2] lsdldoom: new package lsdldoom
In-Reply-To: <1216706419.13039.6.camel@localhost>
References: <1216648539-19020-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<87r69nb17i.fsf@macbook.be.48ers.dk>
	<1216706419.13039.6.camel@localhost>
Message-ID: <1216899513.29392.12.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2008-07-22 at 08:00 +0200, Hans-Christian Egtvedt wrote:
> On Mon, 2008-07-21 at 19:23 +0200, Peter Korsgaard wrote:
> > >>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> > 
> >  Hans-Christian> This patch adds a new package lsdldoom, this Doom
> >  Hans-Christian> client is based on the SDL framework. An alternative
> >  Hans-Christian> to the lxdoom package.
> > 
> > Couldn't we just standardize on prboom instead of N doom variants?
> > 
> 
> I'll see what I can figure out of prboom. It would be nice to have one
> client usable with SDL and also usable with X.
> 

prboom works fine, at least on AVR32. My main question is if we should
replace lxdoom (and the lsdldoom I submitted earlier) with prboom.

prboom links against SDL, and SDL can again be linked against
framebuffer, DirectFB, Qtopia and X11. Should be good enough for
everybody?

prboom is also fairly updated, last release was in 2006, in opposite to
lxdoom and lsdldoom which had the last release back in 2000.

I have not tested the network mode, but it compiles.

I at least prefer prboom above lsdldoom for targets without X11, so
either way I would like it added.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
