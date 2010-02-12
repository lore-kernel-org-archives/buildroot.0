From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2010 19:38:41 +0100
Subject: [Buildroot] undefined reference to copysignl
In-Reply-To: <13abadeb1002120954l10e05e25y36f5738a02d16d1c@mail.gmail.com>
References: <13abadeb1002120953q24b91634j5f17c9ce93cc634a@mail.gmail.com>
	<13abadeb1002120954l10e05e25y36f5738a02d16d1c@mail.gmail.com>
Message-ID: <20100212193841.530e2caa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2010 17:54:47 +0000
Nuno Pereira <fxss@iol.pt> wrote:

> During buildroot for PPC, I had "undefined reference to  copysignl"
> error, but if I uncheck BR2_GCC_SHARED_LIBGCC it compiles ok.
> 
> Can I somehow use soft float support with shared lib for ppc?

Something like
 http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
maybe ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
