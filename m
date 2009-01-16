From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 21:59:36 +0100
Subject: [Buildroot] buildroot 2009.02-rc1 releases
In-Reply-To: <COL102-DS22F34FACAAB46FA15B3945DCD40@phx.gbl>
References: <87ab9r3u6k.fsf@macbook.be.48ers.dk>
	<COL102-DS22F34FACAAB46FA15B3945DCD40@phx.gbl>
Message-ID: <1232139576.6977.9.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 20:52 +0000 skrev danieljlaird at hotmail.com:
> Fantastic job,
> 
> I have a couple of small fixes (only fixes) I want to apply - will try and 
> get them in early next week.
> A more stable release plan is really good.
> 
> Is is worth starting a list somewhere of features, changes etc we would like 
> early on in the development of a new release?
> 
> - For me I would like us to have a serious look again at package structure 
> as I am sure we could create less top level packages and extend on the idea 
> of games/java/network/multimedia etc.
> - I will also be adding stuff to do with sysroot'ed external toolchains as 
> thats what I use.
> 

I think it would be a good idea to have all things supported
by busybox in a single menu, instead of spread out
all over the place.
This menu should be enabled by the 
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS config



> Cheers
> Dan
