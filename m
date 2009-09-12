From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sat, 12 Sep 2009 08:03:22 -0700
Subject: [Buildroot] Configure linux kernel within buildroot
In-Reply-To: <90F28E49-FCA0-4AD2-9884-3BEF12EF93DE@gmail.com>
References: <F239D13E-838F-4CA7-9AAE-D79234BBAD0A@gmail.com>
	<4AABB314.9070507@ethertek.ca>
	<90F28E49-FCA0-4AD2-9884-3BEF12EF93DE@gmail.com>
Message-ID: <4AABB83A.1050705@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

Hey, your right, its not in there. In the main make file, if you type 
out make help, it lists some configuration options. I either saw it 
there or read it on the list here somewhere.

Best Regards,
Dan Pattison
EtherTek Circuits 


Ben Coughlan wrote:
> Thanks Dan.  I was hoping there was a 'make linux26-menuconfig'.
>
> I would like to point out that it doesn't appear on the docco you 
> linked (I did spend quite some time scouring it :P).
>
> Cheers,
> Ben Coughlan
>
> On 13/09/2009, at 12:41 AM, Dan Pattison wrote:
>
>> Hi Ben,
>>
>> To build your kernel and images, simply type out    make    from your 
>> buildroot main folder.
>> To configure main buildroot settings type:    make menuconfig
>> To configure kernel settings type:   make linux26-menuconfig
>> To configure busybox type:   make busybox-menuconfig
>> To configure uclibc type:   make uclibc-menuconfig
>>
>> Some good docs can be found here: 
>> http://buildroot.uclibc.org/buildroot.html
>>
>> Best Regards,
>> Dan Pattison
>> EtherTek Circuits
>>
>>
>> Ben Coughlan wrote:
>>> Hi All,
>>>
>>> I'm fairly new to Buildroot and I have a sufficiently newbie 
>>> question to ask.
>>>
>>> How do I configure the kernel buildroot produces?  The first 'make' 
>>> gave me a menuconfig for the kernel but I don't know how to get it 
>>> back or alter the cached config.
>>>
>>> Any hints?
>>>
>>> Regards,
>>> Ben Coughlan
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>> ------------------------------------------------------------------------ 
>>>
>>>
>>>
>>> No virus found in this incoming message.
>>> Checked by AVG - www.avg.com Version: 8.5.409 / Virus Database: 
>>> 270.13.91/2363 - Release Date: 09/11/09 09:15:00
>>>
>>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.5.409 / Virus Database: 270.13.93/2365 - Release Date: 09/12/09 06:37:00
>
>   

-- 
Dan Pattison
Ethertek Circuits
