From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:01:16 +0200
Subject: [Buildroot]
	svn	commit:trunk/buildroot/target/device/Atmel/Linux:kernel-patches-2.6.22.1
In-Reply-To: <46A3D08D.4070505@tait.co.nz>
References: <20070720082750.D5D413008C@busybox.net>
	<46A3D08D.4070505@tait.co.nz>
Message-ID: <1185433276.31437.32.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-07-23 at 09:47 +1200, Robin Gilks wrote:
> ulf at uclibc.org wrote:
> > Author: ulf
> > Date: 2007-07-20 01:27:49 -0700 (Fri, 20 Jul 2007)
> > New Revision: 19172
> > 
> > Log:
> > Add patch for linux 2.6.22.1
> > 
> > Added:
> >    trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.22.1/
> >    trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.22.1/2.6.22.1-atmel.patch
> > 
> > 
> > Changeset:
> > 
> > Sorry, the patch is too large to include (9725 lines).
> > Please use ViewCVS to see it!
> > 
> > http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19172
> 
> Is there any differentiation between different families of Atmel CPU in 
> the buildroot tree? i.e. does this patchset only apply to AT91 series or 
> does it include AVR32?

Why is these patches not in the kernel-headers directory?

Speaking for the AVR32 support I do not need a separate directory for
AVR32 specific patches. I put all the patches in
toolchain/kernel-headers.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
