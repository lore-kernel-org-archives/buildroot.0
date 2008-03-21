From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 07:55:36 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
In-Reply-To: <87lk4cxq51.fsf@macbook.be.48ers.dk>
References: <20080321112103.A34573C2F3@busybox.net>
	<87lk4cxq51.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd rather leave it unusable until Atmel (or someone else) can fix it
properly. It has caused way too many people headaches and wasted LOTS of
people's time tracking down the causes of bugs and weirdness.

John


On Fri, Mar 21, 2008 at 7:39 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
>
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-03-21 04:21:02 -0700 (Fri, 21 Mar 2008)
>  ninevoltz> New Revision: 21439
>
>  ninevoltz> Log:
>  ninevoltz> current avr32 gcc patches break x86 and possibly other
>  ninevoltz> systems. moving bad patches to separate directory until a
>  ninevoltz> proper fix is made. discovered by jacmet and Dr. Nigel
>  ninevoltz> Kukard
>
> Thanks!
>
> So I take it that gcc 4.2.1 is broken on AVR32 now? Perhaps you could
> add a conditional in gcc-uclibc-4.x.mk like the ones for ARM to apply
> these patches for AVR32?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/28a264c6/attachment.htm 
