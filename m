From: daggs <daggs@gmx.com>
Date: Thu, 9 Jun 2016 10:38:03 +0200
Subject: [Buildroot] [PATCH 1/2] libamcodec: New Package
In-Reply-To: <20160609101839.381a8a56@free-electrons.com>
References: <20160609074644.4976-1-daggs@gmx.com>,
 <20160609101839.381a8a56@free-electrons.com>
Message-ID: <trinity-f61c5da6-a1c0-4fa7-83f2-52b0c53d0a9c-1465461483817@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> 
> On Thu,  9 Jun 2016 10:46:43 +0300, Dagg Stompler wrote:
> 
> > diff --git a/package/libamcodec/0001-fix_flags_in_makefile.patch b/package/libamcodec/0001-fix_flags_in_makefile.patch
> > new file mode 100644
> > index 0000000..e64c4d7
> > --- /dev/null
> > +++ b/package/libamcodec/0001-fix_flags_in_makefile.patch
> 
> Patches need a description + Signed-off-by. Since the package is
> fetched from Git, please make it a Git formatted patch (i.e make a Git
> commit, and run "git format-patch HEAD^").
> 
ok, I'll do that.

> > diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
> > new file mode 100644
> > index 0000000..1e0bcb6
> > --- /dev/null
> > +++ b/package/libamcodec/libamcodec.mk
> > @@ -0,0 +1,33 @@
> > +################################################################################
> > +#
> > +# libamcodec
> > +#
> > +################################################################################
> > +
> > +LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
> > +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> > +LIBAMCODEC_DEPENDENCIES = alsa-lib
> 
> Has the license situation been resolved? I know you contacted upstream
> about his. Any feedback?
> 
not yet, I can try to contact the dev in charge again.

> > +
> > +# This package uses the M_PREFIX variable to construct the header and
> 
> M_PREFIX or PREFIX
> 
> (you use PREFIX when building in the amcodec subdirectory)
> 
update the comment you mean?

> > +# # library paths used when compiling
> 
> duplicate # sign.
> 
will fix.

Dagg.
