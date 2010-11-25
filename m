From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Nov 2010 14:35:21 +0100
Subject: [Buildroot] AT91SAM9G20 Buildroot Hangs
In-Reply-To: <AANLkTinY7n6ZHH4Ci8A4KwGeZ-5gv0WkTSqY1hPQxuuk@mail.gmail.com>
	(Paulius Zaleckas's message of "Thu, 25 Nov 2010 15:14:43 +0200")
References: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
	<AANLkTikmMd6z05CAzXN+e4AM5R4FvcinKgsDJZEOC1Lo@mail.gmail.com>
	<0C11C5BF0B29FD43A8D0250F711D497F7FB01A6631@ex01-ubitronix.ubitronix.local>
	<AANLkTinY7n6ZHH4Ci8A4KwGeZ-5gv0WkTSqY1hPQxuuk@mail.gmail.com>
Message-ID: <87ipzl34rq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> On Thu, Nov 25, 2010 at 3:07 PM, Abhishek Ashtekar
 Paulius> <Abhishek.Ashtekar@ubitronix.com> wrote:
 >> Hello Paulius,
 >> 
 >> Attaching the /etc/inittab

 Paulius> Ok. Check out Peters response. The problem is here:

 Paulius> # Put a getty on the serial port
 Paulius> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

 Paulius> as you can see getty is commented out here. I guess serial port is not
 Paulius> correct either.

It is (according to the kernel cmdline), so just remove the '#' at the
beginning of the line.

-- 
Bye, Peter Korsgaard
