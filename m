From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:26:24 +0100
Subject: [Buildroot] [PATCH 1/5] libxmlrpc: bump to 1.25.30
In-Reply-To: <20141227155648.GE4098@free.fr>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141227155648.GE4098@free.fr>
Message-ID: <20141227172624.58b77c6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 27 Dec 2014 16:56:48 +0100, Yann E. MORIN wrote:

> > -LIBXMLRPC_VERSION = 1.25.26
> > +LIBXMLRPC_VERSION = 1.25.30
> >  LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
> >  LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
> 
> Since we do get a lot of dowenload issues with sourceforge, could you
> take this opportunity to add a .hash file for libxmlrpc?

Good point. I've just sent a v2 which adds this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
