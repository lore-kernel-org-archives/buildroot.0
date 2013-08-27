From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 27 Aug 2013 11:26:38 +0200
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>,
 <521C5ABF.4000301@relinux.de>
 <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>
Message-ID: <521C70CE.4060101@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.08.2013 10:32, schrieb hacklinux:
> i see two more parameters should be given somewhere in the buildroot
> project, however where should i put these two paremeters, please give
> me some advice, thx.
> MYPKG_SITE = /opt/software/something-special/
> MYPKG_SITE_METHOD = local
This is when you modify the mypkg.mk file, what you probably do not want
to do.

Just read the next chapter.
>
>
> > Date: Tue, 27 Aug 2013 09:52:31 +0200
> > From: sho at relinux.de
> > To: buildroot at busybox.net
> > Subject: Re: [Buildroot] wanna compile busybox and uclib with self
> modified code, please help
> >
> > Am 27.08.2013 09:42, schrieb hacklinux:
> > > Hi thomas,
> > >
> > > i have a question concerning buildroot compiling wanna u help . the gz
> > > pacakge version which i used is buildroot-2012.11.1.tar.gz, i know how
> > > to build kernel, busybox, initrd following guildlines posted on web
> > > that puts all sort of items under dl directory and just make it.
> > > however, i wanna compile the busybox and uclib with some modification
> > > made by myself, i made several attemps but all failed, can u give me
> > > some advice on how to do this, wanna hear from u, sincely thank u
> indeed .
> > Hello William,
> >
> > you might want to look at
> > http://free-electrons.com/blog/buildroot-2011-11/ , especially the
> > source directory override mechanism.
> >
> > Regards
> >
> > Stephan
> > >
> > > william wang
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> > --
> > reLinux - Stephan Hoffmann
> > Am Schmidtgrund 124 50765 K?ln
> > Tel. +49.221.95595-19 Fax: -64
> > www.reLinux.de sho at reLinux.de
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130827/1f1293d4/attachment-0001.html>
