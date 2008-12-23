From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 11:40:08 +0100
Subject: [Buildroot] avr32: no selection for Binutils version
In-Reply-To: <4950BD88.2060503@gmx.at> ("Bernhard =?utf-8?Q?G=C3=B6del=22'?=
	=?utf-8?Q?s?= message of "Tue\, 23 Dec 2008 11\:29\:28 +0100")
References: <4950BD88.2060503@gmx.at>
Message-ID: <87vdtb5g53.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard G?del <bernhard.goedel@gmx.at> writes:

Hi,

 Bernhard> Hi, I'm new to embedded Linux, so I want to apologize for
 Bernhard> stupid questions in advance. :-)

Don't worry ;)

 Bernhard> I used 'make menuconfig' to enter the configuration for my
 Bernhard> target but I've encountered a problem here. After selecting
 Bernhard> 'AVR32' as target architecture, I cannot select any
 Bernhard> Binutils Version from the 'Toolchain' submenu.

Sorry, the avr32 stuff is quite special case, and I don't know
anything about it. Ulf recently did some changes to it, so maybe you
could try either the newest snapshot or a version before his changes
(20/12)?

Ulf, comments?

-- 
Bye, Peter Korsgaard
