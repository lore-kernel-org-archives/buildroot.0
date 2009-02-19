From: =?utf-8?Q?Hinko_Ko=C4=8Devar?= <hinko.kocevar@cetrtapot.si>
Date: Thu, 19 Feb 2009 18:41:22 +0100 (CET)
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <53818555.3401235065156991.JavaMail.root@zimbra-store.cetrtapot.si>
Message-ID: <1983108078.3421235065282329.JavaMail.root@zimbra-store.cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message -----
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: "Hinko Kocevar" <hinko.kocevar@cetrtapot.si>, "Peter Korsgaard" <jacmet@uclibc.org>
Cc: buildroot at uclibc.org
Sent: Thursday, February 12, 2009 7:11:24 PM GMT +01:00 Amsterdam / Berlin / Bern / Rome / Stockholm / Vienna
Subject: Re: [Buildroot] Buildroot 2009.02 released


>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
>
> Hi,
>
> Hinko> Building gdb for cris-v10 architecture fails with:
>
> Ahh, seems like you should have tested the release candidates better
> ;)
>

As far as I have seen, there has been very little testing activitiy going on 
before the release.
There are several packages that does not build, at least for ARM.
Several packages build but crash when you start the target.

Zero documentation on what builds and what does not build.

Zero documentation on what builds but does not run.

True.

Maybe we could put some focus on these points.

I'll try to steal some time to try out basic packages (for starters) that build & run on cris-v10 arch. That's the only embedded arch I can test.

What about he packages that can not be built for some specific arch, for some reason or another (too few resources CPU, mem, flash, ..)? Should they be marked or noted somehow to inform us about its status on selected arch?

Regards,
Hinko


-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
