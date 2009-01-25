From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 23:24:12 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <8763k3dqi3.fsf@macbook.be.48ers.dk>
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
	<87zlhffs9j.fsf@macbook.be.48ers.dk>
	<1232918236.2298.9.camel@elrond.atmel.com>
	<8763k3dqi3.fsf@macbook.be.48ers.dk>
Message-ID: <1232922252.2298.34.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 22:28 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> Ulf, several people (myself included) told you to default to menuconfig
>  >> for the kernel stuff, I'm surprised that's still not the case.
> 
>  Ulf> If you want a simple configuration, then you don't use
>  Ulf> the "Advanced configuration for Linux"
> 
>  Ulf> The advanced configuration is a selectable option.
>  Ulf> so is the make menuconfig.
>  Ulf> I prefer default
> 
> But we're not talking about what YOU prefer. We're talking about what
> is a sensible default. I think we can all agree that if we have a
> choice between 2 functionally equivalent options where option 1 always
> works and the other requires X and QT3 headers, then the decission is
> easily made.
> 

Now it works, regardless if you have X or not.
so we and the user do not have to choose.

If X is available you have a better experience.


>  Ulf> I wrote the Advanced configuration so that I can 
>  Ulf> work with Linux in a manner that is flexible.
> 
>  Ulf> What should possible be done is to fallback to menuconfig if this fails
> 
> But why? Just use menuconfig and be done with it. What does xconfig
> bring you that menuconfig doesn't?
> 

Ease of use - ?menuconfig is archaic
I would prefer to use Xconfig for Buildroot as well.


>  Ulf> You want to minimize the options for the user, so I suggest
>  Ulf> that you write a new way of configuring Linux
>  Ulf> so you can do it the way You want.
> 
> Sigh. Ulf, you really need to learn to work with the rest of the BR
> developers.

If people have valid issues, then I listen,
My main problem is that not only does people want to 
to it in a certain way, they also want to ensure
that it is not possible to do it in another way.

If you want to ensure that Buildroot does not crash
when people select to use make *-config, then that is 
a valid concern.

If you want to ensure that Buildroot users 
are coreced into using menuconfig, then I think it is not.

If you want to ensure that people has to spend tons of time, 
updating the config file to fit their desires
every time they download the trunk, again, I am against that.

IMO, the submitted solution should meet all valid concerns.

>  Ulf> You have NO business changing the board defaults.
> 

BR
Ulf Samuelsson
