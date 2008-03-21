From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2008 12:39:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
In-Reply-To: <20080321112103.A34573C2F3@busybox.net> (ninevoltz@uclibc.org's
	message of "Fri\, 21 Mar 2008 04\:21\:03 -0700 \(PDT\)")
References: <20080321112103.A34573C2F3@busybox.net>
Message-ID: <87lk4cxq51.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-21 04:21:02 -0700 (Fri, 21 Mar 2008)
 ninevoltz> New Revision: 21439

 ninevoltz> Log:
 ninevoltz> current avr32 gcc patches break x86 and possibly other
 ninevoltz> systems. moving bad patches to separate directory until a
 ninevoltz> proper fix is made. discovered by jacmet and Dr. Nigel
 ninevoltz> Kukard 

Thanks!

So I take it that gcc 4.2.1 is broken on AVR32 now? Perhaps you could
add a conditional in gcc-uclibc-4.x.mk like the ones for ARM to apply
these patches for AVR32?

-- 
Bye, Peter Korsgaard
