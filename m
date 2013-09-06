From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Sep 2013 07:08:16 -0300
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
	BR2_BINFMT_FLAT
In-Reply-To: <20130906082537.08818fba@skate>
References: <1378262598.32360.5.camel@phoenix>
 <1378262667.32360.6.camel@phoenix> <20130905234841.3bbfe0d4@skate>
 <CAAXf6LVLhC7LiuXTcSY+Rmyy_jt6ec37cU4S_4a=j=CpUs1qbA@mail.gmail.com>
 <20130906082537.08818fba@skate>
Message-ID: <5229A990.7080906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/2013 03:25 AM, Thomas Petazzoni wrote:

> On Fri, 6 Sep 2013 03:08:10 +0200, Thomas De Schampheleire wrote:
> 
>> Don't we/shouldn't we have something like ARCH_HAS_MMU and/or
>> ARCH_SUPPORTS_FLAT_BINARY?
> 
> Yes, we should probably have something like this (and ditto for other
> binary formats: ELF, FDPIC and so on).

On a side note, remember that HAS_MMU doesn't mean it's using it - from
what i've read you can use MMU-bearing processors to test uclinux
MMU-less scenarios (dunno if it can be done with every SOC out there,
probably depends on the linux support for each one, at least a couple of
Atmel ones were used this way for testing and/or masochism).
Regards.
