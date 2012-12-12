From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 12 Dec 2012 02:04:38 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121211100932.016b7feb@skate>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <87pq2hpnpq.fsf@dell.be.48ers.dk>
 <CAKvQZ_3P_nfpGsC+V6Z_eRjsmNssV-Pq0EDp0v78hfkY4vwdqg@mail.gmail.com>
 <87lid5oyr5.fsf@dell.be.48ers.dk>
 <CAKvQZ_2ghfJ-k2XaNEH4cP7jsr--pUjV4TNGXCY-T3aZCm2Vig@mail.gmail.com>
 <20121211100932.016b7feb@skate>
Message-ID: <CAKvQZ_319fFr8nBC62LEhmXHvhbf3Ku7CRMV9Kjg12Ze70=_XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Willy Lambert,
>
> On Tue, 11 Dec 2012 09:43:48 +0100, Willy Lambert wrote:
>
>> But for time being I'm just trying to compile a "default" buildroot
>> and run in into qemu.
>> (btw I have difficulties to put my RFS, in tgz format (cause it's the
>> default) into a .img file, is there any Buildroot hints for this, or
>> should I switch to other "RFS  image output format")
>
> Please read board/qemu/x86_64/readme.txt or board/qemu/x86/readme.txt
> and use the corresponding qemu_x86_64_defconfig and qemu_x86_defconfig
> default configuration as starting points.
>
> Those configuration are known working for Qemu, and the readme.txt file
> explain how to start them in Qemu.
>

Thanks a lot ! The buildroot doc is in general quite good, but after
you have created your images you are alone in the dark :D. This kind
of information about running a default config in qemu or hints on how
to install your rootfs on your target would be welcome.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
