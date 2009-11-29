From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Nov 2009 19:37:55 +0100
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
	OS X
In-Reply-To: <4B128965.2090303@usask.ca> (Nicholas Kinar's message of "Sun\,
	29 Nov 2009 08\:47\:01 -0600")
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca>
Message-ID: <87einh2n3w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Kinar <n.kinar@usask.ca> writes:

Hi,

 Nicholas> Thank you so much for your response!  I agree that Linux
 Nicholas> systems are much, much better than generic Unix, and I
 Nicholas> actually run buildroot for the AVR32 architecture on a very
 Nicholas> nice Ubuntu box. (No virtualization required.)  However,
 Nicholas> there are a few programs that I would also like to use on Mac
 Nicholas> OS X, and imho it would be nice to do everything on the same
 Nicholas> operating system.  I also have some hardware which is
 Nicholas> unfortunately not supported on Linux.

OK. I still think you'll have an easier time doing your buildroot work
on a (virtual) Linux box, but it's your choice..

 Nicholas> I have tried to compile buildroot on Mac OS X.  Using some
 Nicholas> packages from the Fink project (i.e. binutils), I can coax
 Nicholas> buildroot to partially compile.  However, the compilation
 Nicholas> seems to crash when it encounters uclibc.

 Nicholas> I know that the Gumstix folks seem to keep a separate build
 Nicholas> for Mac OS X:

 Nicholas> http://docwiki.gumstix.org/index.php/Buildroot_on_MacOSX

Yes, the gumstix people unfortunately haven't been that good at
submitting their fixes back to us :/

 Nicholas> To me, it seemed a bit of a shame to keep a separate build,
 Nicholas> and it would be nice to perhaps merge this into the main
 Nicholas> distribution, at least imho to allow for buildroot to compile
 Nicholas> on all Linux and Unix systems.  I suppose that my desire to
 Nicholas> do compilation on a Unix system is more for philosophical
 Nicholas> rather than for practical reasons.

I agree that there isn't any technical reason why BR shouldn't work on
MacOSX, but currently there's no active developers using it (I do write
this on a macbook, but I very rarely boot into macosx).

The problem isn't just getting the makefiles of BR to work on MacOSX,
the biggest problem is all the build scripts of the individual packages.

With that said, patches to make stuff work better on MacOSX are welcome,
as long as they aren't too ugly / add too much extra complexity for such
a rarely used setup.

-- 
Bye, Peter Korsgaard
