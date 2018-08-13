From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:34:21 +0200
Subject: [Buildroot] [PATCH 15/17] perl-module-build: add target
In-Reply-To: <CAB0FRst9-NvVTEFnEjt178Dv7p_pmxzPyQmucyA4-nyeVaYUdg@mail.gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-16-chrismcc@gmail.com>
 <CAB0FRst9-NvVTEFnEjt178Dv7p_pmxzPyQmucyA4-nyeVaYUdg@mail.gmail.com>
Message-ID: <20180813233421.0cc3a4db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 10:07:54 +0200, Fran?ois Perrad wrote:

> > diff --git a/package/perl-module-build/Config.in
> > b/package/perl-module-build/Config.in
> > new file mode 100644
> > index 0000000000..ee4354cc6a
> > --- /dev/null
> > +++ b/package/perl-module-build/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_PERL_MODULE_BUILD
> > +       bool "perl-module-build"
> > +       help
> > +         Build and install Perl modules
> >  
> 
> On Buildroot, we never need this package on target.

Christopher, any comment on this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
