From: Gergely Imreh <imrehg@gmail.com>
Date: Mon, 19 Oct 2015 13:42:16 +0800
Subject: [Buildroot] [PATCH 1/1] board/via/imx6_vab820: update to latest
 BSP release
In-Reply-To: <20151019054036.GP20889@tarshish>
References: <1445226305-29641-1-git-send-email-imrehg@gmail.com>
 <20151019051736.GN20889@tarshish>
 <CAJ3iQcr=wih0xrdTGUxROCWP438R=hJ0rsGx3p79C1c+Fm+SHQ@mail.gmail.com>
 <20151019054036.GP20889@tarshish>
Message-ID: <CAJ3iQcpWY1PJES2s3ra3pR6Yxek-3hDW2b=tEVMmcQeQZ9hQKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 October 2015 at 13:40, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gergely,
>
> On Mon, Oct 19, 2015 at 01:34:39PM +0800, Gergely Imreh wrote:
>> On 19 October 2015 at 13:17, Baruch Siach <baruch@tkos.co.il> wrote:
>> > On Mon, Oct 19, 2015 at 11:45:05AM +0800, imrehg at gmail.com wrote:
>> >> +# Minimal SD card image for the VIA VAB-820 / AMOS-820
>> >> +#
>> >> +# The SD card must have at least 1 MB free at the beginning.
>> >> +# U-Boot and is dumped as is.
>> >
>> > Something went wrong in this statement.
>>
>> It depends, you mean the "dump" part? "dd" is "disk dump" as I far as know it,
>> and this statement is just the rewrite of the one in Wandboard's config at
>> board/wandboard/genimage.cfg: "U-Boot and its environment are dumped as is."
>>
>> If it's still a concern, can rewrite this statement.
>
> So it's only the word 'and' that is redundant here. Should be: "U-Boot is
> dumped as is".

Got it, wasn't clear from your original comment what issue should I
look for. Thanks.

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
