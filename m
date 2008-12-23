From: Egtvedt, Hans-Christian <Hans-Christian.Egtvedt@atmel.com>
Date: Tue, 23 Dec 2008 21:00:32 +0100
Subject: [Buildroot] avr32: lbipthread problem
References: <4950BFB2.7010302@gmx.at> <87zlim3oot.fsf@macbook.be.48ers.dk>
Message-ID: <610CFB6E625B214C8293AC3ABE31395F01BFACAF@frimb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct, AVR32 does not support NPTL.

Sorry for top quoting, I'm on vacation and using MS Exchange web interface.
Free beer to anybody telling me how to get a proper editor...

-----Opprinnelig melding-----
Fra: buildroot-bounces at busybox.net p? vegne av Peter Korsgaard
Sendt: ti 2008-12-23 16:18
Til: Bernhard G?del
Kopi: buildroot at uclibc.org
Emne: Re: [Buildroot] avr32: lbipthread problem
 
>>>>> "Bernhard" == Bernhard G?del <bernhard.goedel@gmx.at> writes:

 Bernhard> Hi,
 Bernhard> I'm trying to build a toolchain based on uClibc for the AVR32. I'm using 
 Bernhard>   buildroot-20081120 (as I had problems with binutils in newer 
 Bernhard> snapshots). I've configured threading support to NPTL, don't know 
 Bernhard> whether the compile error below happens also with other configurations.

Don't do that. I'm pretty sure avr32/uclibc 0.9.29 doesn't support
NTPL.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20081223/8b490285/attachment.htm 
