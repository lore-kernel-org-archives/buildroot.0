From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2012 16:14:43 +0100
Subject: [Buildroot] gtkmm in buildroot toolchain
In-Reply-To: <loom.20120127T153354-348@post.gmane.org>
References: <loom.20120127T095631-99@post.gmane.org>
 <20120127111928.3e881f03@skate>
 <loom.20120127T145617-861@post.gmane.org>
 <201201270827.51630.minimod@morethan.org>
 <loom.20120127T153354-348@post.gmane.org>
Message-ID: <20120127161443.23b718e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jan 2012 14:38:23 +0000 (UTC),
Willy <willy@willygroup.org> a ?crit :

> > Might be worth the effort of writing another makefile for each,
> > setting your dependencies in the gtkmm makefile to depend on them,
> > then let Buildroot build the entire set.
> 
> That's too much complicated for me :(

I don't think it's that complicated. You simply need to create one
simple .mk file as you did for glibmm, for each of gtkmm, atkmm,
pangomm and cairomm. That should be sufficient.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
