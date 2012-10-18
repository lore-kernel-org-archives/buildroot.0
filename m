From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Oct 2012 15:42:40 +0200
Subject: [Buildroot] Confused by the <fenv> implementation,
 causing gsl build issues
In-Reply-To: <13a6153e698.7e7.2760.rep.dot.nop@gmail.com>
References: <20121014120429.52067fdc@skate>
 <13a6153e698.7e7.2760.rep.dot.nop@gmail.com>
Message-ID: <20121018154240.25b7a7e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 15 Oct 2012 00:10:19 +0200, Bernhard Reutner-Fischer wrote:

> > uClibc provides a UCLIBC_HAS_FENV option that can be enabled on any
> > architecture.
> 
> Fenv is IIRC only implemented for i386.

Ok, but then why it can be selected on other architectures, and why
does it install <fenv.h> even on architectures where it is not
supported?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
