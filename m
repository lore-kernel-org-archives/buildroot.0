From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 28 Apr 2014 16:45:30 -0400
Subject: [Buildroot] [PATCH 9/9] boot/syslinux: add an option to install
 an MBR blob
In-Reply-To: <20140428203934.GH3501@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <ccf1ac950371fe7411ff812bb17958a8824be30d.1398378217.git.yann.morin.1998@free.fr>
 <535E8070.9090405@mind.be> <20140428195241.GG3501@free.fr>
 <CA+-urNQjYMOO1bFMQ4uJjqmMXqBUVvgXxZcFT-a6D4PbrtZafg@mail.gmail.com>
 <20140428203934.GH3501@free.fr>
Message-ID: <CA+-urNRjWzaBK9neGYEo2B3=4draC+zBoTbTH6gJiaecTZEsqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Apr 28, 2014 at 4:39 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Frank, All,
>
> On 2014-04-28 15:58 -0400, Frank Hunleth spake thusly:
>> On Mon, Apr 28, 2014 at 3:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
>> > I'll have a look at syslinux, but I believe it is the same as extlinux.
>>
>> I'm actually using syslinux. E.g. in a post build script, I run
>> "output/host/usr/bin/syslinux -i myfatbootpartition.vfat" and then use
>> the MBR in "output/host/user/share/syslinux/mbr.bin".
>>
>> Yann - your patch series appears to work fine for me! I'm using the
>> same syslinux.cfg file that I was using with 4.0.7, so it has been a
>> pretty easy upgrade. Thanks!
>
> OK, I'll soon re-spin a new version of this series after I complete the
> changes suggested by Arnout.
>
> Will you care to send your Tested-by on this upcoming series if it
> still works for you, please? Having Tested-by tags helps the maintainer
> see the the patches work at least to some extent.

Definitely. Thanks again for finishing off the syslinux upgrade.

Frank
