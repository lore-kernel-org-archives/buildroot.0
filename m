From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 22:28:52 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <1232918236.2298.9.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 25 Jan 2009 22\:17\:16 +0100")
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
	<87zlhffs9j.fsf@macbook.be.48ers.dk>
	<1232918236.2298.9.camel@elrond.atmel.com>
Message-ID: <8763k3dqi3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Ulf, several people (myself included) told you to default to menuconfig
 >> for the kernel stuff, I'm surprised that's still not the case.

 Ulf> If you want a simple configuration, then you don't use
 Ulf> the "Advanced configuration for Linux"

 Ulf> The advanced configuration is a selectable option.
 Ulf> so is the make menuconfig.
 Ulf> I prefer default

But we're not talking about what YOU prefer. We're talking about what
is a sensible default. I think we can all agree that if we have a
choice between 2 functionally equivalent options where option 1 always
works and the other requires X and QT3 headers, then the decission is
easily made.

 Ulf> I wrote the Advanced configuration so that I can 
 Ulf> work with Linux in a manner that is flexible.

 Ulf> What should possible be done is to fallback to menuconfig if this fails

But why? Just use menuconfig and be done with it. What does xconfig
bring you that menuconfig doesn't?

 Ulf> You want to minimize the options for the user, so I suggest
 Ulf> that you write a new way of configuring Linux
 Ulf> so you can do it the way You want.

Sigh. Ulf, you really need to learn to work with the rest of the BR
developers.

 Ulf> You have NO business changing the board defaults.

-- 
Bye, Peter Korsgaard
