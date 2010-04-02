From: Damien Borie <dbe@terawatt.fr>
Date: Fri, 02 Apr 2010 13:49:23 +0200
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB4B9F3.2010905@terawatt.fr>
References: <4BB1EE15.6000505@browserseal.com>
	<4BB1F87D.4050706@terawatt.fr>	<4BB1FA0F.5070703@carallon.com>
	<4BB20147.50404@terawatt.fr>	<4BB4B0D7.4080002@carallon.com>
	<4BB4B9F3.2010905@terawatt.fr>
Message-ID: <4BB5D9C3.1020209@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It's working fine! I only changed X11-commercial to X11-opensource and 
it's ok. I got problems with font or encoding but it will be cleared 
soon I think.
Thank you, your patch was very useful.

Regards,

Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE 

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11 



Damien Borie a ?crit :
> Hi,
>
> Thanks a lot. I'll look at it  now and tomorrow and see what I need to 
> change (to use open source QT for example).
>
> Thank you for your help.
>
> Damien Borie
>
> TERAWATT / AENERGIA S.A.S.
> ZA DUBOSCOA
> 64990 Villefranque
> FRANCE
> tel : +33 (0)5 59 44 26 08
> fax : +33 (0)5 59 31 15 11
>
>
> Will Wagner a ?crit :
>> On 30/03/2010 14:48, Damien Borie wrote:
>>> Hi,
>>>
>>> Thank you for your answer.
>>> If you can send it it's great. But maybe you can first say me what 
>>> the modifications are?
>>> Modifying some line in configure file may be sufficient for some 
>>> test? I noticed an option PLATFORM_X11...
>>> I could always make it cleaner when you send your clean patch but if 
>>> there is only a few things to change I can do it dirtily for now and 
>>> continue working.
>> Damien,
>>
>> Attached is my patch to get this working. he main thing to do is to 
>> trick the build into thinking it is doing a cross compile even though 
>> it is building for XOrg. Although not officially support the 
>> Trolltech guys confirmed that it should work.
>>
>> There are various bits i the patch you may not like, not least that 
>> it is setup for a commercial Qt license.
>>
>> Will.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
