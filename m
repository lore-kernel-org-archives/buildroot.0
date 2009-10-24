From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Oct 2009 20:31:17 +0200
Subject: [Buildroot] Nano runtime error
In-Reply-To: <4AE303B6.4090605@ethertek.ca> (Dan Pattison's message of "Sat\,
	24 Oct 2009 06\:40\:06 -0700")
References: <4AE1582B.9050106@ethertek.ca> <4AE303B6.4090605@ethertek.ca>
Message-ID: <87tyxozlsa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:

 Dan> Hello Peter,

Hi,

Please don't mail me directly - That's what we have the mailing list
for.

 Dan> I asked my question on the mailing list but did not receive a
 Dan> reply.

You are too impatient - This is no commercial support system, you only
sent you mail yesterday.

 Dan> Could you please send me the nano binary file compiled for
 Dan> ATMEL ARM AT91SAMG20. I am having problems making mine work on my ARM
 Dan> hardware.

No I cannot. I don't have a rootfs with nano at hand, and even if I did,
the result would presumably be the same.

 Dan> I would like to know if there is a problem with my development
 Dan> environment, or if it is a nano compiling issue. I keep getting
 Dan> the error nano: can't resolve symbol '__ctype_b' when running nano
 Dan> on our hardware.

Have you tried debugging it? Do your C library have a __ctype_b symbol?
From a quick google search there seem(ed) to be some issues with
__ctype_b and uclibc with locales enabled - Do you have locales enabled?

-- 
Bye, Peter Korsgaard
