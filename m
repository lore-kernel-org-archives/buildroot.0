From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Mar 2008 12:24:16 +0100
Subject: [Buildroot] build problems
In-Reply-To: <87r6dxw1n6.fsf@macbook.be.48ers.dk>
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv>
	<034f01c88ece$ef015bf0$040514ac@atmel.com>
	<87ve39buzq.fsf@macbook.be.48ers.dk>
	<20080326171751.GH29267@mx.loc>
	<87r6dxw1n6.fsf@macbook.be.48ers.dk>
Message-ID: <20080327112416.GB13379@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 26, 2008 at 11:39:41PM +0100, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> >> To me it doesn't make sense to keep earlier versions than the latest
> >> stable release of a given major version (E.G. 1.9.2 instead of 1.9.1)
> >> - Otherwise it'll get too hard to handle. I think it's also soon time
> >> to retire some of the really ancient versions like 1.2.x - 1.6.x.
>
> Bernhard> hehe, sounds familiar. I've already had my share of fun
> Bernhard> with Ulf in exactly this area and consequently there is
> Bernhard> that git-repo which fixes alot of this stuff for good.
>
>I take it that you have completely stopped committing to svn - Would
>you object to me cherry picking a few commits from your git repo
>(E.G. newer toolchains)?

The git tree is publically available for anybody to use under the terms
and conditions of the license, so take it or leave it, as a whole or in
parts, sure.

But apart from you guys using outdated toolchains, let me point you to
the more severe issue that you guys (i.e. not my git tree) build with
fux0red up CFLAGS, so you'd better start off with fixing that before
anything else.
I think that i solved this nicely and cleanly in my tree.
I even fixed some of the most annoying breakage (or my inability to use
it properly, depending on your POV) that Ulf applied over time, fwiw.

HTH,
Bernhard
