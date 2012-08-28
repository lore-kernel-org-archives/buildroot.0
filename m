From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Tue, 28 Aug 2012 11:30:47 +0100
Subject: [Buildroot] Generating external toolchains with Buildroot
In-Reply-To: <20120825113012.44b2612f@skate>
References: <20120825113012.44b2612f@skate>
Message-ID: <638833.90681.bm@smtp145.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> For the toolchains that I've put online at
> http://autobuild.buildroot.org/toolchains/tarballs/, I've solved this
> problem by modifying Buildroot so that it builds mpfr, gmp and mpc as
> static libraries, so that the gcc binaries do not depend to any shared
> libraries besides the C library. And this seems to work fine, though it
> is not a completely satisfying solution.

What's the draw back there?

-- 
_______________________________________________________________________

'Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface'

(Doug McIlroy)
_______________________________________________________________________
