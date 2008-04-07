From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 7 Apr 2008 02:29:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com><874paf88ma.fsf@macbook.be.48ers.dk>
	<47F8EB5B.9050905@eclis.ch><1207499614.6817.36.camel@nigel-x60>
	<87iqyuu8d0.fsf@macbook.be.48ers.dk>
Message-ID: <007601c89846$ee875b80$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hi,
> 
> Nigel> Please revert this patch. As Jean said, not everyone runs X11 or even
> Nigel> builds buildroot locally and has bandwidth to support running remote X
> Nigel> sessions.
> 
> Nigel> Ulf, if you want to use xconfig, I suggest *you* change *your* local
> Nigel> copy. Don't put this requirement on everyone else.
> 
I do not put this requirement on everyone else.
The default behaviour is 
1) To not build a kernel at all or
2) To build a kernel using the classic behaviour.

Only by selecting two non-default behaviours you get 
exposed to the "advanced" linux configuration
I have spent considerable time on during the last 9 months.

This will default to xconfig for AT91/AVR32 chips,
but you have the option to select the menuconfig you want.

If someone wants a different behaviour,
then they can create yet another linux makefile.

> Even easier, change the setting in the defconfigs he works with.
> 


Best Regards
Ulf Samuelsson 
