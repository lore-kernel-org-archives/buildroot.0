From: Mauro Condarelli <mcondarelli@soft-in.com>
Date: Mon, 29 Dec 2008 10:52:12 +0100
Subject: [Buildroot] R:  AT91SAM9G20 build .config for linux-2.6.26
In-Reply-To: <495891E7.2060908@panicking.kicks-ass.org>
References: <787962.90753.qm@web23507.mail.ird.yahoo.com>
	<49553323.4020606@soft-in.com>
	<495891E7.2060908@panicking.kicks-ass.org>
Message-ID: <49589DCC.30909@soft-in.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

michael ha scritto:
> Hi,
>
> Mauro Condarelli wrote:
>> Michael Trimarchi ha scritto:
>>> Hi,
>>>
>>> --- Ven 26/12/08, Mauro Condarelli <mcondarelli@soft-in.com> ha
>>> scritto:
>>>
>>>  
>>>> Da: Mauro Condarelli <mcondarelli@soft-in.com>
>>>> Oggetto: [Buildroot] AT91SAM9G20 build .config for linux-2.6.26
>>>> A: buildroot at uclibc.org
>>>> Data: Venerd? 26 dicembre 2008, 20:06
>>>> Hi,
>>>> I've been trying to build the whole kernel+rootfs
>>>> system for my
>>>> AT91SAM9G20-EK Rev.B EVA board several times now and always
>>>> failing, for
>>>> one reason or the other.
>>>>
>>>> I tried both the straight instructions from
>>>> buildroot.uclibc.org and
>>>> those from www.linux4sam.org.
>>>>
>>>> I have a working set bootstrap+uboot+linux-2.6.25+rootfs
>>>> BINARY ONLY!
>>>>
>>>> I am (for the time being) happy with the first two steps
>>>> and I'm trying
>>>> to setup a net boot with tftp+nfs.
>>>> I have been able to set-up a server with working tftpd+nfsd
>>>> that will
>>>> boot the original stuff.
>>>>
>>>>     
>>> The rootfs is one thing. The kernel is another one. You can compile
>>> the kernel outside the buildroot project using the same toolchain,
>>> start
>>> from the config file of 2.6.25 distribuition.
>>>
>>> Michael
>>>   
>> Pretty please, I tried several (dozens of) configurations.
>> Can  someone contribute a *surely working* .config file for my board?
>> I started "from the config file of 2.6.25 distribuition" (assuming You
>> mean the one that is available from www.kernel.org) multiple times,
>> never getting to a working kernel.
>>
>
> If you use the latest kernel you have the at91sam9g20ek_defconfig. The
> pathces for
> the at9samg20 are in the official kernel tree starting from the TAG
> v2.6.27-rc1
>
>> I really need to start from some "known good" point, otherwise I'm just
>> running circles.
>>
>> TiA
>> Mauro
>>
>
> The configs file are under arch/arm/configs/ directory of the kernel
> tree.
>
> Regards Michael
>
Hi,
Thanks.

I know that, unfortunately, for reasons independent of my will, I need
to stick to version 2.6.26.

Is there any *easy* way to backport the changes?

Can someone help me?

TiA
Mauro
