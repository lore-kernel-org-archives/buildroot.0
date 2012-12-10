From: Willy Lambert <lambert.willy@gmail.com>
Date: Mon, 10 Dec 2012 15:53:54 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
Message-ID: <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/10 Berns <Berns@beka-elektronik.de>:
> Hi
>
> i have tried to build at91sam9263ek_defconfig (without any modification)
> with the latest release 2012.11 on a 32bit Ubuntu12.04 machine.
> The build of the toolchain fails with :
> .../buildroot-2012.11/output/toolchain/uClibc_dev//usr/include/features.h:21
> 9:5: Fehler: #error It appears you have defined _FILE_OFFSET_BITS=64.
> Unfortunately, uClibc was built without large file support enabled.
>
> Large file support isn't select and i have also checked it with make
> uclibc-menuconfig for uclibc.
> The same problem happend with beaglebone_defconfig.
>
> After "make clean" and selecting "large file support" the build process
> works.
>
> This problem doesn't happend with release 2012.08.
>
> Has anybody a hint for me ?

I have just had the same problem, is it possible that this is a
regression of the 2012.11 version ?

>
> Thanks
>
> Rainer
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
