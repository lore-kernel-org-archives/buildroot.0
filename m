From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Apr 2010 09:00:51 +0200
Subject: [Buildroot] [PATCH] toolchain: fix using external toolchains
 built with buildroot
In-Reply-To: <20100406225010.23853.36745.stgit@roazhon.bzh.lan>
References: <20100406224918.23853.83103.stgit@roazhon.bzh.lan>
	<20100406225010.23853.36745.stgit@roazhon.bzh.lan>
Message-ID: <20100407090051.67cccb26@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 07 Apr 2010 00:50:10 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> The toolchains built with buildroot use specially crafted paths for their
> sysroot and prefix. Fix that by asking gcc where it finds a file we
> know by relative path to the sysroot.
> 
> This has the side effect of greatly simplifying the sysroot detection
> in every cases tested so far (BR toolchains, CT-NG toolchains, and
> CodeSourcery toolchains).

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter: could you not merge this patch yet ? I'd like to carry this patch
in my codesourcery-toolchain-support branch, which I'll resubmit in the
next few days (after fixing a few minor issues discovered by Yann after
reviewing my patches) ? This would allow me to test the thing as a
whole, with CT-NG toolchains, Buildroot toolchains and CodeSourcery
toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
