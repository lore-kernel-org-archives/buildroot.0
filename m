From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 13:35:53 +0200
Subject: [Buildroot] Question concerning buildroot-libtool.patch
In-Reply-To: <20100624092558.428c8478@surf>
References: <201006240057.46368.PeterHuewe@gmx.de>
	<20100624092558.428c8478@surf>
Message-ID: <201006241335.53291.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas > Something must have changed somewhere :)
Yeah that might be possible - since I can't get it to work with an older 
version of buildroot either.

As my development system is my normal home pc, it is quite prune to updates 
and changes :) 
Since I've just graduated and thus unemployed setting up a dedicated 
development environment isn't an option unfortunately :/

Thomas > You can use <pkg>_LIBTOOL_PATCH=NO to disable the 
Thomas > buildroot-libtool.patch on > this  specific <pkg>.

Seems to work - I'll create a new patch for pidgin, including a version bump 
too :)


Thanks,
Peter



Am Donnerstag 24 Juni 2010 09:25:58 schrieb Thomas Petazzoni:
> Hello,
> 
> On Thu, 24 Jun 2010 00:57:46 +0200
> 
> Peter H?we <PeterHuewe@gmx.de> wrote:
> > It used to work with an older version of Buildroot (~ git 2010-05-14) -
> > but as far as I can see nothing has changed on the patch / or the pidgin
> > source I've used.
> 
> I don't see how it's possible that the same patch doesn't apply on the
> same codebase as before. Our buildroot-libtool.patch hasn't changed for
> years. 
> 
> > Any ideas how I can fix this? Unfortunately I'm not that into the whole
> > buildroot system (yet, but I'd like to learn and contribute to it).
> 
> You can use
> 

> 
> Regards,
> 
> Thomas
> 
