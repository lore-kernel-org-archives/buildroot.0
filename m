From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 14 Nov 2008 10:03:19 +0100
Subject: [Buildroot] [RFC] moving audio and video packages into a new
	category 'multimedia'
In-Reply-To: <20081114092706.4e11413d@hcegtvedt>
References: <200811140813.57041.markus.heidelberg@web.de>
	<20081114092706.4e11413d@hcegtvedt>
Message-ID: <200811141003.19394.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Should we even go so far that not a single package should live under package/
directly any more, but all packages under package/<category>/ ?

I think so. And BusyBox works the same way.

Markus
