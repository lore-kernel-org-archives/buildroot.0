From: Massimiliano Marretta <max@marretta.com>
Date: Thu, 27 Feb 2014 22:40:42 +0100
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
Message-ID: <CACP2RPYKf_dVKkiHVsqM4vA-Ox69h0C_Nvt33Q-e5uGP6xDorA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can I use the gpu-viv-bin-mx6q-3.5.7-1.0.0-hfp.bin with the kernel version
3.0.35  ?


2014-02-27 21:42 GMT+01:00 Eric Nelson <eric.nelson@boundarydevices.com>:

> Hi Arnout,
>
> On 02/27/2014 01:16 PM, Arnout Vandecappelle wrote:
>
>> On 02/27/14 09:22, Massimiliano Marretta wrote:
>>
>>> Dear,
>>>
>>> <snip>
>>>
>> >>
>
>> - If I use the last buildroot linaro toolchain 4.8-2013.09, the system
>>> not start because the kernel is to old ( 3.0.35 ).
>>> - If I use the toolchain linaro-4.7-2013.01 the Qt5 qmlscene exit without
>>> message and gpu-viv-bin-mx6q examples not start with the message program
>>> not found.
>>>
>>
>>   I think that gpu-viv-bin-mx6q are softfp libraries, so they won't work
>> with Linaro (hardfp) toolchains. I'm surprised that qt5 builds at all in
>> that case...
>>
>>  The latest patches (on -next) allow for either hardfp or softfp:
>
>         http://git.buildroot.net/buildroot/commit/package/
> freescale-imx/gpu-viv-bin-mx6q?h=next&id=b0b72591d74c1a84b8c1b2e1990a2f
> e1dfe8c4ab
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140227/69fa5c36/attachment.html>
