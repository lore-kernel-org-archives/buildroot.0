From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 27 Jan 2009 12:32:28 +0000
Subject: [Buildroot] alsa lib problem
In-Reply-To: <87ocxt2t8g.fsf@macbook.be.48ers.dk>
References: <497E0B14.8040801@carallon.com>
	<87ocxt2t8g.fsf@macbook.be.48ers.dk>
Message-ID: <497EFEDC.3040606@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> 
> We unconditinally add the largefile stuff to TARGET_CFLAGS, which
> apparently isn't a good idea for alsa.
> 
> If the kernel interface is always with an 32bit offset, then asound.h
> should probably be changed to use a 32bit data type instead. Could you
> try changing it to an unsigned int and recompile?

Yes is I change the asound.h header it does work.

What is the best way to proceed from here? Just patch alsa?

Thanks for your help,

Will.

> 

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
