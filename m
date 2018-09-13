From: =?UTF-8?Q?Benjam=C3=ADn_Calder=C3=B3n?= <benj.calderon@gmail.com>
Date: Thu, 13 Sep 2018 14:50:29 -0400
Subject: [Buildroot] [PATCH 1/1] sysvinit: bump to version 2.90
In-Reply-To: <20180913204845.0a8ec10b@windsurf>
References: <20180913041800.7242-1-benj.calderon@gmail.com>
 <20180913204845.0a8ec10b@windsurf>
Message-ID: <CAOt0XSdOjQ8WSSdC-6kyW2ExJ3nwLenGTyJPLd5joLPxLHN8ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You're welcome!

That's my first patch ever, (after lurking for some time now...) and it's
kind of addictive! :-) Working on nfs-utils 2.3.2(3) now.
____
*Benjam?n C. Calder?n*


On Thu, Sep 13, 2018 at 2:48 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Thu, 13 Sep 2018 00:18:00 -0400, Benjamin Calderon wrote:
> > This commit updates sysvinit package using the upstream tarball at
> > http://download.savannah.nongnu.org/releases/sysvinit/ instead of the
> > Debian tarball + patches currently in use
> >
> > Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> > ---
> >  package/sysvinit/0001-fix-libcrypt-test.patch | 20 ----------
> >  .../0002-musl-fix-compilation-errors.patch    | 38 -------------------
> >  package/sysvinit/sysvinit.hash                |  8 ++--
> >  package/sysvinit/sysvinit.mk                  | 17 ++-------
> >  4 files changed, 8 insertions(+), 75 deletions(-)
> >  delete mode 100644 package/sysvinit/0001-fix-libcrypt-test.patch
> >  delete mode 100644
> package/sysvinit/0002-musl-fix-compilation-errors.patch
>
> Applied to master, thanks! And thanks Carlos for taking the time to
> test this patch.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180913/386c1dda/attachment.html>
