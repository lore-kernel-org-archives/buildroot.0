From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 21:59:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lxc: security bump to
 version 3.2.1
In-Reply-To: <CAPi7W81xxDaUW8jK2tpNeE7uifZ5=S-U3mfZQ5t9fiWAwTeZSw@mail.gmail.com>
References: <20190816170315.8763-1-fontaine.fabrice@gmail.com>
 <20190817154123.377b3d77@windsurf.home>
 <CAPi7W81xxDaUW8jK2tpNeE7uifZ5=S-U3mfZQ5t9fiWAwTeZSw@mail.gmail.com>
Message-ID: <20190817215903.081b1e7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter in Cc.

On Sat, 17 Aug 2019 21:36:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Hello Thomas,
> 
> Le sam. 17 ao?t 2019 ? 15:41, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > On Fri, 16 Aug 2019 19:03:15 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >  
> > > - lxc switched from gnutls to openssl since version 3.2.0 and
> > >   https://github.com/lxc/lxc/commit/fa2bb6ba532c5e7f92df8cbae50a68af519f9997
> > > - lxc needs a glibc or musl toolchain since version 3.2.0 and
> > >   https://github.com/lxc/lxc/commit/6400238d08cdf1ca20d49bafb85f4e224348bf9d
> > > - This version includes a security fix (named CVE-2019-5736 on runC):
> > >   https://github.com/lxc/lxc/commit/6400238d08cdf1ca20d49bafb85f4e224348bf9d
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> >
> > We normally apply security bumps to master. But this one seems like a
> > quite major bump, and it also disables the package for uClibc.  
> Yes I know that's why I marked it for next.
> >
> > Does it make sense to backport just the security fix in master ?  
> I could but this fix will add the glibc or musl toolchain dependency.

OK, so let's bring Peter Korsgaard in Cc. Since he maintains the
stable/LTS branches, it is important to get his call on this issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
