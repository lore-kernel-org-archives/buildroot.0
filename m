From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 11 Sep 2007 00:25:11 +0300
Subject: [Buildroot] building tiny-x or x11R7 with latest snapshot
In-Reply-To: <20070827162427.2c3bb806@newbox>
References: <022b01c7e35f$9df9f1b0$2600a8c0@engineering5>	<0ad801c7e382$8bb6dfe0$dcc4af0a@atmel.com>	<12306984.post@talk.nabble.com>	<39814.127.0.0.1.1188045975.squirrel@localhost>	<01cc01c7e757$3e1bf8a0$7201820a@atmel.com>
	<20070827162427.2c3bb806@newbox>
Message-ID: <46E5B637.5020403@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan Kuten ?????:

Hello guys,

I reproduced build of buildroot with libgtk2 and x11r7 support.
Please see a patch in the attachement.
If needed I can split it into chunks for easier review.

Best regards,
Ivan

> On Sat, 25 Aug 2007 21:55:10 +0200
> Ulf Samuelsson wrote:
> 
>>>> Hi Ulf,
>>>>
>>>>   If we cant build either Tinyx or Xorg or X11 then how else can we build
>>>> cairo,pango,gtk and other stuff. i am trying to build a decent toolchain
>>>> with all library for arm926ejs but i see that most of these are not
>>>> supported for am926ejs
>>>>
>>>>   Is there any possibilities that i can build just cairo pango gtk2 without
>>>> the need for x softwares. Once i build all this later can we integrate these
>>>> with x softwares.
>>>>
>>> Hello all,
>>>
>>> I managed to build cairo, pango and gtk2 but with dependency on DirectFB - I need
>>> to modify flags to configure and dependencies. TinyX is buildable but seems only
>>> gtk-1.2 run on top of it. Xorg-7.2 and X11-R6 are not buildable and require a lot of hands work.
>>>
>> Pls send your modifications so they can be integrated, then.
>>
>> Best Regards
>> Ulf Samuelsson
> 
> Hi, unfortunately it was an ugly hack not suitable to be released as patch and I 
>  deleted/rebuilded buildroot many times since then. I try in upcoming week or next week to arrive with something
>  suitable to be applied.
> 
> Best regards,
> Ivan
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: gtk_x11r7.patch
Type: text/x-diff
Size: 13996 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070911/62f0b138/attachment.bin 
