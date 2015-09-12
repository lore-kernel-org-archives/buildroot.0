From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Sat, 12 Sep 2015 16:41:37 +0530
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <CAKpDV8tdyO4fJ_=sbfF_sGoU2UzgBFCVSZdAup1QUU=C=VzjAQ@mail.gmail.com>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
 <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
 <55EF09F7.6040401@lucaceresoli.net>
 <CAKpDV8tdyO4fJ_=sbfF_sGoU2UzgBFCVSZdAup1QUU=C=VzjAQ@mail.gmail.com>
Message-ID: <CAKpDV8umsJpoW=M+bduE_7zeY_1V=NxWrnxcaqiYjxS-m51dDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please suggest will it be worth buying these accessories with following
board :--
http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fapi%2Fcore%2Fv3%2Fcontents%2F625493

This LCD supports 16/24 bit RGB TFT display. So will it be compatible with
this board ?


*WIFI_Dongle :--*
http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fcommunity%2Fapi%2Fcore%2Fv3%2Fcontents%3Ffilter%3DentityDescriptor(102%2C68464)
*4.3 LCD MODULE AND ADAPTER BOARD :--*
http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fcommunity%2Fapi%2Fcore%2Fv3%2Fcontents%3Ffilter%3DentityDescriptor(102%2C68483)
*Converter Cable - USB to 3-pin TTL UART :--*
http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fcommunity%2Fapi%2Fcore%2Fv3%2Fcontents%3Ffilter%3DentityDescriptor(102%2C76605)

Regards,
Dinesh

On Tue, Sep 8, 2015 at 11:33 PM, Dinesh Guleria <din.gulu.er@gmail.com>
wrote:

> Thanks for the info.
>
> Regards,
> Dinesh
> On 8 Sep 2015 21:46, "Luca Ceresoli" <luca@lucaceresoli.net> wrote:
>
>> Dear Dinesh,
>>
>> Dinesh Guleria wrote:
>>
>>> So i will go for atmel_sama5d3_xplained .
>>>
>>> http://www.element14.com/community/docs/DOC-38394/l/evaluation-kit-for-at91sam9g45
>>>
>>>  >> I have no idea, but it is fully supported by Buildroot, both for
>>> booting from
>>> SD card and booting from flash.
>>>
>>> With seggers j- link can i flash uboot to the Nand flash of this board ?
>>>
>>
>> To flash the bootloader on the sama5d3_xplained board you don't need
>> any JTAG interface. You just need to remove the NAND CS jumper on the
>> board and connect on UART with the sam-ba tool.
>>
>> The labs from the Free Electrons training material have detailed
>> information on how to do that:
>> http://free-electrons.com/doc/training/embedded-linux/
>>
>> --
>> Luca
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150912/eb3e0727/attachment.html>
