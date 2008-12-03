From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 16:21:11 -0500 (EST)
Subject: [Buildroot] [PATCH] allow module-init-tools on uClinux
In-Reply-To: <20081203210728.GE8563@mx.loc>
References: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
	<20081203210728.GE8563@mx.loc>
Message-ID: <alpine.LFD.2.00.0812031618170.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Dec 2008, Bernhard Reutner-Fischer wrote:

> On Wed, Dec 03, 2008 at 03:47:47PM -0500, Nicolas Pitre wrote:
> >Matching *-*-linux* is too restrictive.
> 
> yes, but
> 1) you would be better off to set BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y in
> your toplevel .config, i.e. use the busybox module tools.

That won't help me at all for the _cross_ installation of kernel 
modules.

> 2) The current version is 3.5
> 3) Please fix this upstream, iff it is still required for 3.5

Eventually.  In the mean time this allows for the kernel to build and 
its modules to be installed.


Nicolas
