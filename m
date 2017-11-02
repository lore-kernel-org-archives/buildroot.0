From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 2 Nov 2017 22:38:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-networkmanager: Bump
 to version 2.0.1
In-Reply-To: <20171102220948.6a4e757b@windsurf>
References: <20171102210144.27993-1-petr.vorel@gmail.com>
 <20171102220948.6a4e757b@windsurf>
Message-ID: <20171102213829.f45xdbpzr63nnxyk@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Thanks for the respin.
You're welcome.

> > diff --git a/package/python-networkmanager/Config.in b/package/python-networkmanager/Config.in
> > index fcbce5748d..c99f2c31ad 100644
> > --- a/package/python-networkmanager/Config.in
> > +++ b/package/python-networkmanager/Config.in
> > @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_NETWORKMANAGER
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
> >  	depends on BR2_PACKAGE_DBUS # dbus-python
> >  	select BR2_PACKAGE_DBUS_PYTHON
> > +	select BR2_PACKAGE_PYTHON_SIX

> So this one is really just a runtime dependency, as opposed to
> dbus-python, which is a build time dependency. Correct?
IMHO both are runtime dependencies.

Kind regards,
Petr
