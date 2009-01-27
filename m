From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 13:45:53 +0100
Subject: [Buildroot] alsa lib problem
In-Reply-To: <497EFEDC.3040606@carallon.com> (Will Wagner's message of "Tue\,
	27 Jan 2009 12\:32\:28 +0000")
References: <497E0B14.8040801@carallon.com>
	<87ocxt2t8g.fsf@macbook.be.48ers.dk> <497EFEDC.3040606@carallon.com>
Message-ID: <87r62o29z2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 >> If the kernel interface is always with an 32bit offset, then asound.h
 >> should probably be changed to use a 32bit data type instead. Could you
 >> try changing it to an unsigned int and recompile?

 Will> Yes is I change the asound.h header it does work.

Great.

 Will> What is the best way to proceed from here? Just patch alsa?

Well, I would bring the issue up on the alsa list so we can get a real
fix upstream, but we could carry a patch in BR for now.

I'll whip one up shortly.

-- 
Bye, Peter Korsgaard
