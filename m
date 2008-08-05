From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 5 Aug 2008 12:58:13 +0200
Subject: [Buildroot] gdb debugger for atmel is not possible
In-Reply-To: <DADAAA29AC734DCAAAAF0E3968235CC7@aeglos>
References: <49ED01FC03EE524BB7BB258E8F93BFF32654FC@bfl-exchange-1.BFL.local><46a136670808050324x5a7ac218s871c1529e8bad3aa@mail.gmail.com>
	<DADAAA29AC734DCAAAAF0E3968235CC7@aeglos>
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF3265512@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using the external source toolchain: Source location: (Use
prepatched source for AVR32 gcc-4.2.1 toolchain)

I hope that this is ok. I can't find any great differences in the
buildroots from atmel and here. And the Atmel toolchains don't work
better for me.

Sebastian

 

________________________________

Von: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org]
Im Auftrag von Ulf Samuelsson
Gesendet: Dienstag, 5. August 2008 12:28
An: John Voltz; Buildroot List
Betreff: Re: [Buildroot] gdb debugger for atmel is not possible

 

 

	Use the Atmel fork of buildroot at www.atmel.no for AVR32. The
upstream buildroot has mostly removed AVR32 support because it was
breaking other stuff and the patches were huge.
	
	John

 

You need to build the external source version in mainstream.

Is that not building correctly in the current svn?

 

Best Regards
Ulf Samuelsson

 

	 

	On Tue, Aug 5, 2008 at 3:45 AM, Matuschka, Sebastian
<Sebastian.Matuschka@gcd-solutions.de> wrote:

	Hi,
	
	when I enable the Gdb debugger or server for the target (Atmel
AVR32) i
	get the following message:
	configure: error: "*** Gdb does not support native target
	avr32-unknown-linux-uclibc"
	make[2]: *** [configure-gdb] Error 1
	make[2]: Leaving directory
	`/atmel/buildrootWork/build_avr32/gdb-6.7.1-target'
	make[1]: *** [all] Error 2
	make[1]: Leaving directory
	`/atmel/buildrootWork/build_avr32/gdb-6.7.1-target'
	make: ***
[/atmel/buildrootWork/build_avr32/gdb-6.7.1-target/gdb/gdb]
	Error 2
	
	I'm using the most recent buildroot. How can I build gdb for
avr32?
	Could someone add this to buildroot please?
	I attached my buildroot .config in case it is necessary.
	Thanks
	Sebastian
	
	
	_______________________________________________
	buildroot mailing list
	buildroot at uclibc.org
	http://busybox.net/mailman/listinfo/buildroot

	 

	
________________________________


	_______________________________________________
	buildroot mailing list
	buildroot at uclibc.org
	http://busybox.net/mailman/listinfo/buildroot
<http://busybox.net/mailman/listinfo/buildroot> 

	 

	 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080805/239e9af8/attachment-0001.htm 
