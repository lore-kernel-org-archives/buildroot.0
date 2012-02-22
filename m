From: Tobias Arp <tobiasarp@web.de>
Date: Wed, 22 Feb 2012 13:56:55 +0100 (CET)
Subject: [Buildroot] Build udev for arm -> accept4 undefined reference
Message-ID: <841306327.1348388.1329915415222.JavaMail.fmail@mwmweb063>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi baruch,

thanks i have missed this.

Tobias

-----Urspr?ngliche Nachricht-----
Von: "Baruch Siach" <baruch@tkos.co.il>
Gesendet: 22.02.2012 13:25:56
An: "Tobias Arp" <tobiasarp@web.de>
Betreff: Re: [Buildroot] Build udev for arm -> accept4 undefined reference

>Hi Tobias,
>
>On Wed, Feb 22, 2012 at 01:17:15PM +0100, Tobias Arp wrote:
>> Hi,
>>
>> i am trying to use buildroot-2012.02-rc2 with the attached config file for an arm
>> processor. My custom toolchain was build with crosstool-NG with this config:
>>
>> arm-unknown-linux-gnueabi
>> kernel-headers: linux 3.0
>> binutils 2.19.1
>> gcc 4.3.2
>> glibc 2.9
>
>Quote from the accept(2) man page:
>
> The accept4() system call is available starting with Linux 2.6.28;
> support in glibc is available starting with version 2.10.
>
>So glibc 2.9 is just too old.
>
>baruch
>
>--
> http://baruch.siach.name/blog/ ~. .~ Tk Open Systems
>=}------------------------------------------------ooO--U--Ooo------------{=
> - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -


___________________________________________________________
Ihr WEB.DE Postfach immer dabei: die kostenlose WEB.DE Mail App f?r iPhone und Android.
https://produkte.web.de/freemail_mobile_startseite/
