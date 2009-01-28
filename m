From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 16:34:16 +0100
Subject: [Buildroot] alsa lib problem
In-Reply-To: <497EFEDC.3040606@carallon.com> (Will Wagner's message of "Tue\,
	27 Jan 2009 12\:32\:28 +0000")
References: <497E0B14.8040801@carallon.com>
	<87ocxt2t8g.fsf@macbook.be.48ers.dk> <497EFEDC.3040606@carallon.com>
Message-ID: <877i4fv407.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 >> If the kernel interface is always with an 32bit offset, then asound.h
 >> should probably be changed to use a 32bit data type instead. Could you
 >> try changing it to an unsigned int and recompile?

 Will> Yes is I change the asound.h header it does work.

 Will> What is the best way to proceed from here? Just patch alsa?

Yes, I checked in the patch Takashi Iwai committed to alsa-lib.git as
r25101.

Thanks.

-- 
Bye, Peter Korsgaard
