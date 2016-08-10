From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Wed, 10 Aug 2016 21:29:08 +0530
Subject: [Buildroot] Sorry for false alarm [was Re: eudev compilation fails
	on buildroot-2016.08-rc1]
Message-ID: <CAFN-Ez7wQoJB68VUb4NOazFoCfSczX6uNo=_2Y3kmBpgz1HDYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am really sorry for raising false alarm, had messed up with my configs,
things are working

Thanks
C

On Wed, Aug 10, 2016 at 8:35 PM, Chetan Kumar <shivakumar.chetan@gmail.com>
wrote:

> BTW,
>
> I have used raspberrypi3_defconfig
>
> and I have
>
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>
> Thanks
> C
>
>
>
> On Wed, Aug 10, 2016 at 3:57 PM, Chetan Kumar <shivakumar.chetan@gmail.com
> > wrote:
>
>> Hi,
>>
>> I am trying to build eudev on buildroot-2016.08-rc1, it fails at below
>>
>> checking for gawk... (cached) mawk
>> checking for /home/buildroot-2016.08-rc1/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>> option to accept ISO C99... unsupported
>> configure: error: no C99 compiler found, eudev requires a C99 compiler.
>> make[1]: *** [/home//buildroot-2016.08-rc1/output/build/eudev-3.2/.stamp_configured]
>> Error 1
>> make: *** [_all] Error 2
>>
>>
>> Any help ?
>>
>> Thanks
>> C
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/01ed4e1c/attachment.html>
