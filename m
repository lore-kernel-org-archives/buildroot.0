From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 24 Mar 2011 14:11:23 +0100
Subject: [Buildroot] Qt application exit with a segmentation fault
In-Reply-To: <AANLkTinpycp2TKYkDarRuYRyXwddsWSF5e3pFEsy+TKt@mail.gmail.com>
References: <AANLkTin69z_VRHkQDL0Fa7_+Mkc2jXaC5N6bPtg_bwGY@mail.gmail.com>
	<AANLkTi=8mVFacpF=DFoSi3PKfaLf2P+ymw-zRehLZmHG@mail.gmail.com>
	<AANLkTinpycp2TKYkDarRuYRyXwddsWSF5e3pFEsy+TKt@mail.gmail.com>
Message-ID: <AANLkTikHehg=Uuj4A44PW1vVkWj-LZUXD-ibp5wEt5eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 24, 2011 at 2:08 PM, bao bui <buiqbao@gmail.com> wrote:

> Many thanks for your reply,
> I am the one who asked in this thread :)
> It's not work. I modified the qt source (QVariantAnimation source file),
> recompiled and got the same result. It took me about 2 weeks until now
>
Please don't top post. Comment in original email. I have QT4.7.2 cross
compiled with Glibc and have no such issue.
Can give a try tomorrow to recompile with uClibc and test.

>
> BAO
>
>
> On Thu, Mar 24, 2011 at 6:03 AM, Belisko Marek <marek.belisko@gmail.com>wrote:
>
>> On Thu, Mar 24, 2011 at 1:59 PM, bao bui <buiqbao@gmail.com> wrote:
>>
>>> Hi,
>>>
>>> Did any one try Qt application with mini2440? I alway get the
>>> segmentation fault error when exiting the application. Linux and Qt are
>>> compiled with buildroot. How can I fix that?
>>>
>> Did you check: http://friendlyarm.net/forum/topic/2386
>>
>>
>>>
>>> Thank you very much
>>>
>>> BAO
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>> marek
>>
>> --
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> icq: 290551086
>> web: http://open-nandra.com
>>
>
>
marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110324/89b821ad/attachment.html>
