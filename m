From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 15:23:39 +0100
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <000601cca9ea$a02df6b0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <20111123092547.2898f799@skate>
 <000601cca9ea$a02df6b0$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111123152339.28275c63@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 23 Nov 2011 08:17:24 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> > Drawbacks: it might actually be *harder* to achieve than
> >   to create a package in Buildroot, and your build process is no
> >   longer nicely integrated.
> 
> Is the 'make modules' idea considered hard?

It doesn't make any sense for Buildroot to provide "make modules". This
is a *Linux* build target, not a *Buildroot* build target. You
certainly don't need Buildroot to provide "make modules" to build
external kernel modules outside of Buildroot.

I would need to look at how EtherCAT works to provide more details here.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
