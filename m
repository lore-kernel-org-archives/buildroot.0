From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 26 Mar 2008 18:17:51 +0100
Subject: [Buildroot] build problems
In-Reply-To: <87ve39buzq.fsf@macbook.be.48ers.dk>
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv>
	<034f01c88ece$ef015bf0$040514ac@atmel.com>
	<87ve39buzq.fsf@macbook.be.48ers.dk>
Message-ID: <20080326171751.GH29267@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 26, 2008 at 12:11:21PM +0100, Peter Korsgaard wrote:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
>Hi,
>
> >> Also, when I run it right now and try to do a "make configured", I get
> >> an error because it can't copy busybox-1.9.2.config. It looks like
> >> busybox has been updated, but a new config file has not been put into
> >> the target/device/atmel/at91sam9260dfc directory. So do I rename the
> >> busybox-1.9.1.config file to busybox-1.9.2.config? 
>
> Ulf> I think this will work.
> Ulf> The problem is that people updating the busybox support,
> Ulf> disables the use of older busybox, which will force the 
> Ulf> saved config to update the version.
> Ulf> I am not sure that this is a good idea.
>
>I'll be the first to admit to not knowing anything about that 11MB
>blob under target/device/Atmel  - Why make it so fragile to begin with?
>
>By now all the avr/atmel stuff takes up around half the buildroot size
>- I don't have access to any of that hardware, so I won't test it.
>
>I see that the directory only has a busybox config for 1.6.1 and
>1.9.1, so it's broken anyway if the user selects anything else than
>that.
>
>To me it doesn't make sense to keep earlier versions than the latest
>stable release of a given major version (E.G. 1.9.2 instead of 1.9.1)
>- Otherwise it'll get too hard to handle. I think it's also soon time
>to retire some of the really ancient versions like 1.2.x - 1.6.x.

hehe, sounds familiar. I've already had my share of fun with Ulf in
exactly this area and consequently there is that git-repo which fixes
alot of this stuff for good.

cheers,
