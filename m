From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 5 Mar 2008 11:28:57 -0600
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
	<20080305165910.GA1935@real.realitydiluted.com>
	<c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
Message-ID: <20080305172857.GB1935@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> So is not possible to use the toolchain that is currently installed on my
> linux pc?
> Must I download binutils, gcc etc etc to compile a brand new toolchain
> (following the instructions provided in some cross-compiler how-to)?
> 
You can certainly use your installed toolchain, yes. Configure buildroot
to use an external toolchain, specify a prefix of '/usr/bin' for the
toolchain/compiler and see what happens.

-Steve
