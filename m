From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Apr 2010 09:51:13 +0200
Subject: [Buildroot] [PATCH] toolchain: fix using external toolchains
	built with buildroot
In-Reply-To: <20100406225010.23853.36745.stgit@roazhon.bzh.lan> (Yann
	E. MORIN's message of "Wed, 07 Apr 2010 00:50:10 +0200")
References: <20100406224918.23853.83103.stgit@roazhon.bzh.lan>
	<20100406225010.23853.36745.stgit@roazhon.bzh.lan>
Message-ID: <878w8zr98u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
 Yann> The toolchains built with buildroot use specially crafted paths for their
 Yann> sysroot and prefix. Fix that by asking gcc where it finds a file we
 Yann> know by relative path to the sysroot.

 Yann> This has the side effect of greatly simplifying the sysroot detection
 Yann> in every cases tested so far (BR toolchains, CT-NG toolchains, and
 Yann> CodeSourcery toolchains).

Committed, thanks all of you. Yann, don' forget to sign off on your
patches (-s option).

-- 
Bye, Peter Korsgaard
