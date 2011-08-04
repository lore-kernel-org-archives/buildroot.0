From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2011 21:49:23 +0200
Subject: [Buildroot] Arm build: asm error in libffi?
In-Reply-To: <CAFzH18j2mFTzSOrf1S9ChgaJ3cGyoxTOOTtCOuX8prUt5rXLzQ@mail.gmail.com>
References: <CAFzH18j2mFTzSOrf1S9ChgaJ3cGyoxTOOTtCOuX8prUt5rXLzQ@mail.gmail.com>
Message-ID: <20110804214923.37cc66df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 4 Aug 2011 12:40:53 +0300,
Dimitri Kaparis <kaparis.dimitri@gmail.com> a ?crit :

> I'm doing a build for arm using a crosstool-ng generated toolchain
> (gcc 4.4.6, uclibc 0.9.30.3).
> With buildroot-2011.05 I'm getting this:

I guess it's a problem with the toolchain, because here libffi builds
just fine with an ARM CodeSourcery toolchain.

Which binutils version does your toolchain has ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
