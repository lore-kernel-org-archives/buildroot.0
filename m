From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:59:02 +0200
Subject: [Buildroot] [PATCH 04/10] external-toolchain: support 64 bits
 glibc toolchains
In-Reply-To: <201006142207.30440.yann.morin.1998@anciens.enib.fr>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<25dbc7e97053c914268f376953019868b35ae49d.1276516273.git.thomas.petazzoni@free-electrons.com>
	<201006142207.30440.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100614225902.668e9f07@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Jun 2010 22:07:30 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> Using readelf(1) on libc.so would give us the exact name of the
> dynamic linker ( but I'm just repeating myself here... :-) )

That's a good idea to investigate. I'll have a look at it, but I'd
prefer if this patch set could get merged as is, and have a look at
this idea afterwards.

Thanks for the hint!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
