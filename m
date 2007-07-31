From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 00:43:50 +0200
Subject: [Buildroot] svn commit:trunk/buildroot/toolchain/kernel-headers
References: <20070731160220.4557AA466A@busybox.net>
	<20070731160246.GA9378@aon.at>
Message-ID: <00ac01c7d3fa$8e62c1b0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On Tue, Jul 31, 2007 at 09:02:20AM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-07-31 09:02:18 -0700 (Tue, 31 Jul 2007)
>>New Revision: 19359
>>
>>Log:
>>Remove duplicate patch
>>
>>Removed:
>>   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-ipmisensors-20070314-1214.patch
>>   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-ipmisensors-20070314-1214.patch
> 
> Did you even look if those two are identical?
> They were not and you broke ipmisensor support for 2.6.22.1 :-(
> 
>
trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-ipmisensors-20070314-1214.patch
is a duplicate of 
trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-007-ipmisensors-20070314-1214.patch

trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-ipmisensors-20070314-1214.patch
is a duplicate of
trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-007-ipmisensors-20070314-1214.patch

They are not duplicate of each other.

(I added a sequence number, but somehow the old patch name remained in the trunk)

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
