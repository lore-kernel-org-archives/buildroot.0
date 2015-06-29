From: Denis Thulin <denis.thulin@openwide.fr>
Date: Mon, 29 Jun 2015 10:49:24 +0200 (CEST)
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <20150628161433.3b075437@free-electrons.com>
Message-ID: <945373162.2243254.1435567764904.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Mon, 28 Jun 2015 16:14:04 +0200, Denis THULIN wrote:
> Dear Denis THULIN,
> 
> On Mon, 15 Jun 2015 12:06:04 +0200, Denis THULIN wrote:
> 
> > diff --git a/package/python-robotframework/Config.in
> > b/package/python-robotframework/Config.in
> > new file mode 100644
> > index 0000000..fe95eea
> > --- /dev/null
> > +++ b/package/python-robotframework/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
> > +	depends on BR2_PACKAGE_PYTHON
> 
> So it only works with Python 2. What about using
> https://pypi.python.org/pypi/robotframework-python3 instead, which
> seems to support both Python 2 and Python 3 ? Or maybe this is not an
> "official" version ?

According to the Robot Framework install instructions, the Python 3 port is an
unofficial one.
see: https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#introduction

It is also not up to date as the python 3 port is 3 versions late.
I could make a different package for it though.

> 
> I'll mark your patch as Changes Requested in patchwork. Can you
> resend
> an updated version that takes into account the comments from Arnout?

I'm working on it, but as it is my test package for scanpypi, I might not submit
it before the end of the week.

Regards,

> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
