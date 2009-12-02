From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 2 Dec 2009 07:03:07 -0600
Subject: [Buildroot] Shared objects, load order?
In-Reply-To: <op.u4bal6mdyqa4qb@jap>
References: <op.u4auhacnyqa4qb@jap> <200912020644.43103.minimod@morethan.org>
	<op.u4bal6mdyqa4qb@jap>
Message-ID: <200912020703.09342.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 2 2009, Joachim Pihl wrote:
> On Wed, 02 Dec 2009 13:44:40 +0100, Michael S. Zick <minimod@morethan.org>  
> wrote:
> >
> > Did you enable sstrip?
> > The sstrip in the 2009.8 (and probably in 2009.11, since I never saw it  
> > fixed)
> > creates object (and statically linked) objects with corrupted headers.
> >
> > Turn it off, rebuild, report back.
> 
> BR2_PACKAGE_SSTRIP_HOST enabled, BR2_PACKAGE_SSTRIP_TARGET disabled, but  
> BR2_STRIP_strip is the one used.
> 
> Will rebuild anyway with BR2_PACKAGE_SSTRIP_HOST disabled, but I doubt it  
> should make any difference.
> 

The "file" command will report the corrupted headers if present.
Just "file" some old/new objects.

Mike
