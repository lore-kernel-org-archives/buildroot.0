From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Jan 2009 21:35:47 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	ext_source/Atmel/avr32
In-Reply-To: <87y6y76wrb.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Tue\, 23 Dec 2008 10\:55\:52 +0100")
References: <20081220223102.7E1D376CEB@busybox.osuosl.org>
	<87y6y76wrb.fsf@macbook.be.48ers.dk>
Message-ID: <87mye91m58.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
 Peter> Hi,

 ulf> Author: ulf
 ulf> Date: 2008-12-20 22:31:02 +0000 (Sat, 20 Dec 2008)
 ulf> New Revision: 24474

 ulf> Log:
 ulf> Add updated binutils-2.18 prepatched toolchain for AVR32
 
 ulf> config BR2_BINUTILS_VERSION_2_17
 ulf> depends on BR2_avr32 || !BR2_nios2
 ulf> -		depends on BR2_DEPRECATED
 ulf> +		depends on BR2_DEPRECATED && !BR2_avr32

 Peter> depends on BR2_avr32  + depends on !BR2_avr32?

It's been 10 days now, so I'm fixing it up.

-- 
Bye, Peter Korsgaard
