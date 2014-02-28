From: Massimiliano Marretta <max@marretta.com>
Date: Fri, 28 Feb 2014 10:12:25 +0100
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
Message-ID: <CACP2RPYESsJz+mA1n-y81yinGB0AQCJ5o2bN6SQiXnYYM2XKzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric,

many thanks for the suggestions.

I use the wandboard kernel version 3.0.35_4.1.0.
I have apply your patch in my buildroot version and now with the linaro hf
toolchain the gpu-viv-bin-mx6q examples work correctly.
Unfortunately qmlscene exit without any message (both console and fb). Qt5
work only with sf ?

Why the patch is not present in the last buildroot version 14.02 ?

Regards,
Massimiliano.


2014-02-28 1:11 GMT+01:00 Eric Nelson <eric.nelson@boundarydevices.com>:

> Hi Massimiliano,
>
> On 02/27/2014 02:40 PM, Massimiliano Marretta wrote:
>
>> Can I use the gpu-viv-bin-mx6q-3.5.7-1.0.0-hfp.bin with the kernel
>> version 3.0.35  ?
>>
>>
> Unfortunately, saying "3.0.35" isn't specific enough. The first
> few releases (what Freescale referred to as 1.0.0, 1.1.0, and 4.0.0)
> won't support the badly-named 3.5.7-1.0.0 GPU binaries.
>
> For that, you need the updates that came with the 3.0.35_4.1.0
> release.
>
> Clear, huh?
>
> If you have a commit id in your source tree for the last Freescale
> update we (or you) can likely pin-point it with "git branch --contains".
>
> If you started with one of the older branches, it's likely that
> your patches will forward-port pretty easily. None of the 3.0.35
> releases from Freescale had any major re-structuring.
>
> Regards,
>
>
> Eric
>



-- 
Massimiliano Marretta
Via Zuccola 11
41015 Nonantola (Mo) - Italy
tel: +39 347 5340305
skype: mmarretta
 *mailto:max at marretta.com* <max@marretta.com>
*web:www.marretta.com* <http://www.marretta.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140228/da5c0bbd/attachment.html>
