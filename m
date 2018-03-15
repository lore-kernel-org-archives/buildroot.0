From: Martin Bark <martin@barkynet.com>
Date: Thu, 15 Mar 2018 14:07:20 +0000
Subject: [Buildroot] [PATCH 3/4] board/raspberrypi: add support for rpi3
 b+
In-Reply-To: <20180315133334.5fxt65qbjfk24e77@tarshish>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-3-git-send-email-martin@barkynet.com>
 <20180315133334.5fxt65qbjfk24e77@tarshish>
Message-ID: <CAFGQKxf=KsaTFLFo3cTZWUXOjdEz0pAo=12cAPTBhzMqjCMj0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 15 March 2018 at 13:33, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Martin,
>
> On Thu, Mar 15, 2018 at 01:24:50PM +0000, Martin Bark wrote:
>> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
>> index 9482693..9f91581 100644
>> --- a/board/raspberrypi/readme.txt
>> +++ b/board/raspberrypi/readme.txt
>> @@ -30,7 +30,7 @@ For model 2 B:
>>
>>    $ make raspberrypi2_defconfig
>>
>> -For model 3 B:
>> +For model 3 B and B+:
>
> This is quick. Have you tested on hardware?

I've testing it builds and runs on the rpi3 but not tested on a
rpi3b+.  I should get my rpi3b+ soon to verify this.  The current
kernel includes all the changes needed for the rpi3b+. To add support
we just need to include the bcm2710-rpi-3-b-plus.dtb.

Note that i don't see any updates to the arm64 defconfig for dtb files
so raspberrypi3_64_defconfig will remain unchanged for now.

Thanks

Martin

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
