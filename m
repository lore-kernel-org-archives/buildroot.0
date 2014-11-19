From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 Nov 2014 21:28:27 +0100
Subject: [Buildroot] [PATCH v3 1/4] libevdev: bump version to 1.3.1
In-Reply-To: <20141119140111.2025aba7@free-electrons.com>
References: <1415989875-22535-1-git-send-email-ps.report@gmx.net>,
 <20141119140111.2025aba7@free-electrons.com>
Message-ID: <trinity-5bc1664f-0d4b-4625-bee8-2dd8fce3f01c-1416428906971@3capp-gmx-bs67>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Mittwoch, 19. November 2014 um 14:01 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v3 1/4] libevdev: bump version to 1.3.1
>
> Dear Peter Seiderer,
> 
> On Fri, 14 Nov 2014 19:31:12 +0100, Peter Seiderer wrote:
> > See [1] and [2] for details.
> > 
> > [1] http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html
> > [2] http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I've applied this series to the next branch, thanks. Note that on PATCH
> 3/4, I dropped EVEMU_AUTORECONF = YES from evemu.mk, since it was no
> longer necessary: your patch switches from Git to a tarball, which has
> the configure script already generated, and we no longer have any
> patches that could touch configure.ac or Makefile.am and therefore
> require an autoreconf.
> 

Good catch, and many thanks for the on-the-fly fix...

Regards,
Peter

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
