From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 8 Mar 2012 11:03:40 +0100
Subject: [Buildroot] BR 2012.rc1 :: DVI not activated on pandaboard?
In-Reply-To: <20120308092159.5af7ce23@skate>
References: <CAPEB33z8LrFWaQdwVA1XdSjKFWam9kTH2FO8CvkWdnj9U_7vzA@mail.gmail.com>
 <20120308092159.5af7ce23@skate>
Message-ID: <CAHXCMMJNbfRkLjp8mUOHjaCz9VUUcWuP6tfV8bA+1wn2+U9EgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johann, all,

2012/3/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Le Wed, 7 Mar 2012 23:16:21 +0000,
> MERCADIER Johann <johann.mercadier@imerir.com> a ?crit :
>
>> mmc rescan
>> fatload mmc 0:1 0x80000000 uImage
>> setenv bootargs vram=32M console=ttyO2,115200n8
>> mem=456M at 0x80000000mem=512M at 0xA0000000 omapdss.def_disp=dvi
>> omapfb.mode=dvi:1280x1024MR-24 at 60smsc95xx.macaddr=76:2F:97:85:4F:56
>> root=/dev/nfs rw
>> nfsroot=192.168.1.44:/home/johann/rootfs_TEST,nolock,wsize=1024,rsize=1024
>> ip=192.168.1.235 rootdelay=4 init=/linuxrc
>> bootm 0x80000000
>>
>> when booting I get there, the pandaboard probably still continue the boot
>> process but nothing is displayed on the monitor?...
>> ___[ MINICOM O/P
>> ]________________________________________________________________________________________
>> ...
>> ? ?Verifying Checksum ... OK
>> ? ?Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Uncompressing Linux... done, booting the kernel.
>
Last time, i got this kind of log, i was messing up the console
parameter in kernel args.


Sam
