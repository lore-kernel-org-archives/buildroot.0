From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 09:05:00 +0200
Subject: [Buildroot] Debugging VICE emulator for AVR32
In-Reply-To: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
	(John Voltz's message of "Wed\, 18 Jun 2008 21\:44\:05 -0400")
References: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
Message-ID: <877iclx5ur.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John> Hi,

 John> For some time now, I have been trying to debug the VICE
 John> emulator in buildroot.  There seems to be a problem with uClibc
 John> 0.9.29. VICE will not start on x86 or on AVR32, but it would
 John> run in the past on uClibc 0.9.28. In fact, the old binary of
 John> VICE that I built for 0.9.28 will run with 0.9.29. I find that
 John> strange. I'm hoping someone can help me make sense of the gdb
 John> info. Here is where the segfault occurs immediately after
 John> starting VICE on AVR32:

I've also noticed pthread problems with avahi on uclibc 0.9.29 (on
PPC), but I haven't had time to debug it yet. The same setup works
with 0.9.28.3.

-- 
Bye, Peter Korsgaard
