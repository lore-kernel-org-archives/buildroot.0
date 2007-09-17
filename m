From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 11:50:34 +0200
Subject: [Buildroot] r19351 broke make source [was: Re: svn
	commit:	trunk/buildroot: target/device target/device/Atmel
	targe etc...]
In-Reply-To: <20070917092015.GA18644@aon.at>
References: <20070731145959.C5111A4595@busybox.net>
	<20070917092015.GA18644@aon.at>
Message-ID: <20070917095034.GB19167@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 11:20:15AM +0200, Bernhard Fischer wrote:
>On Tue, Jul 31, 2007 at 07:59:59AM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-07-31 07:59:58 -0700 (Tue, 31 Jul 2007)
>>New Revision: 19351
>>
>>Log:
>>Add support for prepatched toolchains
>
>This apparently broke 'make source'. Please fix ASAP or revert.

I'll resist to do a funny immediate revert of this bad patch for now,
although this seems to be a common attitude today..

>>Added:
>>   trunk/buildroot/target/device/Atmel/Mirrors.in
>>   trunk/buildroot/target/device/Atmel/toolchain/
>>   trunk/buildroot/target/device/Atmel/toolchain/avr32/
>>   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.0/
>>   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.0/
>>   trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.0/
>>   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/
>>   trunk/buildroot/target/device/Mirrors.in
>>   trunk/buildroot/target/device/Toolchain.in
