From: Damien Borie <dbe@terawatt.fr>
Date: Tue, 30 Mar 2010 15:48:55 +0200
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB1FA0F.5070703@carallon.com>
References: <4BB1EE15.6000505@browserseal.com> <4BB1F87D.4050706@terawatt.fr>
	<4BB1FA0F.5070703@carallon.com>
Message-ID: <4BB20147.50404@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thank you for your answer.
If you can send it it's great. But maybe you can first say me what the 
modifications are?
Modifying some line in configure file may be sufficient for some test? I 
noticed an option PLATFORM_X11...
I could always make it cleaner when you send your clean patch but if 
there is only a few things to change I can do it dirtily for now and 
continue working.

Thanks.

Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE 

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11 



William Wagner a ?crit :
> On 30/03/2010 14:11, Damien Borie wrote:
>> Hello,
>>
>> I have a simple question : is Qt Embedded compatible with Xorg?
>> I have an application made for Qt Embedded with Framebuffer, and I 
>> had to change my distribution to use the server X Xorg, but now the 
>> application isn't working.
>> Of what I see when searching, I'm afraid I must use QT and not QT 
>> Embedded, and as it's not included in Buildroot, I'm a bit reticent...
>> Is there any option I don't know which allows to use X server?
>
> You need to use Qt compile for X11 for it to work with XOrg. I have 
> modified Qt in my tree to make it an option to build for X. Give me a 
> couple of days and I'll calean it up and send it to the list.
>
> Will
>
