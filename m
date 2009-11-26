From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 22:36:23 +0100
Subject: [Buildroot] Non-x86 support question
In-Reply-To: <200911261521.32631.minimod@morethan.org> (Michael S. Zick's
	message of "Thu\, 26 Nov 2009 15\:21\:30 -0600")
References: <200911261521.32631.minimod@morethan.org>
Message-ID: <87zl696ka0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> Just wondering, does buildroot get tested as a cross-compiler
 Michael> building native toolchain?

The BR2_PACKAGE_GCC_TARGET? No, that isn't commonly used. That doesn't
mean that it shouldn't work ofcourse.

 Michael> There is a similar bug posted, which I think refers to building
 Michael> the foreign, native, compiler.
 Michael> At least that is my own problem.  ;)

 Michael> In my case, gcc's configure is failing when it tries to test for
 Michael> the presence of mpfr (which is present, and built) - - -
 Michael> (No problem with gpm) 

Hmm, it worked for me last time I tried (some time this summer).

 Michael> I have captured the configure command being run and the test file,
 Michael> then ran them "by hand" with -v the best I can figure out at
 Michael> that point is:

Could you provide a bit more details? What goes wrong?

 Michael> A true puzzle, not a show-stopper here, anytime by 2010.02
 Michael> would be fine.  This is gcc-4.3.whatever targeting mipsel.

It would be good if you could add a bugreport to bugzilla so we don't
forget about it.

-- 
Bye, Peter Korsgaard
