From: Arnar Mar Sig <antab@valka.is>
Date: Fri, 14 Nov 2008 12:47:58 +0100
Subject: [Buildroot] [RFC] moving audio and video packages into a
	new	category 'multimedia'
In-Reply-To: <COL102-DS1586696D3AE21579640C10DC160@phx.gbl>
References: <200811140813.57041.markus.heidelberg@web.de>	<20081114092706.4e11413d@hcegtvedt>
	<200811141003.19394.markus.heidelberg@web.de>
	<COL102-DS1586696D3AE21579640C10DC160@phx.gbl>
Message-ID: <9DA31EAF-25F4-4EB3-BD8D-4229AD7DE022@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I also think that the package dir structure should reflect the menus  
and no packages should be directly under packages/

IMO the organization of package that FreeBSD ports has is really good  
and can be used as template for our package dir structure.
Also FreeBSD ports does NOT rename packages like most linux package  
systems do (and annoys the hell out of me). Like libgtk, the softwares  
name is GTK not libgtk so the package should be named gtk to make  
looking for it easier.

On Nov 14, 2008, at 11:29 AM, Daniel Laird wrote:

> I made some suggestions some time ago and started the move with  
> audio and
> games.
>
> I also proposed a large clean up of the huge BR2_GRAPHICS menu which  
> is a
> bit large.
>
> I also believe that no packages should be under package directly.
>
> I think we should create a directory skeleton on here.  Get  
> agreement and
> make the big move
> Cheers
> Daniel Laird
>
>
> -----Original Message-----
> From: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org 
> ] On
> Behalf Of Markus Heidelberg
> Sent: 2008 Nov 14 09:03
> To: Hans-Christian Egtvedt
> Cc: buildroot at uclibc.org
> Subject: Re: [Buildroot] [RFC] moving audio and video packages into  
> a new
> category 'multimedia'
>
> Hans-Christian Egtvedt, 14.11.2008:
>> On Fri, 14 Nov 2008 08:13:56 +0100
>> Markus Heidelberg <markus.heidelberg@web.de> wrote:
>>
>>> Hi,
>>>
>>> I'm currently working on some video stuff and would like to put new
>>> packages together with the 'audio' category into a new category
>>> 'multimedia'. As far as I can see currently affected are
>>> package/audio, mplayer and vlc. Mplayer and vlc are in the  
>>> 'graphics'
>>> category, that seems to be a bit odd.
>>>
>>
>> I would love to see the entire package selection cleaned up and  
>> grouped
>> into sane sub groups. Mostly the kconfig part of it, but the package
>> directory structure should reflect kconfig IMHO.
>
> Should we even go so far that not a single package should live under
> package/
> directly any more, but all packages under package/<category>/ ?
>
> I think so. And BusyBox works the same way.
>
> Markus
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Greets
	Arnar Mar Sig
	Valka ehf
