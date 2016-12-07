From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:57:05 +0100
Subject: [Buildroot] [PATCH v7 1/1] rpm: switch to version 4.13.0
In-Reply-To: <20161130233052.6d72115b@free-electrons.com>
References: <20161118185053.11976-1-james.knight@rockwellcollins.com>
 <20161130233052.6d72115b@free-electrons.com>
Message-ID: <20161207235705.258ff2b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 23:30:52 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 13:50:53 -0500, James Knight wrote:
> 
> > -RPM_VERSION_MAJOR = 5.2
> > -RPM_VERSION = $(RPM_VERSION_MAJOR).0
> > -RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
> > -RPM_DEPENDENCIES = host-pkgconf zlib beecrypt neon popt openssl
> > -RPM_LICENSE = LGPLv2.1
> > -RPM_LICENSE_FILES = COPYING.LIB
> > +RPM_VERSION = 4.13.0
> > +RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
> > +RPM_SITE = https://github.com/rpm-software-management/rpm/releases/download/rpm-$(RPM_VERSION)-release
> > +RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
> > +RPM_LICENSE = GPLv2  
> 
> If you read the COPYING file, it's in fact GPLv2, or LGPLv2 but for the
> library only. So I've adjusted the license information here.
> 
> I've applied to next, the rest of the patch seemed reasonable.
> 
> Thanks!
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
