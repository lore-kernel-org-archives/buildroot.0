From: Gergely Imreh <imrehg@gmail.com>
Date: Mon, 19 Oct 2015 13:34:39 +0800
Subject: [Buildroot] [PATCH 1/1] board/via/imx6_vab820: update to latest
 BSP release
In-Reply-To: <20151019051736.GN20889@tarshish>
References: <1445226305-29641-1-git-send-email-imrehg@gmail.com>
 <20151019051736.GN20889@tarshish>
Message-ID: <CAJ3iQcr=wih0xrdTGUxROCWP438R=hJ0rsGx3p79C1c+Fm+SHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 October 2015 at 13:17, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Imreh,
>
> On Mon, Oct 19, 2015 at 11:45:05AM +0800, imrehg at gmail.com wrote:
>> +# Minimal SD card image for the VIA VAB-820 / AMOS-820
>> +#
>> +# The SD card must have at least 1 MB free at the beginning.
>> +# U-Boot and is dumped as is.
>
> Something went wrong in this statement.
>

It depends, you mean the "dump" part? "dd" is "disk dump" as I far as know it,
and this statement is just the rewrite of the one in Wandboard's config at
board/wandboard/genimage.cfg: "U-Boot and its environment are dumped as is."

If it's still a concern, can rewrite this statement.

Cheers,
    Gergely

>> +# A FAT boot partition and an Ext4 root filesystem partition are required.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
