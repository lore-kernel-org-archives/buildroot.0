From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:29:41 +0100
Subject: [Buildroot] [PATCH v4 08/17] python-shutilwhich: new package
In-Reply-To: <20160219222914.3e55c802@free-electrons.com>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-9-git-send-email-mc5686@mclink.it>
 <20160219222914.3e55c802@free-electrons.com>
Message-ID: <20160219222941.45b9a5f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Feb 2016 22:29:14 +0100, Thomas Petazzoni wrote:
> Dear Mauro Condarelli,
> 
> On Sat,  6 Feb 2016 23:59:54 +0100, Mauro Condarelli wrote:
> 
> > +PYTHON_SHUTILWHICH_VERSION = 1.1.0
> > +PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
> > +PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
> > +PYTHON_SHUTILWHICH_LICENSE = MIT
> 
> This license information was not correct. The PKG-INFO files says it's
> under the PSF license.
> 
> It would be good if you could ask the upstream author to include a
> license file in his project source code.

Forgot to say the most important: applied to next, after fixing the
license information.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
