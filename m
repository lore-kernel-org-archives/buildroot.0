From: Nicholas Kinar <n.kinar@usask.ca>
Date: Sun, 29 Nov 2009 08:47:01 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <87vdgt3eh8.fsf@macbook.be.48ers.dk>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
Message-ID: <4B128965.2090303@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
> I haven't heard about anyone doing it, and as you see, the posting about
> it is almost 3 years old.
>
> Why would you want to do it in the first place? Doing Linux development
> on !Linux systems is imho a recipe for pain.
>
>   
Hi Peter--

Thank you so much for your response!  I agree that Linux systems are 
much, much better than generic Unix, and I actually run buildroot for 
the AVR32 architecture on a very nice Ubuntu box. (No virtualization 
required.)  However, there are a few programs that I would also like to 
use on Mac OS X, and imho it would be nice to do everything on the same 
operating system.  I also have some hardware which is unfortunately not 
supported on Linux.

I have tried to compile buildroot on Mac OS X.  Using some packages from 
the Fink project (i.e. binutils), I can coax buildroot to partially 
compile.  However, the compilation seems to crash when it encounters uclibc.

I know that the Gumstix folks seem to keep a separate build for Mac OS X:

http://docwiki.gumstix.org/index.php/Buildroot_on_MacOSX

To me, it seemed a bit of a shame to keep a separate build, and it would 
be nice to perhaps merge this into the main distribution, at least imho 
to allow for buildroot to compile on all Linux and Unix systems.  I 
suppose that my desire to do compilation on a Unix system is more for 
philosophical rather than for practical reasons.

Nicholas
