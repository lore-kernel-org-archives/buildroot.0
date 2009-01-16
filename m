From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 16 Jan 2009 22:10:03 +0100
Subject: [Buildroot] buildroot 2009.02-rc1 releases
In-Reply-To: <1232139576.6977.9.camel@aeglos.sweden.atmel.com>
References: <87ab9r3u6k.fsf@macbook.be.48ers.dk>
	<COL102-DS22F34FACAAB46FA15B3945DCD40@phx.gbl>
	<1232139576.6977.9.camel@aeglos.sweden.atmel.com>
Message-ID: <200901162210.04267.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson, 16.01.2009:
> fre 2009-01-16 klockan 20:52 +0000 skrev danieljlaird at hotmail.com:
> > - For me I would like us to have a serious look again at package structure 
> > as I am sure we could create less top level packages and extend on the idea 
> > of games/java/network/multimedia etc.
> 
> I think it would be a good idea to have all things supported
> by busybox in a single menu, instead of spread out
> all over the place.
> This menu should be enabled by the 
> BR2_PACKAGE_BUSYBOX_HIDE_OTHERS config

I think, if putting all busybox alternatives into a single menu, then
the BR2_PACKAGE_BUSYBOX_HIDE_OTHERS option would lose it's purpose and
could be removed, because the menu would already have a descriptive
title.

Markus
