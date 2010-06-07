From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 11:08:43 +0200
Subject: [Buildroot] [PATCH] cdrkit: fix build by adding zlib as
 dependency
In-Reply-To: <20100607092201.2847fba7@surf>
References: <1275860600-19335-1-git-send-email-bjorn.forsman@gmail.com>
	<20100607092201.2847fba7@surf>
Message-ID: <20100607110843.5a0264ae@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Jun 2010 09:22:01 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> > -CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
> > +CDRKIT_DEPENDENCIES=libcap bzip2 zlib host-cmake
> >  HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2
> 
> If zlib is indeed needed on the target, we also need to add it on the
> host as well, ie:
> 
> HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2 host-zlib

I confirm that zlib is indeed needed to build cdrkit. Can you resend
your patches with the host-zlib addition ?

In that case, your patch would have my

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
