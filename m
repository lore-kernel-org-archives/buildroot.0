From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 24 Aug 2012 10:36:57 +0800
Subject: [Buildroot] Busybox Mips
In-Reply-To: <CAN5RZzLr+vGuiVw4oRGF40bvvZ33gaxPt_LvSLBvauOmEK7PZw@mail.gmail.com>
References: <CAN5RZzLtbpQ30PAgpuNj_hGF6Eia42ZvxgH3Emh3AESHU-1C=g@mail.gmail.com>
 <CAN5RZz+SZeqpeZ6vBPT63Gj7k2sozQ9sCk5sogKBs+O-JA2ixA@mail.gmail.com>
 <CAJhJPsWaU1B_Cq=ZJZQrqUzaHt_JGq4khPj=kDpM37hVLT0YKg@mail.gmail.com>
 <CAN5RZzLr+vGuiVw4oRGF40bvvZ33gaxPt_LvSLBvauOmEK7PZw@mail.gmail.com>
Message-ID: <CAJhJPsU3eUkJf=Yqr6E9tP9ZGRzY-L20XkaXa5Sk3k-QZ-804Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 1.18.x was marked as deprecated in this April.
I'm afraid you need to downgrade to 2012.02 or earlier.
Otherwise, you have to modify package/busybox/Config.in manually.

2012/8/23 Francisco Prado <panchopapadezoe@gmail.com>

> Dear Kelvin.
> Thanks for answering.
> Read the manual before posting my question.
> The manual is not the answer of my question, or I did not understand.
> That version of "buildroot" this pre-configurated for "Busybox 1.20.x or
> 1.19.x".
> I need 1.18.2
> Thanks.
>  El 23/08/2012 00:17, "Kelvin Cheung" <keguang.zhang@gmail.com> escribi?:
>
> Please refer to the user manual.
>> http://buildroot.uclibc.org/downloads/manual/manual.html
>>
>> 2012/8/23 Francisco Prado <panchopapadezoe@gmail.com>
>>
>>> Please guide me to compile Busybox 1.18.2 for Android Tablet Ainol Novo
>>> Basic 32r2 little endian MIPS.
>>> I have
>>> apt-get install subversion
>>> apt-get install gcc
>>> apt-get install g++
>>> apt-get install libc6-dev
>>> apt-get install bison
>>> apt-get install flex
>>> apt-get install gettext
>>> apt-get install libncurses5-dev
>>> apt-get install texinfo
>>>
>>> Which version of buildroot I use for this?
>>>
>>> I have already installed "stable BUILDROOT 5.2012"
>>>
>>> From already thanks.
>>>
>>> SORRY FOR MY BAD ENGLISH.
>>>
>>> Francisco Prado
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>>
>>
>> --
>> Best Regards!
>> Kelvin
>>
>>
>>
>>


-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120824/070ab304/attachment.html>
