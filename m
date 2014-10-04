From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:52:59 +0200
Subject: [Buildroot] [PATCH 05 of 15] packages: rename
 FOO_INSTALL_HOST_OPT into FOO_INSTALL_HOST_OPTS
In-Reply-To: <20140927221506.GO4298@free.fr>
References: <patchbomb.1411846357@localhost>
 <ba7545d68ae2f0383285.1411846362@localhost>
 <20140927221506.GO4298@free.fr>
Message-ID: <20141004185259.034d99a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Sep 2014 00:15:06 +0200, Yann E. MORIN wrote:

> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -41,7 +41,7 @@
> >  $(2)_MAKE			?= $$(MAKE)
> >  $(2)_MAKE_ENV			?=
> >  $(2)_MAKE_OPTS			?=
> > -$(2)_INSTALL_HOST_OPT		?= install
> > +$(2)_INSTALL_HOST_OPTS		?= install
> 
> The other infras do not use a 'HOST_' in the middle of host-variant
> variables; 'HOST_' is only present at the beginning.
> 
> For example, we have HOST_LIBFOO_INSTALL_CMDS that contrasts to
> LIBFOO_INSTALL_{TARGET,STAGING,IMAGES}_CMDS.
> 
> So, I find there is a bit of discrepancy in this variable naming. Plus,
> it is not documented in the manual.
> 
> Samuel, is there a reason for the naming of this variable?

I fully agree with Yann comments here. Samuel, could you answer Yann's
question?

Is anyone willing to cook a patch to fix this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
