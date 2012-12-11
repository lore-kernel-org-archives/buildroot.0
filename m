From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Dec 2012 10:09:32 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_2ghfJ-k2XaNEH4cP7jsr--pUjV4TNGXCY-T3aZCm2Vig@mail.gmail.com>
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
Message-ID: <20121211100932.016b7feb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Tue, 11 Dec 2012 09:43:48 +0100, Willy Lambert wrote:

> But for time being I'm just trying to compile a "default" buildroot
> and run in into qemu.
> (btw I have difficulties to put my RFS, in tgz format (cause it's the
> default) into a .img file, is there any Buildroot hints for this, or
> should I switch to other "RFS  image output format")

Please read board/qemu/x86_64/readme.txt or board/qemu/x86/readme.txt
and use the corresponding qemu_x86_64_defconfig and qemu_x86_defconfig
default configuration as starting points.

Those configuration are known working for Qemu, and the readme.txt file
explain how to start them in Qemu.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
