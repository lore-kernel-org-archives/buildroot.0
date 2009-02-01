From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Feb 2009 16:03:39 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
In-Reply-To: <873af0mvws.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Fri\, 30 Jan 2009 20\:33\:07 +0100")
References: <873af0mvws.fsf@macbook.be.48ers.dk>
Message-ID: <874ozei4hg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> Hi,
 Peter> Why is it again we have special handling of Atmel targets?

..
 Peter> target/linux/Config.in.advanced:        default y if BR2_TARGET_ATMEL

 Peter> Do we really need that? It would imho be a lot more sensible if BR
 Peter> behaved the same way for all archs.

No objections? Good, then I'll remove them.

-- 
Bye, Peter Korsgaard
