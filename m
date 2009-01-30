From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 09:52:45 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atstk100x
In-Reply-To: <20090130090922.0b77a183@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Fri\, 30 Jan 2009 09\:09\:22 +0100")
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
	<20090129104341.2d34aa8e@hcegtvedt>
	<87iqnytp51.fsf@macbook.be.48ers.dk>
	<1233252070.4147.23.camel@elrond.atmel.com>
	<20090130090922.0b77a183@hcegtvedt>
Message-ID: <874ozhp44i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> These are example projects and the user is likely
 >> to want to do things which are specific for his/her kernel.
 >> 
 >> That is easier to do if you set buildroot to use a configuration file.
 >> 

 Hans-Christian> Why?

 Hans-Christian> make linux26-menuconfig works fine.

Agreed.

 >> It is probably safe to remove the 2.6.7.3
 >> 

 Hans-Christian> Hmm, sure, did that have anything to do with the
 Hans-Christian> AVR32 boards?  Linux v2.6.7.3 was never official
 Hans-Christian> supported by AVR32.

I guess there's a 2 missing, E.G. 2.6.27.3 ;)

-- 
Bye, Peter Korsgaard
