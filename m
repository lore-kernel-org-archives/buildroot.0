From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 22 Nov 2013 10:15:20 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122091411.59d82eb5@skate>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
Message-ID: <CAHkwnC9LWo3r21coQzROnajC1AKK4rF_Ec-AaXwMPK5esW--_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Nov 22, 2013 at 9:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 22 Nov 2013 08:30:02 +0100 (CET), Thomas Petazzoni wrote:
> ...
>>        arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b0b386969459dda9c294f1ccb4927ca225fa6bdd/
>
> Missing dependency?
>
> /home/test/test/1/output/host/usr/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os   -fPIC  -O2 --static -O2 -L../libdm -L../lib -L../libdaemon/client -L../libdm \
>               -o dmsetup dmsetup.o -ldevmapper
> /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ldevmapper
>
> ...

I will try to look into this.

Best regards
-- 
Fabio Porcedda
