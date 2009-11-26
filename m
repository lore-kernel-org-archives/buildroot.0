From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 26 Nov 2009 15:21:30 -0600
Subject: [Buildroot] Non-x86 support question
Message-ID: <200911261521.32631.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just wondering, does buildroot get tested as a cross-compiler
building native toolchain?

There is a similar bug posted, which I think refers to building
the foreign, native, compiler.
At least that is my own problem.  ;)

In my case, gcc's configure is failing when it tries to test for
the presence of mpfr (which is present, and built) - - -
(No problem with gpm) 

I have captured the configure command being run and the test file,
then ran them "by hand" with -v the best I can figure out at that point is:

The "canned" test routine is test compiled with the working
cross-compiler - and it can't find the mpf header file.

But all of the gcc command line options seem correct to my eye, and the
search paths that -v reports that gcc is using seem correct.

A true puzzle, not a show-stopper here, anytime by 2010.02 would be fine.
This is gcc-4.3.whatever targeting mipsel.

Mike
