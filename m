From: Daniel Laird <danieljlaird@hotmail.com>
Date: Fri, 14 Nov 2008 10:29:11 +0000
Subject: [Buildroot] [RFC] moving audio and video packages into a
	new	category 'multimedia'
In-Reply-To: <200811141003.19394.markus.heidelberg@web.de>
References: <200811140813.57041.markus.heidelberg@web.de>	<20081114092706.4e11413d@hcegtvedt>
	<200811141003.19394.markus.heidelberg@web.de>
Message-ID: <COL102-DS1586696D3AE21579640C10DC160@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I made some suggestions some time ago and started the move with audio and
games.

I also proposed a large clean up of the huge BR2_GRAPHICS menu which is a
bit large.

I also believe that no packages should be under package directly.

I think we should create a directory skeleton on here.  Get agreement and
make the big move
Cheers
Daniel Laird


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Markus Heidelberg
Sent: 2008 Nov 14 09:03
To: Hans-Christian Egtvedt
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] [RFC] moving audio and video packages into a new
category 'multimedia'

Hans-Christian Egtvedt, 14.11.2008:
> On Fri, 14 Nov 2008 08:13:56 +0100
> Markus Heidelberg <markus.heidelberg@web.de> wrote:
> 
> > Hi,
> > 
> > I'm currently working on some video stuff and would like to put new
> > packages together with the 'audio' category into a new category
> > 'multimedia'. As far as I can see currently affected are
> > package/audio, mplayer and vlc. Mplayer and vlc are in the 'graphics'
> > category, that seems to be a bit odd.
> > 
> 
> I would love to see the entire package selection cleaned up and grouped
> into sane sub groups. Mostly the kconfig part of it, but the package
> directory structure should reflect kconfig IMHO.

Should we even go so far that not a single package should live under
package/
directly any more, but all packages under package/<category>/ ?

I think so. And BusyBox works the same way.

Markus

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
