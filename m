From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 4 Sep 2007 09:00:17 -0400
Subject: [Buildroot] AVR32 defconfig
References: <00ca01c7ea3f$e32af130$6e00a8c0@JONATHAN>
	<1188456153.30555.4.camel@localhost.localdomain>
	<20070901162750.GL11697@aon.at>
Message-ID: <003101c7eef3$8a8fec20$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have done a make disclean and redo the make atngw100_defconfig from 
scratch.

At the uclibc question i answered avr32 instead of i386. Wi this i have a 
better compiling, but get some issue. I have started a new thread with it

thanx for this info.

Jonathan
----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Hans-Christian Egtvedt" <hcegtvedt@atmel.com>
Cc: "Jonathan Dumaresq" <jdumaresq@cimeq.qc.ca>; <buildroot@uclibc.org>
Sent: Saturday, September 01, 2007 12:27 PM
Subject: Re: [Buildroot] AVR32 defconfig


> On Thu, Aug 30, 2007 at 08:42:33AM +0200, Hans-Christian Egtvedt wrote:
>>On Wed, 2007-08-29 at 09:24 -0400, Jonathan Dumaresq wrote:
>>
>><cut Atmel snapshot of Buildroot>
>
>>> i probably have setting in the config file that is not correct.
>>
>>Check what architecture is chosen in uClibc configuration:
>>cd toolchain_build_avr32/uClibc-0.9.28.3
>>make menuconfig
>
> Generally you should not do this in order not to risk mis-configuration.
> See docs/README
> 
