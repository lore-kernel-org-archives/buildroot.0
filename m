From: phani teja Movva <phaniteja225@gmail.com>
Date: Thu, 5 Jun 2014 14:49:14 +0530
Subject: [Buildroot] Facing error while cross compiling libglib2 package
 for Xtensa architecture
In-Reply-To: <20140605085046.GJ4193@tarshish>
References: <CAJQMGxGNjUBhZ39BKgOf4vf09F3nyT=O9c4B9pRYOq7+kBuj2Q@mail.gmail.com>
 <20140605085046.GJ4193@tarshish>
Message-ID: <CAJQMGxFMxXr6H6K9bzWmSQyW1gMvt9ztbP0yiRZX9GO1PXdCTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am attaching the config file. please find it.
We don't know the version of buildroot since we bought it as third party
source.


On Thu, Jun 5, 2014 at 2:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi phani teja Movva,
>
> On Thu, Jun 05, 2014 at 02:14:31PM +0530, phani teja Movva wrote:
> > I am trying to cross compile libglib2 package for Xtensa architecture. I
> > enabled locale/gettext and WCHAR in tool chain and libglib2 in packages.
> >
> > I am facing the following issue :
> >
> > ?/usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
> > cannot execute binary file
> > /usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
> > Success
> > make[3]: *** [stamp-gmarshal.h] Error 1
> > make[3]: Leaving directory
> >
> `/home/buildroot-xtensa-HiFi2-Snapshot/build_xtensa_dc233x90/glib-2.12.9/gobject'?
> >
> >  Please help me regard in this issue.
>
> Please attach your .config file so we may try to reproduce your problem.
> Can
> you also share your xtensa overlay?
>
> Which version of Buildroot do you use?
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/a2d7909e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 14690 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/a2d7909e/attachment.obj>
