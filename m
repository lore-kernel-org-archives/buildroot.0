From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 2 Jan 2009 22:50:40 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	ext_source/Atmel/avr32
References: <20081220223102.7E1D376CEB@busybox.osuosl.org><87y6y76wrb.fsf@macbook.be.48ers.dk>
	<87mye91m58.fsf@macbook.be.48ers.dk>
Message-ID: <FE8B93BAD143478690C33B2E9D818EB0@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> Peter> Hi,
> 
> ulf> Author: ulf
> ulf> Date: 2008-12-20 22:31:02 +0000 (Sat, 20 Dec 2008)
> ulf> New Revision: 24474
> 
> ulf> Log:
> ulf> Add updated binutils-2.18 prepatched toolchain for AVR32
> 
> ulf> config BR2_BINUTILS_VERSION_2_17
> ulf> depends on BR2_avr32 || !BR2_nios2
> ulf> - depends on BR2_DEPRECATED
> ulf> + depends on BR2_DEPRECATED && !BR2_avr32
> 
> Peter> depends on BR2_avr32  + depends on !BR2_avr32?
> 

Previously it was deprecated for everything.
The intention was to de-deprecate it for the AVR32 but not for other archs.


> It's been 10 days now, so I'm fixing it up.
> 
> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson
