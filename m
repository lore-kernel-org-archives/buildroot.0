From: Malek <souf_oued@yahoo.fr>
Date: Thu, 07 Aug 2008 19:57:04 +0000
Subject: [Buildroot] GPSD package
In-Reply-To: <4899B742.4050706@gmail.com>
References: <4898BAF3.3000800@gmail.com>	<f90898420808060046v4cae4952yd705f158e78fcd32@mail.gmail.com>
	<4899B742.4050706@gmail.com>
Message-ID: <489B5390.7070501@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I use these files: gpsd.mk and Config.in
and I add:
source "package/gpsd/Config.in"

in: package/Config.in just after :

source "package/gadgetfs-test/Config.in"

Malek

Leonardo Giordano a ?crit :
> Hi Simon,
> It works great! It was a big help to me.
> Many thanks!
> Best regards,
> 
> Leo
> 
> Simon Pasch escribi?:
>> Hi,
>>
>> I'm using this Makefile.
>>
>> Perhaps, it needs some finetuning, but it works for me.
>>
>>
>> Simon
>>
>>
>>
>> 2008/8/5 Leonardo Giordano <lgiordano@gmail.com>:
>>   
>>> Hi,
>>> I am trying to add gpsd package (http://gpsd.berlios.de/) but I am
>>> having trouble on doing the gpsd.mk file. I just want the daemon,
>>> nothing more.
>>> Has anybody been successful on this?
>>> Any comments will be appreciated.
>>>
>>> Best wishes from Argentina!
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>>
>>>     
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in
Url: http://busybox.net/lists/buildroot/attachments/20080807/df4b1854/attachment.txt 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: gpsd.mk
Url: http://busybox.net/lists/buildroot/attachments/20080807/df4b1854/attachment-0001.txt 
