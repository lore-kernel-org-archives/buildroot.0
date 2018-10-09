From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:00:19 +0200
Subject: [Buildroot] [PATCH 4/4] python-pysnmp: bump to version 4.4.6
In-Reply-To: <CALFsTFUy=ZS5vNEA-m7gPizmq6yn6kcN-EUi7gfNpsEUYiesYQ@mail.gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20180922193631.14369-4-asafka7@gmail.com>
 <20181009213706.6e49f620@windsurf>
 <CALFsTFUy=ZS5vNEA-m7gPizmq6yn6kcN-EUi7gfNpsEUYiesYQ@mail.gmail.com>
Message-ID: <20181009220019.6d275c05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Oct 2018 22:54:06 +0300, Asaf Kahlon wrote:

> > > -PYTHON_PYSNMP_VERSION = 4.3.3
> > > +PYTHON_PYSNMP_VERSION = 4.4.6
> > >  PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
> > > -PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/47/b5/c65b9b6fcc36d3f4caca30d3314920f1ca75f5ceecc1f6ae2538ede24511
> > > +PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8b/66/96a49bf1d64ad1e005a8455644523b7e09663a405eb20a4599fb219e4c95
> > >  PYTHON_PYSNMP_SETUP_TYPE = setuptools
> > >
> > >  PYTHON_PYSNMP_LICENSE = BSD-3-Clause
> > > -PYTHON_PYSNMP_LICENSE_FILES = LICENSE.txt
> > > -
> > > -PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto  
> >
> > So these were build time dependencies, and now there are no build time
> > dependencies anymore ? Or was it a bug to list them as build time
> > dependencies ?
> >  
> These packages were not needed as runtime dependencies at all.

As *runtime* dependencies, or *build time* dependencies?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
