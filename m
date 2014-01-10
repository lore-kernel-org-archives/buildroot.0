From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Jan 2014 00:15:42 +0100
Subject: [Buildroot] [PATCH] ltrace: narrow down available architectures
In-Reply-To: <1389306767-18579-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 9 Jan 2014 19:32:47 -0300")
References: <1389306767-18579-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqi75syp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > First switch the architecture availability to positive logic since it's
 > cleaner and avoids issues when new ones are introduced.
 > Then look at the source for the available ones at sysdeps/linux-gnu/...

 > aarch64 -> NULL
 > arc -> NULL
 > arm -> hardcoded to little endian, so no armeb
 > avr32 -> NULL
 > blackfin -> NULL
 > microblaze -> NULL
 > mips -> little/big endian handled but not for 64 bits
 > nios2 -> NULL
 > ppc -> OK
 > sh -> NULL
 > sparc -> OK
 > x86 -> Both i386 and x86_64 handled
 > xtensa -> NULL

 > Fixes:
 > http://autobuild.buildroot.net/results/cd2/cd24e7b6f863ab413d76ca7a81bd357ddf1dc4f7/

Committed, thanks.

-- 
Bye, Peter Korsgaard
