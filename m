From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Aug 2010 20:25:56 +0200
Subject: [Buildroot] Building external i586 ARM cross toolchain on x64
 Linux
In-Reply-To: <i3p3rq$ve8$1@dough.gmane.org>
References: <AANLkTik6X-qDUV4Uxf6x7FfBwZG6SinA7gzFC+18Aefa@mail.gmail.com>
	<i3hrp5$nia$1@dough.gmane.org>
	<AANLkTi=cJmoQ=45zMBcS2pQeyEENWgtXtic8=Z-U8TLT@mail.gmail.com>
	<i3p3rq$ve8$1@dough.gmane.org>
Message-ID: <20100810202556.5835c406@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Aug 2010 14:37:47 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> If what you want to do is use Buildroot on architecture A to build a
> compiler to run on architecture B for for a target with architecture
> C, then that's called a "Canadian Cross", and I don't think buildroot
> will do that (unless there's some special case in gcc/binutils for the
> IA32 and AMD64 architectures).

Yes, we don't support Canadian Cross builds in Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
