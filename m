From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:40:50 +0200
Subject: [Buildroot] [git commit] package/python-pybind: new package
In-Reply-To: <874kqcmnti.fsf@dell.be.48ers.dk>
References: <20200610205210.71B2481F5F@busybox.osuosl.org>
 <874kqcmnti.fsf@dell.be.48ers.dk>
Message-ID: <20200712234050.14cb61d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 23:21:45 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
>  > new file mode 100644
>  > index 0000000000..604cb9ee67
>  > --- /dev/null
>  > +++ b/package/python-pybind/Config.in
>  > @@ -0,0 +1,8 @@
>  > +config BR2_PACKAGE_PYTHON_PYBIND
>  > +	bool "python-pybind"
>  > +	help
>  > +	  PyBind is a lightweight header-only library that exposes C++
>  > +	  types in Python and vice versa, mainly to create Python
>  > +	  bindings of existing C++ code.  
> 
> If this is C++ code then it should presumably depend on
> BR2_INSTALL_LIBSTDCPP?

It's a header-only library, so by itself, it doesn't need C++ to build,
at least that was my understanding. But I think we got some other
comments that say additional work is needed for this package to be
fully useful. I haven't had the chance to look into them in detail
though.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
