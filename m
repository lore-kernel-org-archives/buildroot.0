From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 16:18:26 +0100
Subject: [Buildroot] avr32: lbipthread problem
In-Reply-To: <4950BFB2.7010302@gmx.at> ("Bernhard =?utf-8?Q?G=C3=B6del=22'?=
	=?utf-8?Q?s?= message of "Tue\, 23 Dec 2008 11\:38\:42 +0100")
References: <4950BFB2.7010302@gmx.at>
Message-ID: <87zlim3oot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
